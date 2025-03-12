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

        public MainWindow()
        {
            InitializeComponent();
            FilterData();
        }

        private void FilterData()
        {
            FileInfo[] files = directory.GetFiles("*", SearchOption.AllDirectories);
            var result = files
                .GroupBy(file => new { file.CreationTime.Year, file.CreationTime.Month })
                .Select(group => new { group.Key.Year, group.Key.Month, FileCount = group.Count() });
            filesDataGrid.ItemsSource = result.ToList();
        }
    }
}