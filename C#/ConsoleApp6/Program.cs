using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp6
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the number :");
            int number = int.Parse(Console.ReadLine());
            int sum = 0, temp;
            while (number > 0)
            {
                temp = number % 10;
                sum = sum + temp*temp;
                number = number / 10;

            }
            Console.WriteLine("Sum of Squares of digits of a number = " + sum);
        }
    }
}
