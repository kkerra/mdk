Console.WriteLine($"Введите строку:");
string text = Console.ReadLine();

Console.WriteLine($"Количество символов в строке: {text.Length}");
Console.WriteLine($"Количество символов в строке без учета пробелов: {text.Replace(" ", "").Length}");
int lettersCount = 0;
foreach (char symbol in text)
{
    if (Char.IsLetter(symbol))
        lettersCount++;
}
Console.WriteLine($"Количество букв в строке: {lettersCount}");

Console.WriteLine($"Введите символ:");
char searchSymbol = Convert.ToChar(Console.ReadLine());
Console.WriteLine($"Позиция символа:");
for (int i = 0; i < text.Length; i++)
{
    if (text[i] == searchSymbol)
        Console.WriteLine(i);
}

if (!text.Contains(searchSymbol))
    Console.WriteLine("Символ не найден");