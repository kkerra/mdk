namespace Task4
{
    internal class AviaFlight : ICloneable
    {
        public string Destination { get; set; }
        public int FlightNumber { get; set; }
        public int Capacity { get; set; }

        public object Clone()
        {
            return new AviaFlight { Destination = Destination, Capacity = Capacity, FlightNumber = FlightNumber };
        }

        public void Print()
        {
            Console.WriteLine($"Пункт назначения: {Destination}, номер рейса: {FlightNumber}, вместимость: {Capacity}");
        }
    }
}
