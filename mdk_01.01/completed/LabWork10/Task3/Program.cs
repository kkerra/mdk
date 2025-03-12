using Task3;

AviaFlight aviaFlight = new() { Destination = "Москва", FlightNumber = 100, Capacity = 150 };
AviaFlight aviaFlight1 = new() { Destination = "Москва", FlightNumber = 101, Capacity = 150 };

if (aviaFlight.Equals(aviaFlight1))
{
    Console.WriteLine($"Объекты одинаковые");
}
else
{
    Console.WriteLine($"Объекты разные");
}