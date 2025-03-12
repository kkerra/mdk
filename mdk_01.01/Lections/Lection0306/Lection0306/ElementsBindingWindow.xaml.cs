using System.Windows;

namespace Lection0306
{
    /// <summary>
    /// Логика взаимодействия для ElementsBindingWindow.xaml
    /// </summary>
    public partial class ElementsBindingWindow : Window
    {
        User SampleUser { get; set; }

        public ElementsBindingWindow()
        {
            InitializeComponent();
            SampleUser = new User()
            {
                Login = "admin",
                Password = "qwerty"
            };

            //DataContext = this;
        }
    }
}
