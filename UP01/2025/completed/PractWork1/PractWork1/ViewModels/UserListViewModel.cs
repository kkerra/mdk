using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PractWork1.ViewModels
{
    public partial class UserListViewModel : ViewModelBase
    {
        [ObservableProperty]
        public ObservableCollection<User> users = new();

        public UserListViewModel()
        {
            Users.Add(new User { Login = "Login1", Email = "Email1", Password = "Password1", Phone = "Phone1" });
            Users.Add(new User { Login = "Login2", Email = "Email2", Password = "Password2", Phone = "Phone2" });
            Users.Add(new User { Login = "Login3", Email = "Email3", Password = "Password3", Phone = "Phone3" });
        }

        [RelayCommand]
        private void DeleteUser(User user)
        {
            if(user != null)
            {
                Users.Remove(user);
            }
        }
    }
}
