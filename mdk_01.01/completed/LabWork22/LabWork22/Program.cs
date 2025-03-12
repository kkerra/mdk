void GetPower(double a, int x)
{
    double result = 1;
    if (x < 0)
    {
        for (int i = 0; i > x; i--)
            result /= a;
    }
    for (int i = 0; i < x; i++)
        result *= a;
    Console.WriteLine($"{a}^{x}  = {result}");
}

double CalculatePower(double a, int x)
{
    double result = 1;
    if (x < 0)
    {
        for (int i = 0; i > x; i--)
            result *= a;
        return 1 / result;
    }
    for (int i = 0; i < x; i++)
        result *= a;
    return result;
}

async Task<double> CalculateEquationAsync(double a1, double a2, double a3, double a4, int x1, int x2, int x3, int x4)
{
    double dividend = await Task.Run(() => CalculatePower(a1, x1)) + await Task.Run(() => CalculatePower(a2, x2));
    double divisor = await Task.Run(() => CalculatePower(a3, x3)) - await Task.Run(() => CalculatePower(a4, x4));
    return dividend / divisor;
}

async Task WriteNumberAsync(string filename, int n)
{
    Console.WriteLine("Запись начата");
    Random random = new();
    using (StreamWriter writer = new(filename, false))
    {
        for (int i = 0; i < n; i++)
            await writer.WriteLineAsync($"Число {i + 1}: {random.Next()}");
    }
    Console.WriteLine("Запись закончена");
}

async Task ReadNumberAsync(string filename)
{
    Console.WriteLine("Чтение начато");
    Random random = new();
    using (StreamReader reader = new(filename))
    {
        string line;
        while ((line = await reader.ReadLineAsync()) != null)
        {
            Console.WriteLine($"{filename}: {line}");
        }
    }
    Console.WriteLine("Чтение закончено");
}

await Task.Run(() => GetPower(2, 4));
await Task.Run(() => GetPower(2, 5));
await Task.Run(() => GetPower(2, -2));

await Task.WhenAll
    (
    Task.Run(() => GetPower(2, 7)),
    Task.Run(() => GetPower(2, 8)),
    Task.Run(() => GetPower(2, 9))
    );

var results = await Task.WhenAll
    (
    Task.Run(() => CalculatePower(4, 3)),
    Task.Run(() => CalculatePower(5, 2)),
    Task.Run(() => CalculatePower(6, -2))
    );
foreach (var result in results)
    Console.WriteLine(result);

Console.WriteLine(await CalculateEquationAsync(2, 2, 2, 2, 2, 2, 2, 3));

var filename = Path.Combine(Environment.CurrentDirectory, "RandomNumber2.txt");
await WriteNumberAsync(filename, 100000);
Console.WriteLine("Конец программы");

await ReadNumberAsync(filename);
Console.WriteLine("Конец программы");
