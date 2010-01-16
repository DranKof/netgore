using System.Linq;
using System.Windows.Forms;

namespace NetGore.EditorTools
{
    /// <summary>
    /// Interface for a <see cref="Control"/> that needs to know what the current <see cref="IMap"/> is.
    /// </summary>
    public interface IMapBoundControl
    {
        /// <summary>
        /// Gets or sets the current <see cref="IMap"/>.
        /// </summary>
        IMap IMap { get; set; }
    }
}