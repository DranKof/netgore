using System;
using System.Linq;
using DemoGame.DbObjs;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using NetGore;
using NetGore.Graphics;
using NetGore.Graphics.GUI;

namespace DemoGame.Client
{
    class InventoryForm : Form
    {
        /// <summary>
        /// Delegate for handling events related to items in the inventory.
        /// </summary>
        /// <param name="inventoryForm">The <see cref="InventoryForm"/> the event came from.</param>
        /// <param name="slot">The inventory item slot the event is related to.</param>
        public delegate void InventoryItemHandler(InventoryForm inventoryForm, InventorySlot slot);

        /// <summary>
        /// The number of items in each inventory row.
        /// </summary>
        const int _columns = 6;

        /// <summary>
        /// The size of each item box.
        /// </summary>
        static readonly Vector2 _itemSize = new Vector2(32, 32);

        /// <summary>
        /// The amount of space between each item.
        /// </summary>
        static readonly Vector2 _padding = new Vector2(2, 2);

        readonly ItemInfoRequesterBase<InventorySlot> _infoRequester;

        Inventory _inventory;

        /// <summary>
        /// Initializes a new instance of the <see cref="InventoryForm"/> class.
        /// </summary>
        /// <param name="infoRequester">The item info tooltip.</param>
        /// <param name="position">The position.</param>
        /// <param name="parent">The parent.</param>
        public InventoryForm(ItemInfoRequesterBase<InventorySlot> infoRequester, Vector2 position, Control parent)
            : base(parent, position, new Vector2(200, 200))
        {
            if (infoRequester == null)
                throw new ArgumentNullException("infoRequester");

            _infoRequester = infoRequester;

            Vector2 itemsSize = _columns * _itemSize;
            Vector2 paddingSize = (_columns + 1) * _padding;
            Size = itemsSize + paddingSize + Border.Size;

            CreateItemSlots();
        }

        /// <summary>
        /// Notifies listeners when an item was requested to be dropped.
        /// </summary>
        public event InventoryItemHandler RequestDropItem;

        /// <summary>
        /// Notifies listeners when an item was requested to be used.
        /// </summary>
        public event InventoryItemHandler RequestUseItem;

        public Inventory Inventory
        {
            get { return _inventory; }
            set { _inventory = value; }
        }

        void CreateItemSlots()
        {
            Vector2 offset = _padding;
            Vector2 offsetMultiplier = _itemSize + _padding;

            for (int i = 0; i < GameData.MaxInventorySize; i++)
            {
                int x = i % _columns;
                int y = i / _columns;
                Vector2 pos = offset + new Vector2(x, y) * offsetMultiplier;

                new InventoryItemPB(this, pos, new InventorySlot(i));
            }
        }

        void InventoryItemPB_OnMouseUp(object sender, MouseClickEventArgs e)
        {
            InventoryItemPB itemPB = (InventoryItemPB)sender;

            if (e.Button == MouseButtons.Right)
            {
                if (GUIManager.KeysPressed.Contains(Keys.LeftShift) || GUIManager.KeysPressed.Contains(Keys.RightShift))
                {
                    // Drop
                    if (RequestDropItem != null)
                        RequestDropItem(this, itemPB.Slot);
                }
                else
                {
                    // Use
                    if (RequestUseItem != null)
                        RequestUseItem(this, itemPB.Slot);
                }
            }
        }

        /// <summary>
        /// Sets the default values for the <see cref="Control"/>. This should always begin with a call to the
        /// base class's method to ensure that changes to settings are hierchical.
        /// </summary>
        protected override void SetDefaultValues()
        {
            base.SetDefaultValues();

            Text = "Inventory";
        }

        class InventoryItemPB : PictureBox
        {
            static readonly TooltipHandler _tooltipHandler = TooltipCallback;
            readonly InventoryForm _invForm;

            readonly InventorySlot _slot;

            public InventoryItemPB(InventoryForm parent, Vector2 pos, InventorySlot slot) : base(parent, pos, _itemSize)
            {
                if (parent == null)
                    throw new ArgumentNullException("parent");

                _invForm = parent;
                _slot = slot;
                Tooltip = _tooltipHandler;
            }

            public InventorySlot Slot
            {
                get { return _slot; }
            }

            /// <summary>
            /// Draws the <see cref="Control"/>.
            /// </summary>
            /// <param name="spriteBatch">The <see cref="ISpriteBatch"/> to draw to.</param>
            protected override void DrawControl(ISpriteBatch spriteBatch)
            {
                base.DrawControl(spriteBatch);

                Inventory inv = _invForm.Inventory;
                if (inv == null)
                    return;

                if (inv[_slot] == null)
                    return;

                ItemEntity item = inv[_slot];
                if (item == null)
                    return;

                // Draw the item in the center of the slot
                Vector2 offset = (_itemSize - item.Grh.Size) / 2f;
                item.Draw(spriteBatch, ScreenPosition + offset.Round());

                // Draw the amount
                if (item.Amount > 1)
                    spriteBatch.DrawStringShaded(GUIManager.Font, item.Amount.ToString(), ScreenPosition, Color.White, Color.Black);
            }

            /// <summary>
            /// When overridden in the derived class, loads the skinning information for the <see cref="Control"/>
            /// from the given <paramref name="skinManager"/>.
            /// </summary>
            /// <param name="skinManager">The <see cref="ISkinManager"/> to load the skinning information from.</param>
            public override void LoadSkin(ISkinManager skinManager)
            {
                base.LoadSkin(skinManager);

                Sprite = GUIManager.SkinManager.GetSprite("item_slot");
            }

            /// <summary>
            /// Handles when a mouse button has been raised on the <see cref="Control"/>.
            /// This is called immediately before <see cref="Control.OnMouseUp"/>.
            /// Override this method instead of using an event hook on <see cref="Control.MouseUp"/> when possible.
            /// </summary>
            /// <param name="e">The event args.</param>
            protected override void OnMouseUp(MouseClickEventArgs e)
            {
                base.OnMouseUp(e);

                _invForm.InventoryItemPB_OnMouseUp(this, e);
            }

            static StyledText[] TooltipCallback(Control sender, TooltipArgs args)
            {
                InventoryItemPB src = (InventoryItemPB)sender;
                InventorySlot slot = src.Slot;
                IItemTable itemInfo;

                if (!src._invForm._infoRequester.TryGetInfo(slot, out itemInfo))
                {
                    // The data has not been received yet - returning null will make the tooltip retry later
                    return null;
                }

                // Data was received, so format it and return it
                return ItemInfoHelper.GetStyledText(itemInfo);
            }
        }
    }
}