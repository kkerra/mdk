namespace Task2
{
    internal class AviaFlight : IComparable<AviaFlight>
    {
        public string Destination { get; set; }
        public int FlightNumber { get; set; }
        public int Capacity { get; set; }

        public int CompareTo(AviaFlight? other)
        {
            if (other == null)
                return 0;
            return Capacity.CompareTo(other.Capacity);
        }
    }
}
