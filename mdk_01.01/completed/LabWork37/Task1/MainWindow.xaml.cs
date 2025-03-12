using System.IO;
using System.Windows;
using System.Windows.Controls;

namespace Task1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DirectoryInfo directory => new(directoryTextBox.Text);

        public MainWindow()
        {
            InitializeComponent();
            FilterData();
        }
        private void FilterData()
        {
            FileInfo[] files = directory.GetFiles("*", SearchOption.AllDirectories);
            var result = files.AsEnumerable();
            if (filterTextBox.Text != "")
                result = result.Where(file => file.Name.Contains(filterTextBox.Text));
            filesDataGrid.ItemsSource = result.ToList();
            countLabel.Content = $"Показано {result.Count()} из {files.Length}";
        }

        private void FilterTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            FilterData();
        }

        private void ResetFilterButton_Click(object sender, RoutedEventArgs e)
        {
            filterTextBox.Clear();
        }
    }
}