using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp7
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the number to check if it is prime : ");
            int number = int.Parse(Console.ReadLine());

            if (IsPrime(number))
                {
                Console.WriteLine($"{number} is a prime number");
                }
            else
                {
                Console.WriteLine($"{number} is not a prime number");
                }

        }

        static bool IsPrime(int number)
        {
            if (number < 2)
            {
                return false;
            }
            for (int i = 2; i < number / 2; i++)
            {
                if (number % i == 0)
                {
                    return true;
                }
            }
            return false;
        }
    }
}
