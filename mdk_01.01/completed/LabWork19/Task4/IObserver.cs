namespace Task4
{
    internal abstract class IObserver
    {
        protected Subject subject;
        public abstract void Update();
    }
}
