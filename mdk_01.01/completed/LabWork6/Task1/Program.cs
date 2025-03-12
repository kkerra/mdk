using Task1;

AviaFlight aviaFlight1 = new()
{
    Destination = "Архангельск",
    FlightNumber = 100,
    Capacity = 170
};
AviaFlight aviaFlight2 = new("Москва", 101, 150);

aviaFlight1.Print();
aviaFlight2.Print();

Console.WriteLine($"Пункт назначения: {aviaFlight1["Destination"]}");
