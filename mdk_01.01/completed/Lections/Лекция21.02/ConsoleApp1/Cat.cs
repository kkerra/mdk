namespace ConsoleApp1
{
    internal class Cat : Animal
    {
        public string Color { get; set; }

        public Cat(string name, int age, string color) : base(name,age)
        {
            Color = color;
        }

        public override void Say()
        {
            base.Say();
            Console.WriteLine("мяу");
        }

        public override string ToString()  //использует обращение к базовому
            => base.ToString() + $"цвет: {Color}";
    }
}
