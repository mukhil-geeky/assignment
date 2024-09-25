// LARGE AMONG 3 NUMBER

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter 1st number : ");
            int number1 = int.Parse(Console.ReadLine());

            Console.Write("Enter the 2nd Number : ");
            int number2 = int.Parse(Console.ReadLine());

            Console.Write("Enter the 3rd Number : ");
            int number3 = int.Parse(Console.ReadLine());

            int largest;

            if (number1 >= number2 && number1 >= number3)
            {
                largest = number1;
            }
            else if (number2 >= number1 && number2 >= number3)
            {
                largest = number2;
            }
            else
            {
                largest = number3;
            }

            Console.WriteLine("The largest number = "+largest);
        }
    }
}
