using System.Text.RegularExpressions;

//1
string input = "...";
string pattern = @"...";
string replacement = "..."; // шаблон замены

//2
//2.1
string result = Regex.Replace(input, pattern, replacement);
//2.2
Regex regex = new(pattern, RegexOptions.IgnoreCase);
result = regex.Replace(input, replacement);

string[] results = Regex.Split(result, pattern); 
results = regex.Split(input);

//3
/*if (regex.IsMatch(input))
    Console.WriteLine("совпадение найдено");

Match match = regex.Match(input);
if (match.Success)
    Console.WriteLine($"совпадение {match.Value} найдено");*/

/*Match match = regex.Match(input);
if (match.Success)
{
    Console.WriteLine($"совпадение {match.Groups[0]} найдено");
    for(int i = 0; i < match.Groups.Count; i++)
        Console.WriteLine($"{i} : {match.Groups[i]}");
}*/

//Match match = regex.Match(input);
//while (match.Success)
//{
//    Console.WriteLine($"совпадение {match.Value} найдено");
//    match = match.NextMatch(); // переход к след совпадению
//}

MatchCollection matches = regex.Matches(input);
foreach (Match match in matches)
    Console.WriteLine($"совпадение {match.Value}");

for(int i = 0; i < matches.Count; i++)
    Console.WriteLine($"совпадение {matches[i].Value}");
