using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp10
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter the string to check as palindrome : ");
            string input_string = Console.ReadLine();
            string reversed_string = new string(input_string.Reverse().ToArray());
            Console.WriteLine($"{input_string} is " + (input_string.Equals(reversed_string,StringComparison.OrdinalIgnoreCase)? "a Palindrome" : "Not Palindrome"));
        }
    }
}
