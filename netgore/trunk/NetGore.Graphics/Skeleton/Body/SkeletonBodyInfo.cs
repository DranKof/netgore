using System.Linq;
using NetGore.IO;

namespace NetGore.Graphics
{
    /// <summary>
    /// Describes a graphical body over a <see cref="Skeleton"/>. Only one instance of this class is to be created
    /// for each unique body layout.
    /// </summary>
    public class SkeletonBodyInfo
    {
        /// <summary>
        /// The file suffix used for the SkeletonBody.
        /// </summary>
        public const string FileSuffix = ".skelb";

        const string _itemsNodeName = "BodyItems";
        const string _rootNodeName = "SkeletonBody";

        /// <summary>
        /// An array of all the SkeletonBodyItemInfos in this SkeletonBodyInfo
        /// </summary>
        SkeletonBodyItemInfo[] _items;

        /// <summary>
        /// Initializes a new instance of the <see cref="SkeletonBodyInfo"/> class.
        /// </summary>
        /// <param name="items">SkeletonBodyItemInfos to create the SkeletonBodyInfo from.</param>
        public SkeletonBodyInfo(SkeletonBodyItemInfo[] items)
        {
            _items = items;
        }

        public SkeletonBodyInfo(string skeletonBodyName, ContentPaths contentPath)
            : this(new XmlValueReader(GetFilePath(skeletonBodyName, contentPath), _rootNodeName))
        {
        }

        public SkeletonBodyInfo(IValueReader reader)
        {
            Read(reader);
        }

        /// <summary>
        /// Gets an array of all the SkeletonBodyItemInfos in this SkeletonBodyInfo
        /// </summary>
        internal SkeletonBodyItemInfo[] Items
        {
            get { return _items; }
        }

        /// <summary>
        /// Gets the absolute file path for a SkeletonBody file.
        /// </summary>
        /// <param name="skeletonSetName">The name of the SkeletonBody.</param>
        /// <param name="contentPath">The content path to use.</param>
        /// <returns>The absolute file path for a SkeletonBody file.</returns>
        public static string GetFilePath(string skeletonSetName, ContentPaths contentPath)
        {
            return contentPath.Skeletons.Join(skeletonSetName + FileSuffix);
        }

        public void Read(IValueReader reader)
        {
            _items = reader.ReadManyNodes(_itemsNodeName, x => new SkeletonBodyItemInfo(x));
        }

        public void Save(string filePath)
        {
            using (XmlValueWriter writer = new XmlValueWriter(filePath, _rootNodeName))
            {
                Write(writer);
            }
        }

        public void Write(IValueWriter writer)
        {
            writer.WriteManyNodes(_itemsNodeName, Items, ((w, item) => item.Write(w)));
        }
    }
}