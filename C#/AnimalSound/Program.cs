using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AnimalSound
{
    internal class Program
    {
        static void Main(string[] args)
        {
            dog dog1 = new dog();
            dog1.Name = "Rocky";
            dog1.sound();
            cat cat1 = new cat();
            cat1.Name = "Pinky";
            cat1.sound();
            bird bird1 = new bird();
            bird1.Name = "Spark";
            bird1.sound();
        }
    }

    public class Animal
    {
        public string Name { get; set; }

        public virtual void sound()
        {
            Console.WriteLine("Animal makes a sound");

        }

    }

    public class dog : Animal
    {
        public override void sound()
        {
            Console.WriteLine($"{Name} makes  BOW BOW ");
        }
    }
    public class cat : Animal
    {
        public override void sound()
        {
            Console.WriteLine($"{Name} makes MEOW MEOW");
        }
    }

    public class bird : Animal
    {
        public override void sound()
        {
            Console.WriteLine($"{Name} makes CHIRP CHIRP");
        }

    }
}
