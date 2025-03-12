namespace Task3
{
    internal class User
    {
        string _login;
        string _password;
        public event EventHandler<InfoEventArgs> PropertyChanged;

        public string Login
        {
            get => _login;
            set => _login = value;

        }
        public string Password
        {
            get => _password;
            set => _password = value;
        }

        public void OnPropertyChanged(string propertyName)
        {
            
        }
    }
}
