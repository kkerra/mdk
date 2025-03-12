using Task1;

AviaFlight aviaFlight = new();
aviaFlight.Print();

AviaFlight[] aviaFlights =
[
    new AviaFlight("Москва", 123, 200),
    new AviaFlight("Санкт-Петербург", 345, 150),
    new AviaFlight("Архангельск", 567, 170),
];

foreach (var flight in aviaFlights)
{
    flight.Print();
}

Console.WriteLine($"Полеты в Москву:");

foreach (var flight in aviaFlights)
{
    if (flight.Destination == "Москва")
    {
        flight.Print();
    }
}

Console.WriteLine($"Полеты с вместимостью более 160 человек:");

foreach (var flight in aviaFlights)
{
    if (flight.Capacity > 160)
    {
        flight.Print();
    }
}