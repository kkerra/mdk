using LabWork27.Pages;
using System.Windows;

namespace LabWork27
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            Manager.MainFrame = ContentFrame;
            Manager.MainFrame.Navigate(new MainPage());
        }

        private void ContentFrame_ContentRendered(object sender, EventArgs e)
        {
            if (ContentFrame.CanGoBack)
                BackButton.Visibility = Visibility.Visible;
            else
                BackButton.Visibility = Visibility.Hidden;
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            ContentFrame.GoBack();
        }
    }
}