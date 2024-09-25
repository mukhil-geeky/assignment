using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp11
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the amount : ");
            int amount = int.Parse(Console.ReadLine());
            if (amount < 10000)
            {
                float tax = amount * 0.5f;
                Console.WriteLine($"Tax Amount is {tax}"); 
            }
            else if(amount>10000 && amount<15000)
            {
                float tax = amount * 7.5f;
                Console.WriteLine($"Tax Amount is {tax}");
            }
            else if (amount>15000 && amount<20000)
            {
                float tax = amount * .1f;
                Console.WriteLine($"Tax Amount is {tax}");
            }
            else if(amount>20000 && amount<25000)
            {
                float tax = amount * .125f;
                Console.WriteLine($"Tax Amount is {tax}");
            }
            else
            {
                float tax = amount * .15f;
                Console.WriteLine($"Tax Amount is {tax}");
            }
        } 
    }
}
