int[] array = { 7, 0, -4, 3, 1, -2, 5 };

Console.Write($"\nПроход 1: ");
for (int i = 0; i < array.Length; i++)
{
    Console.Write($"{array[i]}\t");
}

for (int i = 0; i < array.Length - 1; i++)
{
    int min = i;
    for (int j = i + 1; j < array.Length; j++)
    {
        if (array[j] < array[min])
        {
            min = j;
        }
    }
    if (min != i)
    {
        int temp = array[i];
        array[i] = array[min];
        array[min] = temp;
    }

    Console.Write($"\nПроход {i + 2}: ");
    for (int j = 0; j < array.Length; j++)
    {
        Console.Write($"{array[j]}\t");
    }
}

