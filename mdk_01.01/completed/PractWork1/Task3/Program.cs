Console.WriteLine("Введите имя файла");
var filename = Console.ReadLine();

if (File.Exists(filename))
{
    Console.WriteLine("Введите текст для поиска");
    var searchText = Console.ReadLine();
    string[] lines = File.ReadAllLines(filename);
    for (int i = 0; i < lines.Length; i++)
    {
        if (lines[i].Contains(searchText))
            Console.WriteLine($"{i + 1}: {lines[i]}");
    }
}
else
{
    Console.WriteLine("Такого файла не существует");
}