int[] array = { 7, 0, -4, 3, 1, -2, 5 };

Console.Write($"\nПроход 1: ");
for (int i = 0; i < array.Length; i++)
{
    Console.Write($"{array[i]}\t");
}

for (int i = 0; i < array.Length; i++)
{
    for (int j = array.Length - 2; j >= 0; j--)
    {
        if (array[j] > array[j + 1])
        {
            int temp = array[j];
            array[j] = array[j + 1];
            array[j + 1] = temp;
        }
    }

    Console.Write($"\nПроход {i + 2}: ");
    for (int j = 0; j < array.Length; j++)
    {
        Console.Write($"{array[j]}\t");
    }
}