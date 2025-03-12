namespace Task1
{
    internal class AviaFlight : IPrinter
    {
        public string Destination { get; set; }
        public int FlightNumber { get; set; }
        public int Capacity { get; set; }

        public void Print()
        {
            Console.WriteLine($"Пункт назначения: {Destination}, номер рейса: {FlightNumber}, вместимость: {Capacity}");
        }
    }
}
