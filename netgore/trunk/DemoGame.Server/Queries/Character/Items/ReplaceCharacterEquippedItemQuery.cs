using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using DemoGame.Server.DbObjs;
using NetGore.Db;

namespace DemoGame.Server.Queries
{
    [DbControllerQuery]
    public class ReplaceCharacterEquippedItemQuery : DbQueryNonReader<CharacterEquippedTable>
    {
        static readonly string _queryStr = FormatQueryString("REPLACE INTO `{0}` SET {1}", CharacterEquippedTable.TableName,
                                                             FormatParametersIntoString(CharacterEquippedTable.DbColumns));

        /// <summary>
        /// Initializes a new instance of the <see cref="ReplaceCharacterEquippedItemQuery"/> class.
        /// </summary>
        /// <param name="connectionPool">The connection pool.</param>
        public ReplaceCharacterEquippedItemQuery(DbConnectionPool connectionPool) : base(connectionPool, _queryStr)
        {
        }

        /// <summary>
        /// When overridden in the derived class, creates the parameters this class uses for creating database queries.
        /// </summary>
        /// <returns>IEnumerable of all the DbParameters needed for this class to perform database queries. If null,
        /// no parameters will be used.</returns>
        protected override IEnumerable<DbParameter> InitializeParameters()
        {
            return CreateParameters(CharacterEquippedTable.DbColumns);
        }

        /// <summary>
        /// When overridden in the derived class, sets the database parameters based on the specified characterID.
        /// </summary>
        /// <param name="p">Collection of database parameters to set the values for.</param>
        /// <param name="item">Item used to execute the query.</param>
        protected override void SetParameters(DbParameterValues p, CharacterEquippedTable item)
        {
            item.CopyValues(p);
        }
    }
}