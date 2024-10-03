using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace shape
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter the Radius of the circle :");
            double r = double.Parse(Console.ReadLine());

            IShape circle = new Circle(r);

            Console.WriteLine($"Area of circle is : {circle.CalculateArea()}");
            Console.WriteLine($"Perimeter of circle is : {circle.CalculatePerimeter()}");




            Console.WriteLine("Enter the length of the Rectangle :");
            double l = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the width of the Rectangle : ");
            double w = double.Parse(Console.ReadLine());

            IShape rectangle = new Rectangle(w,l);

            Console.WriteLine($"Area of Rectangle is : {rectangle.CalculateArea()}");
            Console.WriteLine($"Perimeter of Rectangle is : {rectangle.CalculatePerimeter()}");




            Console.WriteLine("Enter the Side1 of Triangle : ");
            double side1 = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the side2 Triangle : ");
            double side2 = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the Side3 of Triangle : ");
            double side3 = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the height of Triangle : ");
            double height = double.Parse(Console.ReadLine());
            Console.WriteLine("Enter the base of Triangle : ");
            double base_length = double.Parse(Console.ReadLine());

            IShape triangle = new Triangle(side1, side2, side3, base_length, height);

            Console.WriteLine($"Area of Triangle is : {triangle.CalculateArea()}");
            Console.WriteLine($"Perimeter of Rectangle is : {triangle.CalculatePerimeter()}");




        }
    }

    public class Circle : IShape
    {
        public double Radius { get; set; }

        public Circle(double radius)
        {
            this.Radius = radius;
        }

        public double CalculateArea()
        {
            return Math.PI * this.Radius * this.Radius;
        }

        public double CalculatePerimeter()
        {
            return 2 * Math.PI * this.Radius;
        }
    }

    public class Rectangle : IShape
    {
        public double length { get; set; }
        public double width { get; set; }

        public Rectangle(double width, double length)
        {
            this.width = width;
            this.length = length;
        }

        public double CalculateArea()
        {
            return length * width;
        }

        public double CalculatePerimeter()
        {
            return 2 * (length + width);
        }
    }

    public class Triangle : IShape
    {
        public double side1 { get; set; }

        public double side2 { get; set; }

        public double side3 { get; set; }

        public double base_length { get; set; }

        public double height { get; set; }

        public Triangle(double side1, double side2, double side3, double base_length, double height)
        {
            this.side1 = side1;
            this.side2 = side2;
            this.side3 = side3;
            this.base_length = base_length;
            this.height = height;

        }

        public double CalculateArea()
        {
            return base_length * height;

        }

        public double CalculatePerimeter()
        {
            return side1 + side2 + side3;
        }

    }
}
