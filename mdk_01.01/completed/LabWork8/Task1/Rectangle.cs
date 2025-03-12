namespace Task1
{
    internal class Rectangle : Figure
    {
        public double Height { get; set; }
        public double Width { get; set; }

        public Rectangle(double height, double width)
        {
            Height = height;
            Width = width;
        }

        public override double CalculateArea()
            => Height * Width;

        public override double CalculatePerimeter()
            => 2 * (Height + Width);

        public override void PrintInfo()
        {
            Console.WriteLine($"{Name}, длина: {Height}, ширина: {Width}");
        }

        public override string Name
            => $"Прямоугольник";
    }
}
