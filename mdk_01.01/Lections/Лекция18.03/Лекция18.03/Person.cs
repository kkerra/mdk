using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Лекция18._03
{
    internal class Person : INotifyPropertyChanged
    {
        string name;
        int age;

        public string Name
        {
            get => name;
            set
            {
                name = value;
            }
        }
        public int Age
        {
            get => age;
            set
            {
                age = value;
            }
        }

        public event PropertyChangedEventHandler? PropertyChanged;

        private void NotifyPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
