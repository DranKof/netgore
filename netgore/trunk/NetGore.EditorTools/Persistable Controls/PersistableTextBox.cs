using System.Linq;
using System.Windows.Forms;
using NetGore.IO;

namespace NetGore.EditorTools
{
    /// <summary>
    /// A <see cref="TextBox"/> that implements <see cref="IPersistable"/>.
    /// </summary>
    public class PersistableTextBox : TextBox, IPersistable
    {
        const string _multilineValueKey = "Multiline";
        const string _textValueKey = "Text";

        #region IPersistable Members

        /// <summary>
        /// Reads the state of the object from an <see cref="IValueReader"/>. Values should be read in the exact
        /// same order as they were written.
        /// </summary>
        /// <param name="reader">The <see cref="IValueReader"/> to read the values from.</param>
        public void ReadState(IValueReader reader)
        {
            Multiline = reader.ReadBool(_multilineValueKey);
            Text = reader.ReadString(_textValueKey);
        }

        /// <summary>
        /// Writes the state of the object to an <see cref="IValueWriter"/>.
        /// </summary>
        /// <param name="writer">The <see cref="IValueWriter"/> to write the values to.</param>
        public void WriteState(IValueWriter writer)
        {
            writer.Write(_multilineValueKey, Multiline);
            writer.Write(_textValueKey, Text);
        }

        #endregion
    }
}