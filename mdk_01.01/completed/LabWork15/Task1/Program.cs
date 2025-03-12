delegate int MathOperation(int x);

class Program
{
    static void Main()
    {
        MathOperation operation = Square;
        Console.WriteLine($"Квадрат: {operation?.Invoke(5)}");

        operation = Factorial;
        Console.WriteLine($"Факториал: {operation?.Invoke(5)}");

        operation = Absolute;
        Console.WriteLine($"Модуль: {operation?.Invoke(-5)}");

        MathOperation[] mathOperations = [Square, Factorial, Absolute];
        foreach (var mathOperation in mathOperations)
        {
            Console.WriteLine(mathOperation(5));
        }

        foreach (var mathOperation in mathOperations)
        {
            PrintResult(mathOperation, 5);
        }
    }

    static int Square(int x)
    {
        return x * x;
    }

    static int Factorial(int x)
    {
        if (x == 0)
        {
            return 1;
        }
        else if (x < 0)
        {
            return -1;
        }
        return x * Factorial(x - 1);
    }

    static int Absolute(int x)
    {
        return Math.Abs(x);
    }

    static void PrintResult(MathOperation operation, int x)
    {
        Console.WriteLine(operation(x));
    }
}