Console.WriteLine("Введите путь к папке");
var path = Console.ReadLine();
Console.WriteLine("Введите текст для поиска");
var searchText = Console.ReadLine();

if (Directory.Exists(path))
{
    FileInfo fileInfo;
    string[] filenames = Directory.GetFiles(path, "*", SearchOption.AllDirectories);
    foreach (string filename in filenames)
    {
        if (Path.GetFileName(filename).Contains(searchText))
        { 
            fileInfo = new(filename);
            Console.WriteLine($"Имя: {filename}, размер: {fileInfo.Length} байт"); 
        }
    }
}