static int BinarySearch(int[] array, int value)
{
    Array.Sort(array);
    int left = 0, right = array.Length - 1;
    while (left <= right)
    {
        int middle = (left + right) / 2;
        if (array[middle] == value)
            return middle;
        if (array[middle] < value)
            left = middle + 1;
        right = middle - 1;
    }
    return -1;
}

int[] array = { 97, 45, 32, 65, 83, 23, 15 };
Console.WriteLine(BinarySearch(array, 5));