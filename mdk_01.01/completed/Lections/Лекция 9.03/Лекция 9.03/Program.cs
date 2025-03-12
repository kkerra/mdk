using Лекция_9._03;

Person person = new Person();
Person person1 = new Person("имя", 20);
person1.Age = 30;

Console.WriteLine(person1);
Console.WriteLine(person);

Color color = Color.White;
Color orange = Color.Red | Color.Yellow;

static (int, string) GetUser(int id, string login)
{
    var user = (id, login);
    return user;
}

var admin = GetUser(0, "akds");
Console.WriteLine(admin);
Console.WriteLine(admin.Item1);
Console.WriteLine(admin.Item2);
