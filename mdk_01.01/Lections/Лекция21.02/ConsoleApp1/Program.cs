using ConsoleApp1;

Console.WriteLine("наследование");

//Random random = new Random();
//int x;
//x = random.Next();       //min-max
//x = random.Next(100);    //0-99
//x = random.Next(-10,10); // -10 - 9
//double y = random.NextDouble(); //0.0 - 0.(9)

//ExtendedRandom random = new();
//double x = random.NextDouble(5.9, 8.7);
//Console.WriteLine(x);

Cat barsik = new("Барсик", 5, "рыжий");
barsik.Say();