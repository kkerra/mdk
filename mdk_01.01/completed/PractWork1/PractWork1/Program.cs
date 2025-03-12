Console.WriteLine("Введите имя файла");
var filename = Console.ReadLine();

if (File.Exists(filename))
{
    Console.WriteLine(File.ReadAllText(filename));
}
else
{
    Console.WriteLine("Такого файла не существует");
}