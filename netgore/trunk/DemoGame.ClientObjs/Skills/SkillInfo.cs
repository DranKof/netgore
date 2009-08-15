﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using NetGore;
using NetGore.Collections;
using NetGore.IO;

namespace DemoGame.Client
{
    /// <summary>
    /// Describes a skill with the given SkillType.
    /// </summary>
    [Serializable]
    public class SkillInfo
    {
        const string _fileName = "skillinfo.xml";

        static readonly InfoManager<SkillType, SkillInfo> _infoManager =
            new InfoManager<SkillType, SkillInfo>(_fileName, EnumComparer<SkillType>.Instance,
                                                                x => new SkillInfo(x), (x, y) => y.Save(x),
                                                                x => x.SkillType);

        static SkillInfo()
        {
            _infoManager.AddMissingTypes(Enum.GetValues(typeof(SkillType)).Cast<SkillType>(), x => new SkillInfo { SkillType = x, Name = x.ToString(), Description = string.Empty });
            _infoManager.Save();
        }

        public static SkillInfo GetSkillInfo(SkillType skillType)
        {
            return _infoManager[skillType];
        }

        public static void Save()
        {
            _infoManager.Save();
        }

        /// <summary>
        /// Gets or sets the GrhIndex for this Skill's icon.
        /// </summary>
        public GrhIndex Icon { get; set; }

        /// <summary>
        /// Gets or sets the description of this Skill.
        /// </summary>
        public string Description { get; set; }
        
        /// <summary>
        /// Gets or sets the SkillType that this SkillInfo is describing.
        /// </summary>
        public SkillType SkillType { get; set; }

        /// <summary>
        /// Gets or sets the name of this SkillType.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// SkillInfo constructor.
        /// </summary>
        public SkillInfo()
        {
        }

        /// <summary>
        /// SkillInfo constructor.
        /// </summary>
        /// <param name="skillType">The SkillType that this SkillInfo is describing</param>
        /// <param name="name">The name of this SkillType</param>
        /// <param name="description">The description of this Skill</param>
        /// <param name="icon">The GrhIndex for this Skill's icon</param>
        public SkillInfo(SkillType skillType, string name, string description, GrhIndex icon)
        {
            SkillType = skillType;
            Name = name;
            Description = description;
            Icon = icon;
        }

        public SkillInfo(IValueReader r)
        {
            Read(r);
        }

        void Read(IValueReader r)
        {
            SkillType = r.ReadSkillType("Type");
            Name = r.ReadString("Name");
            Description = r.ReadString("Description");
            Icon = r.ReadGrhIndex("Icon");
        }

        public void Save(IValueWriter w)
        {
            w.Write("Type", SkillType);
            w.Write("Name", Name);
            w.Write("Description", Description);
            w.Write("Icon", Icon);
        }
    }
}
