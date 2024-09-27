using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagement
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Employee emp1 = new Employee(1, "John Doe", 15000);
            Employee emp2 = new Employee(2, "Liam Smith", 20000);
            Employee emp3 = new Employee(3, "Mary James", 15000);


            emp1.Display();
            emp2.Display();
            emp3.Display();
        }
    }

    class Employee
    {

        public int Id { get; private set; }
        public string Name { get; set; }
        public double Salary { get; set; }
        public string EmployeeType { get; set; }

        public Employee(int id, string name, double salary, string employeeType = "Permanent")
        {
            Id = id;
            Name = name;
            Salary = salary;
            EmployeeType = employeeType;
        }

        
        public void Display()
        {
            Console.WriteLine($"Employee Id: {Id}, Employee Name: {Name}, Salary: {Salary}");
        }
    }
}
