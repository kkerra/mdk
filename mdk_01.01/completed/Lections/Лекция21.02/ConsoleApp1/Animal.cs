namespace ConsoleApp1
{
    internal class Animal
    {
        public string Name { get; set; }
        public int Age { get; set; }

        public Animal(string name, int age)
        {
            Name = name;
            Age = age;
        }

        public virtual void Say() 
        {
            Console.WriteLine($"i'm {Name}");
        }

        public override string ToString() //не исп обращение к базовому
            => $"Кличка: {Name}";

        public override bool Equals(object? obj)
        {
            Animal animal = obj as Animal;
            if (animal == null)
                return false;
            return Name == animal.Name && Age == animal.Age ;
        }

    }
}
