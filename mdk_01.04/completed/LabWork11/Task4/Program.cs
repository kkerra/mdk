const string loginsFile = "logins.txt";

Console.WriteLine("введите логин:");
string login = Console.ReadLine();

while (File.Exists(loginsFile) && File.ReadAllLines(loginsFile).Any(line => line.Split(';')[0] == login))
{
    Console.WriteLine("Логин уже существует. Введите уникальный");
    login = Console.ReadLine();
}

Console.WriteLine("Введите пароль:");
string password = Console.ReadLine();
using (StreamWriter writer = new(loginsFile, true))
    writer.WriteLine($"{login};{password};{DateTime.Now}");

Console.WriteLine("Вы успешно зарегистрировались");