using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp12
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Input the character from the list [c,f,h,t,b] to display the coressponding sports");
            char input = Console.ReadKey().KeyChar;
            Console.WriteLine();
            switch (char.ToLower(input))
            {
                case 'c':
                    Console.WriteLine("Sport : Cricket");
                    break;
                case 'f':
                    Console.WriteLine("Sport : Football");
                    break;
                case 'h':
                    Console.WriteLine("Sport : Hockey");
                    break;
                case 't':
                    Console.WriteLine("Sport : Tennis");
                    break;
                case 'b':
                    Console.WriteLine("Sport : Badminton");
                    break;
                default:
                    Console.WriteLine("No such sports");
                    break;
            }
        }
    }
}
