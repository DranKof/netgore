﻿using System;
using System.Linq;
using System.Text;
using System.Collections;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.ComponentModel.Design.Serialization;
using System.Reflection;
using System.Globalization;
using Microsoft.Xna.Framework;

namespace Microsoft.Xna.Framework.Design
{
    /// <summary>Provides a unified way of converting Rectangle values to other types, as well as for accessing standard values and subproperties.</summary>
public class RectangleConverter : MathTypeConverter
{
    /// <summary>Initializes a new instance of the RectangleConverter class.</summary>
    public RectangleConverter()
    {
        Type type = typeof(Rectangle);
        PropertyDescriptorCollection descriptors = new PropertyDescriptorCollection(new PropertyDescriptor[] { new FieldPropertyDescriptor(type.GetField("X")), new FieldPropertyDescriptor(type.GetField("Y")), new FieldPropertyDescriptor(type.GetField("Width")), new FieldPropertyDescriptor(type.GetField("Height")) });
        base.propertyDescriptions = descriptors;
        base.supportStringConvert = false;
    }

    /// <summary>Converts the given value object to the specified type, using the specified context and culture information.</summary>
    /// <param name="context">The format context.</param>
    /// <param name="culture">The culture to use in the conversion.</param>
    /// <param name="value">The object to convert.</param>
    /// <param name="destinationType">The destination type.</param>
    public override object ConvertTo(ITypeDescriptorContext context, CultureInfo culture, object value, Type destinationType)
    {
        if (destinationType == null)
        {
            throw new ArgumentNullException("destinationType");
        }
        if ((destinationType == typeof(InstanceDescriptor)) && (value is Rectangle))
        {
            Rectangle rectangle = (Rectangle) value;
            ConstructorInfo constructor = typeof(Rectangle).GetConstructor(new Type[] { typeof(int), typeof(int), typeof(int), typeof(int) });
            if (constructor != null)
            {
                return new InstanceDescriptor(constructor, new object[] { rectangle.X, rectangle.Y, rectangle.Width, rectangle.Height });
            }
        }
        return base.ConvertTo(context, culture, value, destinationType);
    }

    /// <summary>Creates an instance of the type that this RectangleConverter is associated with, using the specified context, given a set of property values for the object.</summary>
    /// <param name="context">The format context.</param>
    /// <param name="propertyValues">The new property values.</param>
    public override object CreateInstance(ITypeDescriptorContext context, IDictionary propertyValues)
    {
        if (propertyValues == null)
        {
            throw new ArgumentNullException("propertyValues", FrameworkResources.NullNotAllowed);
        }
        return new Rectangle((int) propertyValues["X"], (int) propertyValues["Y"], (int) propertyValues["Width"], (int) propertyValues["Height"]);
    }
}
}
