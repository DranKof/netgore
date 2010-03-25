﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
using Microsoft.Xna.Framework.Content;
using NetGore.Audio;

namespace NetGore.EditorTools
{
    public class SoundUITypeEditorForm : UITypeEditorListForm<ISound>
    {
        readonly ContentManager _cm;
        readonly ISound _current;

        /// <summary>
        /// Initializes a new instance of the <see cref="SoundUITypeEditorForm"/> class.
        /// </summary>
        /// <param name="cm">The cm.</param>
        /// <param name="current">The currently selected <see cref="ISound"/>. Can be null.</param>
        public SoundUITypeEditorForm(ContentManager cm, object current)
        {
            _cm = cm;

            var sm = SoundManager.GetInstance(cm);

            if (current != null)
            {
                if (current is SoundID)
                    _current = sm.GetItem((SoundID)current);
                else if (current is SoundID? && ((SoundID?)current).HasValue)
                    _current = sm.GetItem(((SoundID?)current).Value);
                else if (current is ISound)
                    _current = (ISound)current;
                else
                    _current = sm.GetItem(current.ToString());
            }
        }

        /// <summary>
        /// Gets the string to display for an item.
        /// </summary>
        /// <param name="item">The item to get the display string for.</param>
        /// <returns>The string to display for the <paramref name="item"/>.</returns>
        protected override string GetItemDisplayString(ISound item)
        {
            return item.Index + ". " + item.Name;
        }

        /// <summary>
        /// When overridden in the derived class, gets the items to add to the list.
        /// </summary>
        /// <returns>The items to add to the list.</returns>
        protected override IEnumerable<ISound> GetListItems()
        {
            var mm = SoundManager.GetInstance(_cm);
            return mm.Items.OrderBy(x => x.Index);
        }

        /// <summary>
        /// When overridden in the derived class, gets if the given <paramref name="item"/> is valid to be
        /// used as the returned item.
        /// </summary>
        /// <param name="item">The item to validate.</param>
        /// <returns>
        /// If the given <paramref name="item"/> is valid to be used as the returned item.
        /// </returns>
        protected override bool IsItemValid(ISound item)
        {
            return item != null;
        }

        /// <summary>
        /// When overridden in the derived class, sets the item that will be selected by default.
        /// </summary>
        /// <param name="items">The items to choose from.</param>
        /// <returns>
        /// The item that will be selected by default.
        /// </returns>
        protected override ISound SetDefaultSelectedItem(IEnumerable<ISound> items)
        {
            return _current;
        }
    }
}