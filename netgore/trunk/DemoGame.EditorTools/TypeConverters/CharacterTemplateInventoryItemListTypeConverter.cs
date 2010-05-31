using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Text;
using DemoGame.Server;

namespace DemoGame.EditorTools
{
    /// <summary>
    /// A <see cref="TypeConverter"/> for a collection of <see cref="CharacterTemplateInventoryItem"/>s and values.
    /// </summary>
    public class CharacterTemplateInventoryItemListTypeConverter : TypeConverter
    {
        /// <summary>
        /// Returns whether this converter can convert the object to the specified type, using the specified context.
        /// </summary>
        /// <param name="context">An <see cref="T:System.ComponentModel.ITypeDescriptorContext"/>
        /// that provides a format context.</param>
        /// <param name="destinationType">A <see cref="T:System.Type"/> that represents the type
        /// you want to convert to.</param>
        /// <returns>
        /// true if this converter can perform the conversion; otherwise, false.
        /// </returns>
        public override bool CanConvertTo(ITypeDescriptorContext context, Type destinationType)
        {
            if (destinationType == typeof(string))
                return true;

            return base.CanConvertTo(context, destinationType);
        }

        /// <summary>
        /// Converts the given value object to the specified type, using the specified context and culture information.
        /// </summary>
        /// <param name="context">An <see cref="T:System.ComponentModel.ITypeDescriptorContext"/> that provides a
        /// format context.</param>
        /// <param name="culture">A <see cref="T:System.Globalization.CultureInfo"/>. If null is passed, the current
        /// culture is assumed.</param>
        /// <param name="value">The <see cref="T:System.Object"/> to convert.</param>
        /// <param name="destinationType">The <see cref="T:System.Type"/> to convert the <paramref name="value"/>
        /// parameter to.</param>
        /// <returns>
        /// An <see cref="T:System.Object"/> that represents the converted value.
        /// </returns>
        /// <exception cref="T:System.ArgumentNullException">The <paramref name="destinationType"/> parameter is null. </exception>
        /// <exception cref="T:System.NotSupportedException">The conversion cannot be performed. </exception>
        public override object ConvertTo(ITypeDescriptorContext context, CultureInfo culture, object value, Type destinationType)
        {
            if (destinationType == typeof(string))
            {
                var ev = value as IEnumerable<CharacterTemplateInventoryItem>;
                if (ev != null)
                {
                    var m = ItemTemplateManager.Instance;
                    if (m != null)
                    {
                        var sb = new StringBuilder();
                        foreach (var v in ev)
                        {
                            sb.Append("{");

                            sb.Append("[");
                            sb.Append(Math.Round(v.Chance.Percentage * 100f, 0));
                            sb.Append("] ");

                            var t = m[v.ID];
                            if (t == null)
                                sb.Append(v.ID.ToString());
                            else
                                sb.Append(t.Name);

                            sb.Append("}, ");
                        }

                        if (sb.Length > 2)
                            sb.Length -= 2;

                        return sb.ToString();
                    }
                }
            }

            return base.ConvertTo(context, culture, value, destinationType);
        }
    }
}