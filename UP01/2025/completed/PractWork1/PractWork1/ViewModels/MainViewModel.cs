using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;

namespace PractWork1.ViewModels;

public partial class MainViewModel : ViewModelBase
{
    [ObservableProperty]
    private ViewModelBase _currentPage;

    public MainViewModel()
    {
        CurrentPage = new HomeViewModel();
    }

    [RelayCommand]
    public void GoHomePage()
    {
        CurrentPage = new HomeViewModel();
    }

    [RelayCommand]
    public void GoRegistrationPage()
    {
        CurrentPage = new RegistrationViewModel();
    }

    [RelayCommand]
    public void GoUserListPage()
    {
        CurrentPage = new UserListViewModel();
    }
}
