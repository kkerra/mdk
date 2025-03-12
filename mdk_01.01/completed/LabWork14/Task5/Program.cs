using System.Text.RegularExpressions;

string input = "25.12.2004, 31/01/915";
string pattern = @"(?<day>\d{1,2})[./](?<month>\d{2})[./](?<year>\d{2,4})";
string replacement = "${year}-${month}-${day}";
input = Regex.Replace(input, pattern, replacement);
Console.WriteLine($"После замены: {input}");