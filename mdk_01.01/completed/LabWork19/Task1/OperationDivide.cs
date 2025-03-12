namespace Task1
{
    internal class OperationDivide : IStrategy
    {
        public int DoOperation(int number1, int number2)
        {
            if (number2 == 0)
                return -1;
            else
                return number1 / number2;
        }
    }
}
