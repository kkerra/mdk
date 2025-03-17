using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace PractWork1.ViewModels
{
    public partial class HomeViewModel : ViewModelBase
    {
        public string Greeting => "Welcome to Avalonia!";

        [ObservableProperty]
        [NotifyCanExecuteChangedFor(nameof(CreateMessageCommand))]
        private string input = "";
        [ObservableProperty]
        private bool isChecked = true;
        [ObservableProperty]
        private bool optionSelected;
        [ObservableProperty]
        private DateTime currentDateTime = DateTime.Now;
        [ObservableProperty]
        private string selectedComboBox = "1";
        [ObservableProperty]
        private string message = "";
        private string comboValue;

        public string ComboValue 
        { 
            get => comboValue; 
            set => SetProperty(ref comboValue, value); 
        }

        public HomeViewModel()
        {
            DoSomethingCommand = new RelayCommand(CreateMessage, CanCreateMessage);
        }

        [RelayCommand(CanExecute = nameof(CanCreateMessage))]
        private void CreateMessage()
        {
            Message = $"{Input} {IsChecked} {OptionSelected} {CurrentDateTime} {SelectedComboBox}";
        }

        private bool CanCreateMessage()
        {
            return !String.IsNullOrEmpty(Input);
        }

        public ICommand DoSomethingCommand { get; set; }

    }
}
