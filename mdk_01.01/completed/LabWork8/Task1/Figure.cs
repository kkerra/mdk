namespace Task1
{
    abstract class Figure
    {
        public abstract string Name { get; }
        public abstract double CalculateArea();
        public abstract double CalculatePerimeter();
        public abstract void PrintInfo();
    }
}