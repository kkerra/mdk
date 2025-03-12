static int JumpSearch(int[] array, int value)
{
    Array.Sort(array);
    int jumpStep = (int)Math.Floor(Math.Sqrt(array.Length));
    int previousStep = 0;
    while (array[Math.Min(jumpStep, array.Length) - 1] < value)
    {
        previousStep = jumpStep;
        jumpStep += (int)Math.Floor(Math.Sqrt(array.Length));
        if (previousStep >= array.Length)
            return -1;
    }

    while (array[previousStep] < value)
    {
        previousStep++;
        if (previousStep == Math.Min(jumpStep, array.Length))
            return -1;
    }

    if (array[previousStep] == value)
        return previousStep;
    return -1;
}

int[] array = { 97, 45, 32, 65, 83, 23, 15 };
Console.WriteLine(JumpSearch(array, 23));