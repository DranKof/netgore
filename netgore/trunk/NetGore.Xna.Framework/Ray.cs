﻿using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework.Design;

namespace Microsoft.Xna.Framework
{/// <summary>Defines a ray.</summary>
[Serializable, StructLayout(LayoutKind.Sequential), TypeConverter(typeof(RayConverter))]
public struct Ray : IEquatable<Ray>
{
    /// <summary>Specifies the starting point of the Ray.</summary>
    public Vector3 Position;
    /// <summary>Unit vector specifying the direction the Ray is pointing.</summary>
    public Vector3 Direction;
    /// <summary>Creates a new instance of Ray.</summary>
    /// <param name="position">The starting point of the Ray.</param>
    /// <param name="direction">Unit vector describing the direction of the Ray.</param>
    public Ray(Vector3 position, Vector3 direction)
    {
        this.Position = position;
        this.Direction = direction;
    }

    /// <summary>Determines whether the specified Ray is equal to the current Ray.</summary>
    /// <param name="other">The Ray to compare with the current Ray.</param>
    public bool Equals(Ray other)
    {
        return (((((this.Position.X == other.Position.X) && (this.Position.Y == other.Position.Y)) && ((this.Position.Z == other.Position.Z) && (this.Direction.X == other.Direction.X))) && (this.Direction.Y == other.Direction.Y)) && (this.Direction.Z == other.Direction.Z));
    }

    /// <summary>Determines whether two instances of Ray are equal.</summary>
    /// <param name="obj">The Object to compare with the current Ray.</param>
    public override bool Equals(object obj)
    {
        bool flag = false;
        if ((obj != null) && (obj is Ray))
        {
            flag = this.Equals((Ray) obj);
        }
        return flag;
    }

    /// <summary>Gets the hash code for this instance.</summary>
    public override int GetHashCode()
    {
        return (this.Position.GetHashCode() + this.Direction.GetHashCode());
    }

    /// <summary>Returns a String that represents the current Ray.</summary>
    public override string ToString()
    {
        return string.Format(CultureInfo.CurrentCulture, "{{Position:{0} Direction:{1}}}", new object[] { this.Position.ToString(), this.Direction.ToString() });
    }

    /// <summary>Checks whether the Ray intersects a specified BoundingBox.</summary>
    /// <param name="box">The BoundingBox to check for intersection with the Ray.</param>
    public float? Intersects(BoundingBox box)
    {
        return box.Intersects(this);
    }

    /// <summary>Checks whether the current Ray intersects a BoundingBox.</summary>
    /// <param name="box">The BoundingBox to check for intersection with.</param>
    /// <param name="result">[OutAttribute] Distance at which the ray intersects the BoundingBox or null if there is no intersection.</param>
    public void Intersects(ref BoundingBox box, out float? result)
    {
        box.Intersects(ref this, out result);
    }

    /// <summary>Checks whether the Ray intersects a specified BoundingFrustum.</summary>
    /// <param name="frustum">The BoundingFrustum to check for intersection with the Ray.</param>
    public float? Intersects(BoundingFrustum frustum)
    {
        if (frustum == null)
        {
            throw new ArgumentNullException("frustum");
        }
        return frustum.Intersects(this);
    }

    /// <summary>Determines whether this Ray intersects a specified Plane.</summary>
    /// <param name="plane">The Plane with which to calculate this Ray's intersection.</param>
    public float? Intersects(Plane plane)
    {
        float num2 = ((plane.Normal.X * this.Direction.X) + (plane.Normal.Y * this.Direction.Y)) + (plane.Normal.Z * this.Direction.Z);
        if (Math.Abs(num2) < 1E-05f)
        {
            return null;
        }
        float num3 = ((plane.Normal.X * this.Position.X) + (plane.Normal.Y * this.Position.Y)) + (plane.Normal.Z * this.Position.Z);
        float num = (-plane.D - num3) / num2;
        if (num < 0f)
        {
            if (num < -1E-05f)
            {
                return null;
            }
            num = 0f;
        }
        return new float?(num);
    }

    /// <summary>Determines whether this Ray intersects a specified Plane.</summary>
    /// <param name="plane">The Plane with which to calculate this Ray's intersection.</param>
    /// <param name="result">[OutAttribute] The distance at which this Ray intersects the specified Plane, or null if there is no intersection.</param>
    public void Intersects(ref Plane plane, out float? result)
    {
        float num2 = ((plane.Normal.X * this.Direction.X) + (plane.Normal.Y * this.Direction.Y)) + (plane.Normal.Z * this.Direction.Z);
        if (Math.Abs(num2) < 1E-05f)
        {
            result = 0;
        }
        else
        {
            float num3 = ((plane.Normal.X * this.Position.X) + (plane.Normal.Y * this.Position.Y)) + (plane.Normal.Z * this.Position.Z);
            float num = (-plane.D - num3) / num2;
            if (num < 0f)
            {
                if (num < -1E-05f)
                {
                    result = 0;
                    return;
                }
                result = 0f;
            }
            result = new float?(num);
        }
    }

    /// <summary>Checks whether the Ray intersects a specified BoundingSphere.</summary>
    /// <param name="sphere">The BoundingSphere to check for intersection with the Ray.</param>
    public float? Intersects(BoundingSphere sphere)
    {
        float num5 = sphere.Center.X - this.Position.X;
        float num4 = sphere.Center.Y - this.Position.Y;
        float num3 = sphere.Center.Z - this.Position.Z;
        float num7 = ((num5 * num5) + (num4 * num4)) + (num3 * num3);
        float num2 = sphere.Radius * sphere.Radius;
        if (num7 <= num2)
        {
            return 0f;
        }
        float num = ((num5 * this.Direction.X) + (num4 * this.Direction.Y)) + (num3 * this.Direction.Z);
        if (num < 0f)
        {
            return null;
        }
        float num6 = num7 - (num * num);
        if (num6 > num2)
        {
            return null;
        }
        float num8 = (float) Math.Sqrt((double) (num2 - num6));
        return new float?(num - num8);
    }

    /// <summary>Checks whether the current Ray intersects a BoundingSphere.</summary>
    /// <param name="sphere">The BoundingSphere to check for intersection with.</param>
    /// <param name="result">[OutAttribute] Distance at which the ray intersects the BoundingSphere or null if there is no intersection.</param>
    public void Intersects(ref BoundingSphere sphere, out float? result)
    {
        float num5 = sphere.Center.X - this.Position.X;
        float num4 = sphere.Center.Y - this.Position.Y;
        float num3 = sphere.Center.Z - this.Position.Z;
        float num7 = ((num5 * num5) + (num4 * num4)) + (num3 * num3);
        float num2 = sphere.Radius * sphere.Radius;
        if (num7 <= num2)
        {
            result = 0f;
        }
        else
        {
            result = 0;
            float num = ((num5 * this.Direction.X) + (num4 * this.Direction.Y)) + (num3 * this.Direction.Z);
            if (num >= 0f)
            {
                float num6 = num7 - (num * num);
                if (num6 <= num2)
                {
                    float num8 = (float) Math.Sqrt((double) (num2 - num6));
                    result = new float?(num - num8);
                }
            }
        }
    }

    /// <summary>Determines whether two instances of Ray are equal.</summary>
    /// <param name="a">The object to the left of the equality operator.</param>
    /// <param name="b">The object to the right of the equality operator.</param>
    public static bool operator ==(Ray a, Ray b)
    {
        return (((((a.Position.X == b.Position.X) && (a.Position.Y == b.Position.Y)) && ((a.Position.Z == b.Position.Z) && (a.Direction.X == b.Direction.X))) && (a.Direction.Y == b.Direction.Y)) && (a.Direction.Z == b.Direction.Z));
    }

    /// <summary>Determines whether two instances of Ray are not equal.</summary>
    /// <param name="a">The object to the left of the inequality operator.</param>
    /// <param name="b">The object to the right of the inequality operator.</param>
    public static bool operator !=(Ray a, Ray b)
    {
        if ((((a.Position.X == b.Position.X) && (a.Position.Y == b.Position.Y)) && ((a.Position.Z == b.Position.Z) && (a.Direction.X == b.Direction.X))) && (a.Direction.Y == b.Direction.Y))
        {
            return (a.Direction.Z != b.Direction.Z);
        }
        return true;
    }
}
}
