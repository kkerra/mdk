namespace Task1
{
    internal class AviaFlight
    {
        private string _destination;
        private int _flightNumber;
        private int _capacity;

        public AviaFlight() : this("Москва", 100, 170)
        {
        }

        public AviaFlight(string destination, int flightNumber, int capacity)
        {
            _destination = destination;
            _flightNumber = flightNumber;
            _capacity = capacity;
        }

        public string Destination
        {
            get => _destination;
            set
            {
                if (value.Length > 0)
                    _destination = value;
            }
        }

        public int FlightNumber
        {
            get => _flightNumber;
            set
            {
                if (value > 0)
                    _flightNumber = value;
            }
        }

        public int Capacity
        {
            get => _capacity;
            set
            {
                if (value > 0)
                    _capacity = value;
            }
        }

        public void Print() => Console.WriteLine($"Пункт назначения: {Destination}, номер рейса: {FlightNumber}, вместимость: {Capacity}");
    }
}
