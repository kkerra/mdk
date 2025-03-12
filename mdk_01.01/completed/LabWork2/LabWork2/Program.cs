static int LinearSearch(int[] array, int value)
{
    for (int i = 0; i < array.Length; i++)
    {
        if (array[i] == value)
        {
            return i;
        }
    }
    return -1;
}

int[] array = { 97, 45, 32, 65, 83, 23, 15 };
Console.WriteLine(LinearSearch(array, 8));

