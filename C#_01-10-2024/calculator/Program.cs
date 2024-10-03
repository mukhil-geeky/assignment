using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Maths.Operations;
namespace calculator
{
    public class Program
    {
        static void Main(string[] args)
        {
            ArithmeticOperation arithmeticOperation = new ArithmeticOperation();
            RelationalOperation relationalOperation = new RelationalOperation();

            Console.Write("Enter the 1st Number :");
            double a = double.Parse(Console.ReadLine());

            Console.Write("Enter the 2nd Number :");
            double b = double.Parse(Console.ReadLine());

            double sum = arithmeticOperation.Add(a, b);
            double difference = arithmeticOperation.Subtract(a, b);

            bool greaterThan = relationalOperation.GreaterThan(a, b);
            bool equals = relationalOperation.Equal(a, b);

            Console.WriteLine($"Addition : {a} + {b} = {sum} ");
            Console.WriteLine($"Subtraction : {a} - {b} = {difference} ");
            Console.WriteLine($"{a} > {b} : {greaterThan} ");
            Console.WriteLine($"{a} = {b} : {equals}");
            Console.ReadLine(); 


        }
    }
}
