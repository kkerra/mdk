List<string> currencies = ["usd", "eur", "byn"];
Console.WriteLine($"Введите количество элементов:");
int currenciesCount = Convert.ToInt32(Console.ReadLine());
Console.WriteLine($"Введите валюты:");
for (int i = 0; i < currenciesCount; i++)
    currencies.Add(Console.ReadLine());

Console.WriteLine($"Элементы списка:");
for (int i = 0; i < currencies.Count; i++)
    Console.WriteLine($"{i + 1}: {currencies[i]}");

Console.WriteLine($"Укажите 2 позиции");
int startPosition = Convert.ToInt32(Console.ReadLine());
int endPosition = Convert.ToInt32(Console.ReadLine());
Console.WriteLine($"Элементы списка между {startPosition} и {endPosition}:");
for (int i = startPosition; i <= endPosition; i++)
    Console.WriteLine($"{i}: {currencies[i]}");

Dictionary<string, int> users = new()
{
    { "user", 25 },
    { "admin", 36 },
    { "manager", 19 }
};
Console.WriteLine($"Введите количество элементов:");
int usersCount = Convert.ToInt32(Console.ReadLine());
Console.WriteLine($"Введите логин и возраст:");
for (int i = 0; i < usersCount; i++)
{
    string login = Console.ReadLine();
    int age = Convert.ToInt32(Console.ReadLine());
    users.Add(login, age);
}

Console.WriteLine($"Элементы словаря:");
foreach (var pair in users)
    Console.WriteLine($"{pair.Key} - {pair.Value}");

Console.WriteLine($"Введите ключ для проверки:");
string key = Console.ReadLine();
if (users.ContainsKey(key))
    Console.WriteLine($"Ключ {key} найден со значением {users[key]}");
else
    Console.WriteLine($"Ключ не найден");

Console.WriteLine($"Введите значение:");
int value = Convert.ToInt32(Console.ReadLine());
int valuesCount = 0;
foreach (var pair in users)
{
    if (pair.Value == value)
        valuesCount++;
}
Console.WriteLine($"Значение {value} найдено {valuesCount} раз");

Console.WriteLine($"Введите ключ для удаления");
key = Console.ReadLine();
users.Remove(key);
Console.WriteLine($"Элементы словаря после удаления:");
foreach (var pair in users)
    Console.WriteLine($"{pair.Key} - {pair.Value}");