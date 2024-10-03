using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Animal
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Dog dog = new Dog();
            cat cat = new cat();
            bird bird = new bird();

            dog.MakeSound();
            cat.MakeSound();
            bird.MakeSound();
        }
    }

    public abstract class Animal
    {
        public abstract string Name { get; set; }
        public abstract string Sound { get; set; }

        public abstract void MakeSound();
    }

    public class Dog : Animal
    {
        public override string Name { get; set; }
        public override string Sound { get; set; } = "Woof";

        public Dog()
        {
            Console.Write($"Enter the name of the Dog :");
            this.Name = Console.ReadLine();
        }


        public override void MakeSound()
        {
            Console.WriteLine($"The Dog named {this.Name} makes sound {this.Sound}");
        }
    }

    public class cat : Animal
    {
        public override string Name { get; set; }
        public override string Sound { get; set; } = "meow";

        public cat()
        {
            Console.Write($"Enter the name of the Cat :");
            this.Name = Console.ReadLine();
        }

        public override void MakeSound()
        {
            Console.WriteLine($"The Cat named {this.Name} makes sound {this.Sound}");
        }
    }

    public class bird : Animal
    {
        public override string Name { get; set; }
        public override string Sound { get; set; } = "chirp";

        public bird()
        {
            Console.Write($"Enter the name of the Bird :");
            this.Name = Console.ReadLine();
        }

        public override void MakeSound()
        {
            Console.WriteLine($"The Bird named {this.Name} makes sound {this.Sound}");
        }
    }


}
