namespace Task1
{
    internal struct AviaFlight
    {
        private string _destination;
        private int _flightNumber;
        private int _capacity;
        public FlightType FlightType;

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
                if (value >= 0)
                    _flightNumber = value;
            }
        }

        public int Capacity
        {
            get => _capacity;
            set
            {
                if (value >= 0)
                    _capacity = value;
            }
        }

        public AviaFlight(string destination, int flightNumber, int capacity)
        {
            _destination = destination;
            _flightNumber = flightNumber;
            _capacity = capacity;
            FlightType = FlightType.Внутренний;
        }

        public void Print()
        {
            Console.WriteLine($"Место назначения: {_destination}, номер рейса {_flightNumber}, вместимость: {_capacity}, тип рейса: {FlightType}");
        }
    }
}
