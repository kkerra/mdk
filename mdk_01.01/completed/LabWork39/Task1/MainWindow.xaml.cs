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

        public MainWindow()
        {
            InitializeComponent();
            FilterData();
        }

        private void FilterData()
        {
            FileInfo[] files = directory.GetFiles("*", SearchOption.AllDirectories);
            DirectoryInfo[] directories = directory.GetDirectories("*", SearchOption.AllDirectories);
            var result = files
                .Select(file => new { file.Name, file.CreationTime })
                .Union(directories
                    .Select(directory => new { directory.Name, directory.CreationTime }));
            filesDataGrid.ItemsSource = result.ToList();
        }
    }
}