using System.ComponentModel.DataAnnotations;

namespace PractWork1.ViewModels
{
    public partial class RegistrationViewModel : ViewModelBase
    {
        [Required(ErrorMessage = "Логин обязательное поле")]
        [RegularExpression(@"^[a-zA-Z0-9_]+$", ErrorMessage = "Логин может содержать латинские буквы, цифры и нижнее подчеркивание")]
        public string Login { get => login; set => SetProperty(ref login, value); }

        [Required(ErrorMessage = "Пароль обязательное поле")]
        [MinLength(8, ErrorMessage = "Пароль должен состоять минимум из 8 символов")]
        [RegularExpression(@"[0-9a-zA-Z!@#$%^&*]{8,}", ErrorMessage = "Пароль может содержать латинские буквы верхнего и нижнего регистра, цифры и спецсимволы (!@#$%^&*)")]
        public string Password { get => password; set => SetProperty(ref password, value); }

        [Required(ErrorMessage = "Поле подтверждения пароля обязательно")]
        [Compare(nameof(Password))]
        public string ConfirmPassword { get => confirmPassword; set => SetProperty(ref confirmPassword, value); }

        [Required(ErrorMessage = "Электронная почта обязательное поле")]
        [EmailAddress]
        public string Email { get => email; set => SetProperty(ref email, value); }

        [Required(ErrorMessage = "Номер телефона обязательное поле")]
        [Phone]
        public string Phone { get => phone; set => SetProperty(ref phone, value); }

        private string login;
        private string password;
        private string confirmPassword;
        private string email;
        private string phone;

        public void CreateError()
        {

        }
    }
}
