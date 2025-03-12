using System.IO;
using System.Windows;

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
            var result = files
                .GroupBy(file => file.Extension)
                .Select(group => new { Extension = group.Key, TotalSize = group.Sum(file => file.Length), FileCount = group.Count() });
            filesDataGrid.ItemsSource = result.ToList();
        }
    }
}