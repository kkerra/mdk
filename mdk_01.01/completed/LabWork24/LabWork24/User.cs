namespace LabWork24
{
    internal class User
    {
        private string _login;
        private string _password;

        public bool IsCorrectUserData(string login, string password, string passwordVerification)
        {
            bool isLoginCorrect = login.Length > 0;
            bool isPasswordCorrect = password.Length > 0;
            bool isConfirmCorrect = password == passwordVerification;
            if (isLoginCorrect && isPasswordCorrect && isConfirmCorrect)
                return true;
            return false;
        }

        public void SetUserData(string login, string password)
        {
            _login = login;
            _password = password;
        }
    }
}
