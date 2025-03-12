namespace Task3
{
    internal class AviaFlight : IEquatable<AviaFlight>
    {
        public string Destination { get; set; }
        public int FlightNumber { get; set; }
        public int Capacity { get; set; }

        public bool Equals(AviaFlight? other)
        {
            if (other == null)
                return false;
            return Destination == other.Destination && FlightNumber == other.FlightNumber && Capacity == other.Capacity;
        }
    }
}
