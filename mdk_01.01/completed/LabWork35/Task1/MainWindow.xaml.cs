using Microsoft.Win32;
using System.IO;
using System.Windows;

namespace Task1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void OpenButton_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog dialog = new();
            dialog.Filter = "документ|*.txt|код|*.cs|разметка|*.html|файл стилей|*.css|код JS|*.js|запросы SQL|*sql";
            if (dialog.ShowDialog() != true)
                return;
            string filename = dialog.FileName;
            inputTextBox.Text = File.ReadAllText(filename);
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            SaveFileDialog dialog = new();
            dialog.Filter = "документ|*.txt|код|*.cs|разметка|*.html|файл стилей|*.css|код JS|*.js|запросы SQL|*sql";
            if (dialog.ShowDialog() != true)
                return;
            string filename = dialog.FileName;
            File.WriteAllText(filename, inputTextBox.Text);
            MessageBox.Show("Файл сохранен", "Сохранение", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (MessageBox.Show("Вы хотите закрыть приложение?",
                "Подтверждение",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question) != MessageBoxResult.Yes)
                e.Cancel = true;
        }
    }
}