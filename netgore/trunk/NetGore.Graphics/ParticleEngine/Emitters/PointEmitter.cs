﻿using System.Linq;
using Microsoft.Xna.Framework;
using NetGore.IO;

namespace NetGore.Graphics.ParticleEngine
{
    /// <summary>
    /// A basic emitter of <see cref="Particle"/>s that just spews out <see cref="Particle"/>s from a single point.
    /// </summary>
    public class PointEmitter : ParticleEmitter
    {
        /// <summary>
        /// When overridden in the derived class, generates the offset and normalized force vectors to
        /// release the <see cref="Particle"/> at.
        /// </summary>
        /// <param name="particle">The <see cref="Particle"/> that the values are being generated for.</param>
        /// <param name="offset">The offset vector.</param>
        /// <param name="force">The normalized force vector.</param>
        protected override void GenerateParticleOffsetAndForce(Particle particle, out Vector2 offset, out Vector2 force)
        {
            offset = Vector2.Zero;
            GetForce(RandomHelper.NextFloat(MathHelper.TwoPi), out force);
        }

        /// <summary>
        /// When overridden in the derived class, reads all custom state values from the <paramref name="reader"/>.
        /// </summary>
        /// <param name="reader">The <see cref="IValueReader"/> to read the state values from.</param>
        protected override void ReadCustomValues(IValueReader reader)
        {
        }

        /// <summary>
        /// When overridden in the derived class, writes all custom state values to the <paramref name="writer"/>.
        /// </summary>
        /// <param name="writer">The <see cref="IValueWriter"/> to write the state values to.</param>
        protected override void WriteCustomValues(NetGore.IO.IValueWriter writer)
        {
        }
    }
}