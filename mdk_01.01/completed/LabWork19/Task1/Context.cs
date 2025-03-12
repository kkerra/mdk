namespace Task1
{
    internal class Context
    {
        private IStrategy _strategy;

        public Context(IStrategy strategy)
        {
            this._strategy = strategy;
        }

        public int ExecuteStrategy(int number1, int number2)
        {
            return _strategy.DoOperation(number1, number2);
        }
    }
}
