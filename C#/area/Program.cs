using System;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace area
{
    internal class Program
    {
        static void Main(string[] args)
        {
            circle circle = new circle(5);
            Console.WriteLine($"Circle Area: {circle.area()}");

            rectangle rectangle = new rectangle(10, 5);
            Console.WriteLine($"Rectangle Area: {rectangle.area()}");

            
            triangle triangle = new triangle(6, 8);
            Console.WriteLine($"Triangle Area: {triangle.area()}");
        }
    }

    public class shape
    {
        public virtual double area()
        {
            return 0;
        }
    }

    class circle : shape
    {
        public double Radius { get; set; }

        public circle(double radius)
        {
            Radius = radius;
        }

        public override double area()
        {
            return Math.PI * Radius * Radius;
        }
    }

    class rectangle : shape
    {
        public double Length { get; set; }
        public double Width { get; set; }
        public rectangle(double length, double width)

        {
            Length = length;
            Width = width;
        }

        public override double area()
        {
            return Length * Width; ;
        }

    }

    class triangle : shape
    {
        public double Base { get; set; }
        public double Height { get; set; }

        public triangle(double baselength, double height)
        {
            Base = baselength;
            Height = height;
        }

        public override double area()
        {
            return 0.5 * Base * Height;
        }
    }
}
