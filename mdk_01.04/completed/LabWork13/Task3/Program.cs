
internal class Program
{
    private static void Main(string[] args)
    {
        Console.WriteLine("Введите путь к каталогу:");
        string directoryPath = Console.ReadLine();

        if(Directory.Exists(directoryPath))
            FileProcessing(directoryPath);
        else
            Console.WriteLine("Указанный каталог не сущестует");
    }

    private static void FileProcessing(string directoryPath)
    {
        try
        {
            string[] files = Directory.GetFiles(directoryPath);

            foreach (string file in files)
            {
                DateTime lastWriteTime = File.GetLastWriteTime(file);
                string destinationDirectory = Path.Combine(directoryPath, lastWriteTime.Year.ToString("D2"), lastWriteTime.Month.ToString(), lastWriteTime.Day.ToString());
                if (!Directory.Exists(destinationDirectory))
                    Directory.CreateDirectory(destinationDirectory);

                string destinationFile = Path.Combine(destinationDirectory, Path.GetFileName(file));

                if (!File.Exists(destinationFile))
                    File.Move(file, destinationFile);
                else
                    Console.WriteLine("Файл уже существует");

            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ошибка: {ex.InnerException.Message}");
        }
    }
}