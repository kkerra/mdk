namespace ConsoleApp1
{
    class ExtendedRandom : Random
    {
        public double NextDouble(double minValue, double maxValue)
            => NextDouble() * (maxValue - minValue) + minValue;
    }
}
