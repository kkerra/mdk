namespace Лекция_9._03
{
    internal struct Person
    {
        public string Name { get; set; }
        public int Age { get; set; }

        public Person(string name, int age)
        {
            Name = name;
            Age = age;
        }

        public Person() : this("unknown", 18)
        {
        }

        public override string ToString()
        {
            return $"Имя: {Name}, возраст: {Age}";
        }
    }
}
