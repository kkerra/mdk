Console.WriteLine("Укажите имя файла:");
string filename = Console.ReadLine();
if (!File.Exists(filename))
    Console.WriteLine("Файл не существует. Он будет создан");
else
    Console.WriteLine("Файл открыт для дозаписи");

using(StreamWriter writer = new(filename, true))
{
    string line;
    Console.WriteLine("Для конца записи файла написать end");
    while((line = Console.ReadLine()) != "end")
        writer.WriteLine(line);
}