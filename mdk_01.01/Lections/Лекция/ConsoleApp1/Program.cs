using ConsoleApp1;

Console.WriteLine("работа с методами");

int a = -5;
Functions.GetAbsolute(ref a);



int x = Functions.Sum(2, 3);
Console.WriteLine(Functions.Sum(2.5,3.7));
 


Console.WriteLine("работа с классами");

//Person person = new();
Person person = new Person() { Money = 12345, age = 15, Name = "----" };
person.Print();
person = new("Петрова И.С.", 20);
person.Print();

person.age = 10;
person.Name = "Иванов П.С";

Console.WriteLine("совершеннолетие через: ");
Console.WriteLine(Person.MajorityAge - person.age);

person.Print();

Console.WriteLine($"поле 1: {person[1]}");
Console.WriteLine($"поле 2: {person[2]}");
Console.WriteLine($"поле 3: {person[3]}");