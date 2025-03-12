using System.Text.RegularExpressions;

string email = Console.ReadLine();
string pattern = @"[a-z\d-_]+@[a-z0-9-.]+\.[a-z]{2,}$";
if (Regex.IsMatch(email, pattern, RegexOptions.IgnoreCase))
    Console.WriteLine("Email введен корректно");
else
    Console.WriteLine("Email введен некорректно");