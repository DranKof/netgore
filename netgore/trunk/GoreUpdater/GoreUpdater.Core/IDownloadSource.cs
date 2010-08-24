﻿using System.Linq;

namespace GoreUpdater.Core
{
    public interface IDownloadSource
    {
        /// <summary>
        /// Notifies listeners when this <see cref="IDownloadSource"/> has finished downloading a file.
        /// </summary>
        event DownloadSourceFileEventHandler DownloadFinished;

        /// <summary>
        /// Gets if this <see cref="IDownloadSource"/> can start a download.
        /// </summary>
        bool CanDownload { get; }

        /// <summary>
        /// Starts downloading a file.
        /// </summary>
        /// <param name="remoteFile">The file to download.</param>
        /// <param name="localFilePath">The complete file path that will be used to store the downloaded file.</param>
        /// <returns>True if the download was successfully started; otherwise false.</returns>
        bool Download(string remoteFile, string localFilePath);
    }
}