delegate void MathOperation(int x, int y);

class Program
{
    static void Main()
    {
        MathOperation mathOperation = Sum;
        mathOperation += Subtraction;
        mathOperation += Multiplication;
        mathOperation += Division;
        mathOperation?.Invoke(6, 3);
    }

    static void Sum(int x, int y)
    {
        Console.WriteLine($"Сумма: {x + y}");
    }

    static void Subtraction(int x, int y)
    {
        Console.WriteLine($"Разность: {x - y}");
    }

    static void Multiplication(int x, int y)
    {
        Console.WriteLine($"Произведение: {x * y}");
    }

    static void Division(int x, int y)
    {
        if (y != 0)
            Console.WriteLine($"Частное: {x / y}");
        else
            Console.WriteLine($"Частное: {-1}");
    }
}