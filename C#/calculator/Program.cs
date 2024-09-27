using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace calculator
{
    internal class Program
    {
        static void Main(string[] args)
        {
            calculator cal = new calculator();

            Console.Write("Enter the 1st number :");
            double num1 = double.Parse(Console.ReadLine());
            Console.Write("Enter the 2nd number : ");
            double num2 = double.Parse(Console.ReadLine());

            Console.WriteLine("Addition: " + cal.add(num1, num2));
            Console.WriteLine("Subtraction: " + cal.subtract(num1, num2));
            Console.WriteLine("Multiplication: " + cal.multiply(num1, num2));
            Console.WriteLine("Division: " + cal.divide(num1, num2));

        }
    }

    internal class calculator
    {
        public double add(double x, double y)
        {
            return x + y;
        }

        public double subtract(double x, double y)
        {
            return x - y;
        }

        public double multiply(double x, double y)
        {
            return x * y;
        }

        public double divide(double x, double y)
        {
            if (x != 0)
            {
                return x / y;
            }
            else
            {
                Console.WriteLine("No number can be divided by 0");
                return double.NaN;
            }
        }
    }
}
