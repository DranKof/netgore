using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using DemoGame.Server.DbObjs;
using log4net;

namespace DemoGame.Server.Queries
{
    public static class DBTableValidator
    {
        static readonly ILog log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        static void EnsureColumnsExist(DbController db, string dbTable, IEnumerable<string> columns)
        {
            var dbColumns = db.GetTableColumns(dbTable);
            foreach (string column in columns)
            {
                if (!dbColumns.Contains(column))
                    Error("Table `{0}` does not contain required column `{1}`.", dbTable, column);
            }
        }

        static void EnsureStatColumnsExist(DbController db, string dbTable, IEnumerable<StatType> columns,
                                           StatCollectionType statCollectionType)
        {
            EnsureColumnsExist(db, dbTable, columns.Select(x => x.GetDatabaseField(statCollectionType)));
        }

        static void Error(string message, params object[] parameters)
        {
            if (log.IsFatalEnabled)
                log.FatalFormat(message, parameters);

            Debug.Fail(string.Format(message, parameters));

            throw new Exception(string.Format("DB tables validation failed. Reason: " + message, parameters));
        }

        /// <summary>
        /// Performs validation checks on the Character table.
        /// </summary>
        /// <param name="db">The DbController to use for performing the validation checks.</param>
        static void ValidateCharacterTable(DbController db)
        {
            EnsureStatColumnsExist(db, CharacterTable.TableName, StatTypeHelper.AllValues, StatCollectionType.Base);
        }

        /// <summary>
        /// Performs validation checks on the CharacterTemplate table.
        /// </summary>
        /// <param name="db">The DbController to use for performing the validation checks.</param>
        static void ValidateCharacterTemplateTable(DbController db)
        {
            EnsureStatColumnsExist(db, CharacterTemplateTable.TableName, StatTypeHelper.AllValues, StatCollectionType.Base);
        }

        /// <summary>
        /// Performs validation checks on the database tables to ensure the schemas are correct.
        /// </summary>
        /// <param name="db">The DbController to use for performing the validation checks.</param>
        public static void ValidateTables(DbController db)
        {
            ValidateCharacterTable(db);
            ValidateCharacterTemplateTable(db);
        }

        static void Warn(string message, params object[] parameters)
        {
            if (log.IsWarnEnabled)
                log.WarnFormat(message, parameters);
            Debug.Fail(string.Format(message, parameters));
        }
    }
}