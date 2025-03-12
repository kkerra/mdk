using Task1;

AviaFlight aviaFlight1 = new("Москва", 100, 160);
Console.WriteLine(aviaFlight1);
Console.WriteLine(aviaFlight1.ToString());

AviaFlight aviaFlight2 = new("Москва", 100, 160);
Console.WriteLine(Equals(aviaFlight1, aviaFlight2));

Rectangle rectangle = new(5, 6);
rectangle.PrintInfo();
Console.WriteLine($"Периметр: {rectangle.CalculatePerimeter()}");
Console.WriteLine($"Площадь: {rectangle.CalculateArea()}");
