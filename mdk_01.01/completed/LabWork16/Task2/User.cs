using System.ComponentModel;

namespace Task2
{
    internal class User
    {
        string _login;
        string _password;

        public event EventHandler UserChanged;

        public string Login
        {
            get => _login;
            set
            {
                _login = value;
                OnUserChanged();
            }
        }

        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                OnUserChanged();
            }
        }

        public void OnUserChanged()
        {
            UserChanged(this, EventArgs.Empty);
        }
    }
}
