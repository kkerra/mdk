namespace ConsoleApp1
{
    class Person
    {
        private string name;
        private int age;
        public string Name
        {
            get
            {
                return name;
            }
            set
            {
                if (value.Length > 5)
                {
                    name = value;
                }
            }
        }
        public int Age
        {
            get
            {
                return age;
            }
            set
            {
                if (value >= 0 && value <= 100)
                {
                    age = value;
                }
            }
        }
        public const int AgeOfMajority = 18;
        public Person()
        {

        }
        public Person(string name, int age)
        {
            this.name = name;
            this.age = age;
        }
        public void PrintName()
        {
            Console.WriteLine($"Имя: {name}");
            Console.WriteLine($"Возраст: {age}");
        }
        public int YearsUntilMajority()
        {
            return AgeOfMajority - age;
        }
    }
}

