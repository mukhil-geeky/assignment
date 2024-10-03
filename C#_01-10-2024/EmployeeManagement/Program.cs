using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagement
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Employee employee1 = new Employee(1, "John Doe", 15000);
            Employee employee2 = new Employee(2, "Liam Smith", 20000);
            Employee employee3 = new Employee(3, "Mary James", 15000);

            employee1.Display();
            employee2.Display();
            employee3.Display();

            Employee.EmployeeCount();
     

        }
    }

    public class Employee
    {
        private static int EmployeeID = 1000;
        private static int count = 0;

        public string id { get; private set; }
        public string name { get; set; }
        public double salary { get; set; }
        public string employeeType { get; set; }

        public Employee(int id)
        {
            this.id = "Emp" + EmployeeID.ToString();
            EmployeeID++;
            count++;
        }
        public Employee(int id, string name) : this(id)
        {
            this.name = name;
        }
        public Employee(int id, string name, double salary) : this(id,name)
        {
            this.salary = salary;
        }

        public static void EmployeeCount()
        {
            Console.WriteLine($"Number of Employee : {count}");
        }

        public void Display()
        {
            Console.WriteLine($"EmployeeID : {this.id}\nEmployee Name : {this.name}\nEmployee Salary : {this.salary}");
        }
    }
}
