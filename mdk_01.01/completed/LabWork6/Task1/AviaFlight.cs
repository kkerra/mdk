using System.Xml.Linq;

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
            Destination = destination;
            FlightNumber = flightNumber;
            Capacity = capacity;
        }

        public string Destination
        {
            get { return _destination; }
            set
            {
                if (value.Length > 0)
                    _destination = value;
            }
        }

        public int FlightNumber
        {
            get { return _flightNumber; }
            set
            {
                if (value > 0)
                 _flightNumber = value; 
            }
        }

        public int Capacity
        {
            get { return _capacity; }
            set
            {
                if (value > 0)
                _capacity = value;
            }
        }

        public void Print()
        {
            Console.WriteLine($"Пункт назначения: {Destination}, номер рейса: {FlightNumber}, вместимость: {Capacity}");
        }
        
        public object this[string index]
        {
            get
            {
                switch(index)
                {
                    case "Destination":
                        return Destination;
                    case "FlightNumber":
                        return FlightNumber;
                    case "Capacity":
                        return Capacity;
                    default:
                        return null;
                }
            }
        }

        public char this[int index]
        {
            get
            {
                string firstField = Destination;
                return firstField[index];
            }
        }
    }
}
