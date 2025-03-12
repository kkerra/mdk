Console.WriteLine("Введите имя файла");
var filename = Console.ReadLine();

if (File.Exists(filename))
{
    Console.WriteLine("Файл открыт на дозапись");
}
else
{
    Console.WriteLine("Файла с указанным именем не существует, он будет создан");
}

string input;
while (true)
{
    input = Console.ReadLine();
    if (input != "end")
        File.AppendAllText(filename, input);
}