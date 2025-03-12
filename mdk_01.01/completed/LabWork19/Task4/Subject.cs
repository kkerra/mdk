using System;

namespace Task4
{
    internal class Subject
    {
        private List<IObserver> observers = [];
        private int _state;

        public int GetState()
        {
            return _state;
        }

        public void SetState(int state)
        {
            this._state = state;
            NotifyAllObservers();
        }

        public void Attach(IObserver observer)
        {
            observers.Add(observer);
        }

        public void NotifyAllObservers()
        {
            //for (IObserver observer : observers)
            //{
            //    observer.Update();
            //}
        }
    }
}
