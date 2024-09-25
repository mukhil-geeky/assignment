// PRINT ODD NUMBERS LESS THAN 50 USING WHILE LOOP

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int number = 0;
            while (number < 50)
            {
                if (number % 2 == 1)
                {
                    Console.WriteLine(number);
                }
                number++;
            }
        }
    }
}
