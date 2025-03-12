using System.Text.RegularExpressions;

string text = Console.ReadLine();
string pattern = @"\s{2,}";
text = Regex.Replace(text, pattern, " ");
Console.WriteLine($"После замены: {text}");