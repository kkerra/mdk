using Task4;

AviaFlight aviaFlight = new() { Destination = "Москва", FlightNumber = 1001, Capacity = 160 };
AviaFlight aviaFlight1 = (AviaFlight)aviaFlight.Clone();

Console.WriteLine("Клонированный объект:");
aviaFlight1.Print();