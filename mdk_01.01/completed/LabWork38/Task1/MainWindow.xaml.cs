using System.IO;
using System.Windows;

namespace Task1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DirectoryInfo directory => new(directoryTextBox.Text);
        private int pageSize = 5;
        private int pagesCount = 1;

        public MainWindow()
        {
            InitializeComponent();
            UpdateData();
        }

        private void UpdateData()
        {
            FileInfo[] files = directory.GetFiles("*", SearchOption.AllDirectories);
            var result = files.Take(pageSize * pagesCount);
            filesDataGrid.ItemsSource = result.ToList();

            countLabel.Content = $"Показано {result.Count()} из {files.Length}";
            if (pagesCount * pageSize >= files.Length)
                showMoreButton.IsEnabled = false;
        }

        private void ShowMoreButton_Click(object sender, RoutedEventArgs e)
        {
            pagesCount++;
            UpdateData();
        }

        private void PageSizeTextBox_TextChanged(object sender, System.Windows.Controls.TextChangedEventArgs e)
        {
            if (Int32.TryParse(pageSizeTextBox.Text, out int newPage))
            {
                pageSize = newPage;
                pagesCount = 1;
                showMoreButton.IsEnabled = true;
                UpdateData();
            }
        }
    }
}