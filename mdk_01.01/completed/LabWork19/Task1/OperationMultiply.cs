namespace Task1
{
    internal class OperationMultiply : IStrategy
    {
        public int DoOperation(int number1, int number2)
            => number1 * number2;
    }
}
