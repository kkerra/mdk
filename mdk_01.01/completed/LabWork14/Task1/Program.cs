using System.Text.RegularExpressions;

string phoneNumber = Console.ReadLine();
string pattern = @"^(\+7|8)\(9\d{2}\)\d{3}(-\d{2}){2}$";
if (Regex.IsMatch(phoneNumber, pattern))
    Console.WriteLine("Номер введен корректно");
else
    Console.WriteLine("Номер введен некорректно");
