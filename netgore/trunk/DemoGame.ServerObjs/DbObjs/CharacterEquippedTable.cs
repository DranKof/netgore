using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using NetGore.Db;

namespace DemoGame.Server.DbObjs
{
    /// <summary>
    /// Interface for a class that can be used to serialize values to the database table `character_equipped`.
    /// </summary>
    public interface ICharacterEquippedTable
    {
        /// <summary>
        /// Gets the value for the database column `character_id`.
        /// </summary>
        UInt32 CharacterId { get; }

        /// <summary>
        /// Gets the value for the database column `item_id`.
        /// </summary>
        UInt32 ItemId { get; }

        /// <summary>
        /// Gets the value for the database column `slot`.
        /// </summary>
        Byte Slot { get; }
    }

    /// <summary>
    /// Provides a strongly-typed structure for the database table `character_equipped`.
    /// </summary>
    public class CharacterEquippedTable : ICharacterEquippedTable
    {
        /// <summary>
        /// The number of columns in the database table that this class represents.
        /// </summary>
        public const Int32 ColumnCount = 3;

        /// <summary>
        /// The name of the database table that this class represents.
        /// </summary>
        public const String TableName = "character_equipped";

        /// <summary>
        /// Array of the database column names.
        /// </summary>
        static readonly String[] _dbColumns = new string[] { "character_id", "item_id", "slot" };

        /// <summary>
        /// The field that maps onto the database column `character_id`.
        /// </summary>
        UInt32 _characterId;

        /// <summary>
        /// The field that maps onto the database column `item_id`.
        /// </summary>
        UInt32 _itemId;

        /// <summary>
        /// The field that maps onto the database column `slot`.
        /// </summary>
        Byte _slot;

        /// <summary>
        /// Gets an IEnumerable of strings containing the names of the database columns for the table that this class represents.
        /// </summary>
        public IEnumerable<String> DbColumns
        {
            get { return _dbColumns; }
        }

        /// <summary>
        /// CharacterEquippedTable constructor.
        /// </summary>
        public CharacterEquippedTable()
        {
        }

        /// <summary>
        /// CharacterEquippedTable constructor.
        /// </summary>
        /// <param name="characterId">The initial value for the corresponding property.</param>
        /// <param name="itemId">The initial value for the corresponding property.</param>
        /// <param name="slot">The initial value for the corresponding property.</param>
        public CharacterEquippedTable(UInt32 @characterId, UInt32 @itemId, Byte @slot)
        {
            CharacterId = @characterId;
            ItemId = @itemId;
            Slot = @slot;
        }

        /// <summary>
        /// CharacterEquippedTable constructor.
        /// </summary>
        /// <param name="dataReader">The IDataReader to read the values from. See method ReadValues() for details.</param>
        public CharacterEquippedTable(IDataReader dataReader)
        {
            ReadValues(dataReader);
        }

        /// <summary>
        /// Copies the column values into the given Dictionary using the database column name
        /// with a prefixed @ as the key. The keys must already exist in the Dictionary;
        ///  this method will not create them if they are missing.
        /// </summary>
        /// <param name="source">The object to copy the values from.</param>
        /// <param name="dic">The Dictionary to copy the values into.</param>
        public static void CopyValues(ICharacterEquippedTable source, IDictionary<String, Object> dic)
        {
            dic["@character_id"] = source.CharacterId;
            dic["@item_id"] = source.ItemId;
            dic["@slot"] = source.Slot;
        }

        /// <summary>
        /// Copies the column values into the given DbParameterValues using the database column name
        /// with a prefixed @ as the key. The keys must already exist in the DbParameterValues;
        ///  this method will not create them if they are missing.
        /// </summary>
        /// <param name="source">The object to copy the values from.</param>
        /// <param name="paramValues">The DbParameterValues to copy the values into.</param>
        public static void CopyValues(ICharacterEquippedTable source, DbParameterValues paramValues)
        {
            paramValues["@character_id"] = source.CharacterId;
            paramValues["@item_id"] = source.ItemId;
            paramValues["@slot"] = source.Slot;
        }

        /// <summary>
        /// Copies the column values into the given Dictionary using the database column name
        /// with a prefixed @ as the key. The keys must already exist in the Dictionary;
        ///  this method will not create them if they are missing.
        /// </summary>
        /// <param name="dic">The Dictionary to copy the values into.</param>
        public void CopyValues(IDictionary<String, Object> dic)
        {
            CopyValues(this, dic);
        }

        /// <summary>
        /// Copies the column values into the given DbParameterValues using the database column name
        /// with a prefixed @ as the key. The keys must already exist in the DbParameterValues;
        ///  this method will not create them if they are missing.
        /// </summary>
        /// <param name="paramValues">The DbParameterValues to copy the values into.</param>
        public void CopyValues(DbParameterValues paramValues)
        {
            CopyValues(this, paramValues);
        }

        /// <summary>
        /// Reads the values from an IDataReader and assigns the read values to this
        /// object's properties. The database column's name is used to as the key, so the value
        /// will not be found if any aliases are used or not all columns were selected.
        /// </summary>
        /// <param name="dataReader">The IDataReader to read the values from. Must already be ready to be read from.</param>
        public void ReadValues(IDataReader dataReader)
        {
            CharacterId = (UInt32)dataReader.GetValue(dataReader.GetOrdinal("character_id"));
            ItemId = (UInt32)dataReader.GetValue(dataReader.GetOrdinal("item_id"));
            Slot = (Byte)dataReader.GetValue(dataReader.GetOrdinal("slot"));
        }

        #region ICharacterEquippedTable Members

        /// <summary>
        /// Gets or sets the value for the field that maps onto the database column `character_id`.
        /// The underlying database type is `int(10) unsigned`.
        /// </summary>
        public UInt32 CharacterId
        {
            get { return _characterId; }
            set { _characterId = value; }
        }

        /// <summary>
        /// Gets or sets the value for the field that maps onto the database column `item_id`.
        /// The underlying database type is `int(10) unsigned`.
        /// </summary>
        public UInt32 ItemId
        {
            get { return _itemId; }
            set { _itemId = value; }
        }

        /// <summary>
        /// Gets or sets the value for the field that maps onto the database column `slot`.
        /// The underlying database type is `tinyint(3) unsigned`.
        /// </summary>
        public Byte Slot
        {
            get { return _slot; }
            set { _slot = value; }
        }

        #endregion
    }
}