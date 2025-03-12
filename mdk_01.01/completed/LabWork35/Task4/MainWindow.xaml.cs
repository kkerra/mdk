using Microsoft.Win32;
using System.Windows;

namespace Task4
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
            dialog.Filter = "Изображения|*.png;*.jpg;*.jpeg;*.bmp";
            dialog.Multiselect = true;
            if (dialog.ShowDialog() != true)
                return;
            imagesListView.ItemsSource = dialog.FileNames;
        }
    }
}