using Task2;

AviaFlight[] aviaFlights = [
    new AviaFlight { Destination = "Москва", FlightNumber = 100, Capacity = 250 },
    new AviaFlight { Destination = "Архангельск", FlightNumber = 101, Capacity = 140},
    new AviaFlight { Destination = "Казань", FlightNumber = 102, Capacity = 170},
    ];

Console.WriteLine($"Первоначальный массив:");
foreach (AviaFlight av in aviaFlights)
{
    Console.WriteLine($"Пункт назначения: {av.Destination}, номер рейса: {av.FlightNumber}, вместимость: {av.Capacity}");
}

Array.Sort(aviaFlights);
Console.WriteLine($"После сортировки:");
foreach (AviaFlight av in aviaFlights)
{
    Console.WriteLine($"Пункт назначения: {av.Destination}, номер рейса: {av.FlightNumber}, вместимость: {av.Capacity}");
}