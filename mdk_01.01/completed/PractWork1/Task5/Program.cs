Console.WriteLine("Введите путь к папке");
var path = Console.ReadLine();

if (Directory.Exists(path))
{
    DateTime lastWriteTime;
    string newPath, newFilePath;
    string[] filenames = Directory.GetFiles(path);
    foreach (string filename in filenames)
    {
        lastWriteTime = File.GetLastWriteTime(filename);
        newPath = Path.Combine(path, lastWriteTime.Year.ToString(), lastWriteTime.Month.ToString(), lastWriteTime.Day.ToString());
        if (!Directory.Exists(newPath))
            Directory.CreateDirectory(newPath);
        newFilePath = Path.Combine(newPath, Path.GetFileName(filename));
        File.Move(filename, newFilePath);
        Console.WriteLine($"Файл {filename} перемещен в {newPath}");
    }
}