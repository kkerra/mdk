using System.Runtime.ConstrainedExecution;

internal class Program
{
    private static void Main(string[] args)
    {
        Console.WriteLine("Введите путь к исходному каталог:");
        string sourceDirectoryPath = Console.ReadLine();

        Console.WriteLine("Введите путь к целевому каталогу:");
        string destinationDirectoryPath = Console.ReadLine();
        if (Directory.Exists(sourceDirectoryPath))
        {
            FileProcessing(sourceDirectoryPath, destinationDirectoryPath);
        }
        else
            Console.WriteLine("Указанный исходный каталог не существует");
    }

    private static void FileProcessing(string sourceDirectoryPath, string? destinationDirectoryPath)
    {
        try
        {
            string[] files = Directory.GetFiles(sourceDirectoryPath);
            foreach (string file in files)
            {
                string destinationCategoryDirectory = Path.Combine(destinationDirectoryPath, GetCategory(Path.GetExtension(file).Trim('.').ToLower()));
                if (!Directory.Exists(destinationCategoryDirectory))
                    Directory.CreateDirectory(destinationCategoryDirectory);

                string destinationFile = Path.Combine(destinationCategoryDirectory, Path.GetFileName(file));
                if (!File.Exists(destinationFile))
                    File.Copy(file, destinationFile);
                else
                    Console.WriteLine("Файл уже существует");
            }
        }
        catch (Exception)
        {

            throw;
        }
    }

    private static string GetCategory(string extension)
    {
        return extension switch
        {
            "zip" or "rar" or "7z" => "архивы",
            "jpeg" or "jpg" or "bmp" or "png" or "gif" => "изображения",
            "txt" or "rtf" or "odt" or "doc" or "docx" => "текстовые документы",
            _ => "другое",
        };
    }
}