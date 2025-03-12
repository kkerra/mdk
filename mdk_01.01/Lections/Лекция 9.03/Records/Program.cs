using Records;
using System.Drawing;

Console.ForegroundColor = ConsoleColor.Green;

Person person = new("имя", 18);
person = new("володя", person.Age);

Console.WriteLine(person);


Person volodya = new("володя", 18);
Console.WriteLine(person.Equals(volodya));

Color color = Color.White;
//Color orange = Color.Red | Color.Yellow;

