using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the number :");
            int number = int.Parse(Console.ReadLine());
            int Reverse_number = 0,temp;
            while(number>0)
            {
                temp = number % 10;
                Reverse_number = Reverse_number * 10 + temp;
                number = number / 10;
                
            }
            Console.WriteLine("The Reversed number = "+Reverse_number);
        }
    }
}
