
internal class Program
{
    private static void Main(string[] args)
    {
        Console.WriteLine("Введите путь к каталогу");
        string directoryPath = Console.ReadLine();
        if (Directory.Exists(directoryPath))
        {
            FileProcessing(directoryPath);
        }
        else
            Console.WriteLine("Каталога не существует");
    }

    private static void FileProcessing(string directoryPath)
    {
        try
        {
            string[] files = Directory.GetFiles(directoryPath);
            foreach (string file in files)
            {
                string extension = Path.GetExtension(file).TrimStart('.').ToUpper();
                if (!String.IsNullOrEmpty(extension))
                {
                    string destinationDirectory = Path.Combine(directoryPath, extension);
                    if (!Directory.Exists(destinationDirectory))
                        Directory.CreateDirectory(destinationDirectory);

                    string destinationFile = Path.Combine(destinationDirectory, Path.GetFileName(file));
                    if(!File.Exists(destinationFile))
                        File.Move(file, destinationFile);
                    else
                        Console.WriteLine("Файл уже существует");
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ошибка: {ex.InnerException.Message}");
        }
    }
}