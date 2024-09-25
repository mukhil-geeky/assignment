using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp9
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the limit of fibonacci series : ");
            int limit = int.Parse(Console.ReadLine());
            int a = 0, b = 1;

            Console.WriteLine("Fibonacci series ");
            if (limit != 0)
            {
                for (int i = 0; i < limit; i++)
                {
                    Console.Write($"{a}  ");
                    int next = a + b;
                    a = b;
                    b = next;
                }
                Console.WriteLine();
            }
            else
            {
                Console.WriteLine("NULL");
            }
        }
    }
}
