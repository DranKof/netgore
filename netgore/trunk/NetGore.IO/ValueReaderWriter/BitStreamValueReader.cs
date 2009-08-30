using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace NetGore.IO
{
    /// <summary>
    /// Implementation of the IValueReader using a BitStream.
    /// </summary>
    public class BitStreamValueReader : IValueReader
    {
        readonly BitStream _reader;

        /// <summary>
        /// BitStreamValueReader constructor.
        /// </summary>
        /// <param name="reader">BitStream that will be used to read from.</param>
        public BitStreamValueReader(BitStream reader)
        {
            if (reader == null)
                throw new ArgumentNullException("reader");
            if (reader.Mode != BitStreamMode.Read)
                throw new ArgumentException("The BitStream must be set to Read.", "reader");

            _reader = reader;
        }

        /// <summary>
        /// BitStreamValueReader constructor.
        /// </summary>
        /// <param name="filePath">The path of the file to read from.</param>
        public BitStreamValueReader(string filePath)
        {
            if (!File.Exists(filePath))
                throw new ArgumentException("The specified file could not be found.", "filePath");

            var bytes = File.ReadAllBytes(filePath);
            _reader = new BitStream(bytes);
        }

        #region IValueReader Members

        /// <summary>
        /// Reads a 8-bit unsigned integer.
        /// </summary>
        /// <param name="name">Unused by the BitStreamValueReader.</param>
        /// <returns>Value read from the reader.</returns>
        public byte ReadByte(string name)
        {
            return _reader.ReadByte();
        }

        /// <summary>
        /// Reads a 32-bit floating-point number.
        /// </summary>
        /// <param name="name">Unused by the BitStreamValueReader.</param>
        /// <returns>Value read from the reader.</returns>
        public float ReadFloat(string name)
        {
            return _reader.ReadFloat();
        }

        /// <summary>
        /// Reads multiple values that were written with WriteMany.
        /// </summary>
        /// <typeparam name="T">The Type of value to read.</typeparam>
        /// <param name="nodeName">The name of the node containing the values.</param>
        /// <param name="readHandler">Delegate that reads the values from the IValueReader.</param>
        /// <returns>Array of the values read the IValueReader.</returns>
        public T[] ReadMany<T>(string nodeName, ReadManyHandler<T> readHandler)
        {
            // TODO: !! ...
            throw new NotImplementedException();
        }

        /// <summary>
        /// Reads multiple nodes that were written with WriteMany.
        /// </summary>
        /// <typeparam name="T">The Type of nodes to read.</typeparam>
        /// <param name="nodeName">The name of the root node containing the values.</param>
        /// <param name="readHandler">Delegate that reads the values from the IValueReader.</param>
        /// <returns>Array of the values read the IValueReader.</returns>
        public T[] ReadManyNodes<T>(string nodeName, ReadManyNodesHandler<T> readHandler)
        {
            // TODO: !! ...
            throw new NotImplementedException();
        }

        /// <summary>
        /// Gets if this IValueReader supports using the name field to look up values. If false, values will have to
        /// be read back in the same order they were written and the name field will be ignored.
        /// </summary>
        public bool SupportsNameLookup
        {
            get { return false; }
        }

        /// <summary>
        /// Reads a 32-bit signed integer.
        /// </summary>
        /// <param name="name">Unused by the BitStreamValueReader.</param>
        /// <returns>Value read from the reader.</returns>
        public int ReadInt(string name)
        {
            return _reader.ReadInt();
        }

        /// <summary>
        /// Reads a signed integer of up to 32 bits.
        /// </summary>
        /// <param name="name">Unique name of the value to read.</param>
        /// <param name="bits">Number of bits to read.</param>
        /// <returns>Value read from the reader.</returns>
        public int ReadInt(string name, int bits)
        {
            return _reader.ReadInt(bits);
        }

        /// <summary>
        /// Reads a 8-bit signed integer.
        /// </summary>
        /// <param name="name">Unused by the BitStreamValueReader.</param>
        /// <returns>Value read from the reader.</returns>
        public sbyte ReadSByte(string name)
        {
            return _reader.ReadSByte();
        }

        /// <summary>
        /// Reads an unsigned integer of up to 32 bits.
        /// </summary>
        /// <param name="name">Unique name of the value to read.</param>
        /// <param name="bits">Number of bits to read.</param>
        /// <returns>Value read from the reader.</returns>
        public uint ReadUInt(string name, int bits)
        {
            return _reader.ReadUInt(bits);
        }

        /// <summary>
        /// Reads one or more child nodes from the IValueReader.
        /// </summary>
        /// <param name="name">Name of the nodes to read.</param>
        /// <param name="count">The number of nodes to read. Must be greater than 0. An ArgumentOutOfRangeException will
        /// be thrown if this value exceeds the actual number of nodes available.</param>
        /// <returns>An IEnumerable of IValueReaders used to read the nodes.</returns>
        /// <exception cref="ArgumentOutOfRangeException">Count is less than 0.</exception>
        public IEnumerable<IValueReader> ReadNodes(string name, int count)
        {
            if (count == 0)
                return Enumerable.Empty<IValueReader>();

            if (count < 0)
                throw new ArgumentOutOfRangeException("count");

            var ret = new IValueReader[count];
            for (int i = 0; i < count; i++)
            {
                uint bitLength = ReadUInt(null);
                BitStream bs = _reader.ReadBits((int)bitLength);
                ret[i] = new BitStreamValueReader(bs);
            }

            return ret;
        }

        /// <summary>
        /// Reads a single child node, while enforcing the idea that there should only be one node
        /// in the key. If there is more than one node for the given <paramref name="key"/>, an
        /// ArgumentException will be thrown.
        /// </summary>
        /// <param name="key">The key of the child node to read.</param>
        /// <returns>An IValueReader to read the child node.</returns>
        /// <exception cref="ArgumentException">Zero or more than one values found for the given
        /// <paramref name="key"/>.</exception>
        public IValueReader ReadNode(string key)
        {
            // TODO: !! ...
            throw new NotImplementedException();
        }

        /// <summary>
        /// Reads a boolean.
        /// </summary>
        /// <param name="name">Unique name of the value to read.</param>
        /// <returns>Value read from the reader.</returns>
        public bool ReadBool(string name)
        {
            return _reader.ReadBool();
        }

        /// <summary>
        /// Reads a 16-bit signed integer.
        /// </summary>
        /// <param name="name">Unused by the BitStreamValueReader.</param>
        /// <returns>Value read from the reader.</returns>
        public short ReadShort(string name)
        {
            return _reader.ReadShort();
        }

        /// <summary>
        /// Reads a variable-length string of up to 65535 characters in length.
        /// </summary>
        /// <param name="name">Unused by the BitStreamValueReader.</param>
        /// <returns>String read from the reader.</returns>
        public string ReadString(string name)
        {
            return _reader.ReadString();
        }

        /// <summary>
        /// Reads a 32-bit unsigned integer.
        /// </summary>
        /// <param name="name">Unused by the BitStreamValueReader.</param>
        /// <returns>Value read from the reader.</returns>
        public uint ReadUInt(string name)
        {
            return _reader.ReadUInt();
        }

        /// <summary>
        /// Reads a 16-bit unsigned integer.
        /// </summary>
        /// <param name="name">Unused by the BitStreamValueReader.</param>
        /// <returns>Value read from the reader.</returns>
        public ushort ReadUShort(string name)
        {
            return _reader.ReadUShort();
        }

        #endregion
    }
}