using System.Windows;
using System.Drawing;
using System.Windows.Controls;

namespace LabWork34
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            datetimeItem.Content = $"Дата и время: {DateTime.Now}";

        }

        private void InputTextBox_TextChanged(object sender, TextChangedEventArgs e) 
            => charactersCountItem.Content = $"Количество символов: {inputTextBox.Text.Length}";

        private void StatusBarVisibilityItem_Click(object sender, RoutedEventArgs e)
        {
            if (statusBarVisibilityItem.IsChecked)
                statusBar.Visibility = Visibility.Visible;
            else
                statusBar.Visibility = Visibility.Hidden;
        }

        private void ClearMenuItem_Click(object sender, RoutedEventArgs e) 
            => inputTextBox.Clear();

        private void ExitMenutItem_Click(object sender, RoutedEventArgs e) 
            => this.Close();
    }
}