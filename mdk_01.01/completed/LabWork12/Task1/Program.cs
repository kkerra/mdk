using Task1;

AviaFlight aviaFlight1 = new("Москва", 130, 160);
AviaFlight aviaFlight2 = new();
aviaFlight1.Print();
aviaFlight2.Print();

aviaFlight1.FlightType = FlightType.Международный;
aviaFlight1.Capacity = -5;
aviaFlight1.Print();
aviaFlight1.Capacity = 50;
aviaFlight1.Print();

AviaFlight[] flights = 
    [
        new AviaFlight{Destination = "Архангельск", FlightNumber = 101, Capacity = 150, FlightType = FlightType.Международный},
        new AviaFlight{Destination = "Москва", FlightNumber = 102, Capacity = 160, FlightType = FlightType.Внутренний},
        new AviaFlight{Destination = "Казань", FlightNumber = 103, Capacity = 170, FlightType = FlightType.Международный},
    ];

Console.WriteLine($"Поиск по массиву по перечислению:");
foreach (var flight in flights)
{
    if (flight.FlightType == FlightType.Международный)
    {
        flight.Print();
    }
}

Book book1 = new("Книга1", "Автор1", 100);
Book book2 = new("Книга1", "Автор1", 100);
Book book3 = new("Книга1", "Автор2", 1000);
Console.WriteLine(book1);
Console.WriteLine(book2);
Console.WriteLine(book3);
Console.WriteLine(book1.Equals(book2));
Console.WriteLine(book1.Equals(book3));