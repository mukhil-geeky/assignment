using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp8
{
    internal class Program
    {
        static void Main(string[] args)
        {
            for (int i = 2; i < 100; i++)
            {
                if (IsPrime(i))
                {
                    Console.WriteLine(i);
                }
            }

        }
        static bool IsPrime(int i)
        {
            if (i < 2)
            {
                return false;
            }
            for (int j = 2; j<= i/2; j++)
            {
                if (i%j == 0)
                {
                    return false;
                }
            }
            return true;
        }
    }
}