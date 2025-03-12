namespace Task1
{
    internal class AviaFlight
    {
        public string Destination { get; set; }
        public int FlightNumber { get; set; }
        public int Capacity { get; set; }

        public AviaFlight(string destination, int flightNumber, int capacity)
        {
            Destination = destination;
            FlightNumber = flightNumber;
            Capacity = capacity;
        }

        public void Print()
        {
            Console.WriteLine($"Пункт назначения: {Destination}, номер рейса: {FlightNumber}, вместимость: {Capacity}");
        }

        public override string ToString()
            => $"Пункт назначения: {Destination}, номер рейса: {FlightNumber}, вместимость: {Capacity}";

        public override bool Equals(object? obj)
        {
            AviaFlight aviaFlight1 = obj as AviaFlight;
            return Destination == aviaFlight1.Destination &&
                Capacity == aviaFlight1.Capacity &&
                FlightNumber == aviaFlight1.FlightNumber;
        }
    }
}
