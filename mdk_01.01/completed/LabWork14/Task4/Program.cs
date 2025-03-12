using System.Text.RegularExpressions;

string pattern = @"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[.!?]).{6,}$";
Regex regex = new(pattern);
string password = "";
do
{
    Console.WriteLine("Введите пароль");
    password = Console.ReadLine();
    if (!regex.IsMatch(password))
        Console.WriteLine("Пароль введен некорректно");
    else
        break;
} while (true);