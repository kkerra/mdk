Console.WriteLine("Укажите имя файла:");
string filename = Console.ReadLine();
if(!File.Exists(filename))
    Console.WriteLine("Файл не существует");
else
    Console.WriteLine(File.ReadAllText(filename));