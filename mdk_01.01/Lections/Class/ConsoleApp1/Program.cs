using ConsoleApp1;

DateTime dateTime = new DateTime(2020, 4, 1);
Console.WriteLine(dateTime);
String str = new String("ispp-35");
Console.WriteLine(str);
double r = 6;
Console.WriteLine($"Периметр круга: {2 * Math.PI * r}");

Person person = new Person();
person.Age = 18;
person.Name = "Туйкова А.Е.";
person.PrintName();
Console.WriteLine($"Лет до совершеннолетия: {person.YearsUntilMajority()}");

Person person2 = new Person("Афиногенов С.А", 16);
person2.PrintName();
Console.WriteLine($"Лет до совершеннолетия: {person2.YearsUntilMajority()}");

Console.ForegroundColor = ConsoleColor.Yellow;
DateTime dt = DateTime.Now;
int year = dt.Year;

