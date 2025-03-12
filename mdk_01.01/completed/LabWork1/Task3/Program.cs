int[] array = { 7, 0, -4, 3, 1, -2, 5 };

Console.Write($"\nПроход 1: ");
for (int i = 0; i < array.Length; i++)
{
    Console.Write($"{array[i]}\t");
}

for (int i = 2; i < array.Length; i++)
{
    int x = array[i];
    int temp = i - 1;
    while (x < array[temp] && temp >= 1)
    {
        array[temp + 1] = array[temp];
        temp--;
    }
    array[temp + 1] = x;

    Console.Write($"\nПроход {i + 1}: ");
    for (int j = 0; j < array.Length; j++)
    {
        Console.Write($"{array[j]}\t");
    }
}