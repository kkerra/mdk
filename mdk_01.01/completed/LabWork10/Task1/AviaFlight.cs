namespace Task1
{
    internal class AviaFlight : IComparable
    {
        public string Destination { get; set; }
        public int FlightNumber { get; set; }
        public int Capacity { get; set; }

        public int CompareTo(object? obj)
        {
            AviaFlight aviaFlight = obj as AviaFlight;
            if (aviaFlight == null)
                return -1;
            return Capacity.CompareTo(aviaFlight.Capacity);
        }
    }
}