﻿/* Copyright (c) 2010 Michael Lidgren

Permission is hereby granted, free of charge, to any person obtaining a copy of this software
and associated documentation files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom
the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
using System.Linq;
using System.Net;

namespace Lidgren.Network
{
    /// <summary>
    /// Specialized version of NetPeer used for a "client" connection. It does not accept any incoming connections and maintains a ServerConnection property
    /// </summary>
    public class NetClient : NetPeer
    {
        public NetClient(NetPeerConfiguration config) : base(config)
        {
            config.AcceptIncomingConnections = false;
        }

        /// <summary>
        /// Gets the connection to the server, if any
        /// </summary>
        public NetConnection ServerConnection
        {
            get
            {
                NetConnection retval = null;
                if (m_connections.Count > 0)
                {
                    try
                    {
                        retval = m_connections[0];
                    }
                    catch
                    {
                        // preempted!
                        return null;
                    }
                }
                return retval;
            }
        }

        public override NetConnection Connect(IPEndPoint remoteEndpoint, NetOutgoingMessage hailMessage)
        {
            lock (m_connections)
            {
                if (m_connections.Count > 0)
                {
                    LogWarning("Connect attempt failed; Already connected");
                    return null;
                }
            }
            return base.Connect(remoteEndpoint, hailMessage);
        }

        /// <summary>
        /// Disconnect from server
        /// </summary>
        /// <param name="byeMessage">reason for disconnect</param>
        public void Disconnect(string byeMessage)
        {
            var serverConnection = ServerConnection;
            if (serverConnection == null)
            {
                LogWarning("Disconnect requested when not connected!");
                return;
            }
            serverConnection.Disconnect(byeMessage);
        }

        /// <summary>
        /// Sends message to server
        /// </summary>
        public NetSendResult SendMessage(NetOutgoingMessage msg, NetDeliveryMethod method)
        {
            var serverConnection = ServerConnection;
            if (serverConnection == null)
            {
                LogWarning("Cannot send message, no server connection!");
                return NetSendResult.Failed;
            }

            return serverConnection.SendMessage(msg, method, 0);
        }

        /// <summary>
        /// Sends message to server
        /// </summary>
        public NetSendResult SendMessage(NetOutgoingMessage msg, NetDeliveryMethod method, int sequenceChannel)
        {
            var serverConnection = ServerConnection;
            if (serverConnection == null)
            {
                LogWarning("Cannot send message, no server connection!");
                return NetSendResult.Failed;
            }

            return serverConnection.SendMessage(msg, method, sequenceChannel);
        }

        /// <summary>
        /// Returns a string that represents this object
        /// </summary>
        public override string ToString()
        {
            return "[NetClient " + ServerConnection + "]";
        }
    }
}