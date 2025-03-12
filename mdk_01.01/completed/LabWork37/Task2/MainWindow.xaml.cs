using System.IO;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Task2
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
            if (greaterSizeRadioButton.IsChecked == true)
                result = result.Where(file => file.Length >= Convert.ToInt32(sizeTextBox.Text));
            if(lessSizeRadioButton.IsChecked == true)
                result = result.Where(file => file.Length <= Convert.ToInt32(sizeTextBox.Text));
            filesDataGrid.ItemsSource = result.ToList();
            countLabel.Content = $"Показано {result.Count()} из {files.Length}";
        }
        private void ResetFilterButton_Click(object sender, RoutedEventArgs e)
        {
            sizeTextBox.Clear();
        }

        private void SizeTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            FilterData();
        }
    }
}