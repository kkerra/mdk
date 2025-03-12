using Task1;

AviaFlight aviaFlight = new() { Destination = "Москва", FlightNumber = 100, Capacity = 150 };
aviaFlight.Print();

Triangle triangle = new() { Side = 5 };
triangle.Print();
Console.WriteLine($"Площадь: {triangle.Area()}");
Console.WriteLine($"Периметр: {triangle.Perimeter()}");
triangle.PrintInfo();

IPrinter printer1 = aviaFlight;
printer1.Print();
IPrinter printer2 = triangle;
printer2.Print();

IPrinter[] printers =
{
    new AviaFlight { Destination = "Москва", FlightNumber = 100, Capacity = 150 },
    new AviaFlight { Destination = "Москва", FlightNumber = 122, Capacity = 134 },
    new Triangle { Side = 5 },
    new Triangle{ Side = 6 },
};

foreach (IPrinter printer in printers)
{
    printer.Print();
}