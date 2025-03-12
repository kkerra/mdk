namespace Task1
{
    internal class Triangle : IFigure, IPrinter
    {
        public double Side { get; set; }
        public string Name { get; set; } = "Треугольник";

        public void Print() => Console.WriteLine($"Длина стороны: {Side}");

        public double Area() => (Side * Side * Math.Sqrt(3)) / 4;

        public double Perimeter() => 3 * Side;

        public void PrintInfo() => Console.WriteLine($"Название фигуры: {Name}, длина стороны: {Side}");
    }
}
