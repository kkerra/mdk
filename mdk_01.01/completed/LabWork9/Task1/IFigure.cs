namespace Task1
{
    interface IFigure
    {
        public static string Name { get; set; } = "Фигура";
        public double Area();
        public double Perimeter();
        public void PrintInfo();
    }
}
