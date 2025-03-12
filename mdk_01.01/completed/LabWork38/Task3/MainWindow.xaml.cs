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

namespace Task3
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DirectoryInfo directory => new(directoryTextBox.Text);
        private int pageSize = 5;
        private int currentPage = 1;

        public MainWindow()
        {
            InitializeComponent();
            UpdateData();
        }

        private void UpdateData()
        {
            FileInfo[] files = directory.GetFiles("*", SearchOption.AllDirectories);
            var result = files
                .Skip(currentPage * pageSize)
                .Take(pageSize);

            filesDataGrid.ItemsSource = result.ToList();
            countLabel.Content = $"Показано {currentPage * pageSize} из {files.Length}";
            if (currentPage * pageSize >= files.Length)
                showMoreButton.IsEnabled = false;
        }

        private void PageTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if(Int32.TryParse(pageTextBox.Text, out int newPage))
            {
                currentPage = newPage;
                UpdateData();
            }
        }

        private void PageSizeTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (Int32.TryParse(pageSizeTextBox.Text, out int newPage))
            {
                pageSize = newPage;
                currentPage = 1;
                UpdateData();
            }
        }
    }
}