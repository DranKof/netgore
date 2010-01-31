using System;
using System.Linq;
using NetGore.Features.Guilds;

namespace DemoGame.DbObjs
{
    /// <summary>
    /// Interface for a class that can be used to serialize values to the database table `guild_event`.
    /// </summary>
    public interface IGuildEventTable
    {
        /// <summary>
        /// Gets the value of the database column `arg0`.
        /// </summary>
        String Arg0 { get; }

        /// <summary>
        /// Gets the value of the database column `arg1`.
        /// </summary>
        String Arg1 { get; }

        /// <summary>
        /// Gets the value of the database column `arg2`.
        /// </summary>
        String Arg2 { get; }

        /// <summary>
        /// Gets the value of the database column `character_id`.
        /// </summary>
        CharacterID CharacterID { get; }

        /// <summary>
        /// Gets the value of the database column `created`.
        /// </summary>
        DateTime Created { get; }

        /// <summary>
        /// Gets the value of the database column `event_id`.
        /// </summary>
        Byte EventID { get; }

        /// <summary>
        /// Gets the value of the database column `guild_id`.
        /// </summary>
        GuildID GuildID { get; }

        /// <summary>
        /// Gets the value of the database column `id`.
        /// </summary>
        Int32 ID { get; }

        /// <summary>
        /// Gets the value of the database column `target_character_id`.
        /// </summary>
        CharacterID? TargetCharacterID { get; }

        /// <summary>
        /// Creates a deep copy of this table. All the values will be the same
        /// but they will be contained in a different object instance.
        /// </summary>
        /// <returns>
        /// A deep copy of this table.
        /// </returns>
        IGuildEventTable DeepCopy();
    }
}