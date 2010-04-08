using System.IO;
using System.Linq;
using NetGore.Content;
using NetGore.IO;
using SFML.Audio;

namespace NetGore.Audio
{
    /// <summary>
    /// Manages the music.
    /// </summary>
    public sealed class MusicManager : AudioManagerBase<IMusic, MusicID>
    {
        static readonly object _instanceLock = new object();
        static volatile MusicManager _instance;

        IMusic _currentlyPlaying;

        /// <summary>
        /// Initializes a new instance of the <see cref="MusicManager"/> class.
        /// </summary>
        /// <param name="cm">The <see cref="IContentManager"/>.</param>
        MusicManager(IContentManager cm)
            : base(cm, ContentPaths.Build.Data.Join("music.xml"), "Music", "Music" + Path.DirectorySeparatorChar)
        {
        }

        /// <summary>
        /// Gets the <see cref="IMusic"/> currently playing. Can be null. It is recommended you do not call any of
        /// the methods on the returned instance.
        /// </summary>
        public IMusic CurrentMusic
        {
            get { return _currentlyPlaying; }
        }

        /// <summary>
        /// Gets the state of the music.
        /// </summary>
        public SoundStatus MusicState
        {
            get
            {
                if (_currentlyPlaying == null)
                    return SoundStatus.Stopped;

                return _currentlyPlaying.State;
            }
        }

        /// <summary>
        /// Gets an instance of the <see cref="MusicManager"/> for the given <paramref name="contentManager"/>.
        /// Only the first <see cref="IContentManager"/> passed to this method will be used. Successive calls
        /// can pass a null <see cref="IContentManager"/>, but doing so is not recommended if it can be avoided.
        /// This method is thread-safe, but it is recommended that you store the returned object in a local
        /// member if you want to access it frequently to avoid the overhead of thread synchronization.
        /// </summary>
        /// <param name="contentManager">The <see cref="IContentManager"/>.</param>
        /// <returns>An instance of the <see cref="MusicManager"/> for the given
        /// <paramref name="contentManager"/>.</returns>
        public static MusicManager GetInstance(IContentManager contentManager)
        {
            lock (_instanceLock)
            {
                if (_instance == null)
                    _instance = new MusicManager(contentManager);

                return _instance;
            }
        }

        /// <summary>
        /// When overridden in the derived class, converts the <paramref name="value"/>.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns>The converted value.</returns>
        protected override int IDToInt(MusicID value)
        {
            return (int)value;
        }

        /// <summary>
        /// When overridden in the derived class, converts the <paramref name="value"/>.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <returns>The converted value.</returns>
        protected override MusicID IntToID(int value)
        {
            return new MusicID(value);
        }

        /// <summary>
        /// Pauses the music if there is music already playing.
        /// </summary>
        public void Pause()
        {
            if (_currentlyPlaying == null)
                return;

            _currentlyPlaying.Pause();
        }

        /// <summary>
        /// When overridden in the derived class, handles creating and reading an object
        /// from the given <paramref name="reader"/>.
        /// </summary>
        /// <param name="reader"><see cref="IValueReader"/> used to read the object values from.</param>
        /// <returns>Instance of the object created using the <paramref name="reader"/>.</returns>
        protected override IMusic ReadHandler(IValueReader reader)
        {
            return new MusicTrack(this, reader);
        }

        /// <summary>
        /// When overridden in the derived class, reapplies the Volume property value to all the
        /// audio tracks in this manager.
        /// </summary>
        protected internal override void ReapplyVolume()
        {
            // TODO: ## MediaPlayer.Volume = MasterVolume;
        }

        /// <summary>
        /// Resumes the music if possible.
        /// </summary>
        public void Resume()
        {
            if (_currentlyPlaying == null)
                return;

            _currentlyPlaying.Resume();
        }

        /// <summary>
        /// Stops the loaded music.
        /// </summary>
        public override void Stop()
        {
            if (_currentlyPlaying == null)
                return;

            _currentlyPlaying.Stop();
            _currentlyPlaying = null;
        }

        /// <summary>
        /// When overridden in the derived class, tries to play an audio track.
        /// </summary>
        /// <param name="name">The name of the audio track.</param>
        /// <returns>True if the audio track was successfully played; otherwise false.</returns>
        public override bool TryPlay(string name)
        {
            var item = GetItem(name);
            return TryPlay(item);
        }

        /// <summary>
        /// When overridden in the derived class, tries to play an audio track.
        /// </summary>
        /// <param name="id">The id of the audio track.</param>
        /// <returns>True if the audio track was successfully played; otherwise false.</returns>
        public override bool TryPlay(MusicID id)
        {
            var item = GetItem(id);
            return TryPlay(item);
        }

        /// <summary>
        /// Tries to play a music track.
        /// </summary>
        /// <param name="music">The music.</param>
        /// <returns>True if the track was successfully played; otherwise false.</returns>
        bool TryPlay(IMusic music)
        {
            if (music == null)
                return false;

            if (_currentlyPlaying != null)
                _currentlyPlaying.Stop();

            music.Play();
            _currentlyPlaying = music;

            return true;
        }
    }
}