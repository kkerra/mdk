using System.IO;
using System.Windows;

namespace Task5
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
            DirectoryInfo[] directories = directory.GetDirectories("*", SearchOption.AllDirectories);
            var result = directories
                .GroupJoin(files, directory => directory.FullName, file => file.Directory.FullName, (directory, files)
                => new { Directory = directory.FullName, FileCount = files.Count() });
            filesDataGrid.ItemsSource = result.ToList();
        }
    }
}