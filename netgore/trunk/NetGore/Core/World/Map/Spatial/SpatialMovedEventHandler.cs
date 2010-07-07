using System.Linq;

namespace NetGore.World
{
    /// <summary>
    /// Handles when an <see cref="ISpatial"/> has moved.
    /// </summary>
    /// <param name="sender">The <see cref="ISpatial"/> that moved.</param>
    /// <param name="e">The event argument.</param>
    public delegate void SpatialEventHandler<in T>(ISpatial sender, T e);
}