Random random = new();
Console.WriteLine("Введите количество строк");
int rows = Convert.ToInt32(Console.ReadLine());
Console.WriteLine("Введите количество столбцов");
int columns = Convert.ToInt32(Console.ReadLine());
int[,] array = new int[rows, columns];

for (int i = 0; i < array.GetLength(0); i++)
{
    for (int j = 0; j < columns; j++)
    {
        array[i, j] = -1;
    }
}

for (int i = 0; i < array.GetLength(1); i++)
{
    int obstacleX = random.Next(0, rows);
    int obstacleY = random.Next(0, columns);
    if (array[obstacleX, obstacleY] == -1)
        array[obstacleX, obstacleY] = -2;
    else
        i--;
}

Console.WriteLine("Введите координаты x и y исходной точки");
int startX = Convert.ToInt32(Console.ReadLine());
int startY = Convert.ToInt32(Console.ReadLine());
array[startX, startY] = 0;

int finishX, finishY;
do
{
    finishX = random.Next(0, rows);
    finishY = random.Next(0, columns);
} while (finishX == startX && finishY == startY);

array[finishY, finishX] = 99;

for (int i = 0; i < array.GetLength(0); i++)
{
    for (int j = 0; j < array.GetLength(1); j++)
    {
        Console.Write($"{array[i, j]}\t");
    }
    Console.WriteLine();
}

int[,] heuristics = new int[rows, columns];

for (int i = 0; i < array.GetLength(0); i++)
{
    for (int j = 0; j < array.GetLength(1); j++)
    {
        heuristics[i, j] = Math.Abs(i - finishX) + Math.Abs(j - finishY);
    }
}

Console.WriteLine("Эвристика:");
for (int i = 0; i < array.GetLength(0)  ; i++)
{
    for (int j = 0; j < array.GetLength(1); j++)
    {
        Console.Write($"{heuristics[i, j]}\t");
    }
    Console.WriteLine();
}