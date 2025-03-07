### validation in c#

```c#
using System.ComponentModel.DataAnnotations;

namespace validation
{
    public class User
    {
        [Required]
        [StringLength(100)]
        public string Login { get; set; }
        [Required]
        [StringLength(100, MinimumLength = 8)]
        [RegularExpression(@"\d+")]
        public string Password { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        [Phone]
        public string PhoneNumber { get; set; }
        [Required]
        [Compare(nameof(Password))]
        public string ConfirmPassword { get; set; }
    }
}
```

```c#
using System.ComponentModel.DataAnnotations;
using validation;

User user = new User();

user.Login = Console.ReadLine();
user.Email = Console.ReadLine();
user.Password = Console.ReadLine();
user.ConfirmPassword = Console.ReadLine();
user.Login = Console.ReadLine();

var context = new ValidationContext(user);

var results = new List<ValidationResult>();

if (!Validator.TryValidateObject(user, context, results, true))
{
    foreach (var validationResult in results)
        Console.WriteLine(validationResult.ErrorMessage);
}
else
{
    Console.WriteLine("успех");
}
```

formatted string/error string

![image](https://github.com/user-attachments/assets/88392510-decc-4a3f-9a13-ab1bb9ef3942)

