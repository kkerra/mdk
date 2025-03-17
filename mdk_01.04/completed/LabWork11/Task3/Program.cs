internal class Program
{
    private static void Main(string[] args)
    {
        string filePath = null;
        string searchText = null;

        for (int i = 0; i < args.Length; i++)
        {
            switch (args[i])
            {
                case "-file":
                    if (i + 1 < args.Length)
                    {
                        filePath = args[i + 1];
                        i++;
                    }
                    else
                    {
                        Console.WriteLine("Отсутствует путь к файлу");
                        return;
                    }
                    break;
                case "-text":
                    if (i + 1 < args.Length)
                    {
                        searchText = args[i + 1];
                        i++;
                    }
                    else
                    {
                        Console.WriteLine("Отсутствует путь к файлу");
                        return;
                    }
                    break;
                default:
                    Console.WriteLine($"{args[i]} флага не существует");
                    break;
            }
        }

        if (!File.Exists(filePath))
        {
            Console.WriteLine("Файл не существует");
            return;
        }

        string[] lines = File.ReadAllLines(filePath);
        bool found = false;
        int lineNumber = 1;
        using (StreamReader reader = new(filePath))
        {
            string line;
            while ((line = reader.ReadLine()) != null)
            {
                if (line.Contains(searchText, StringComparison.OrdinalIgnoreCase))
                {
                    Console.WriteLine($"Строка: {lineNumber} - {line}");
                    found = true;
                }
                lineNumber++;
            }
        }
        if (!found)
            Console.WriteLine("Совпадений не найдено");
    }
}