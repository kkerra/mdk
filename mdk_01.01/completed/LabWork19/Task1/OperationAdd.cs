namespace Task1
{
    internal class OperationAdd : IStrategy
    {
        public int DoOperation(int number1, int number2)
            => number1 + number2;
    }
}
