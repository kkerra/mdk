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

namespace Task4
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
            var result = directories.Join(files, files => directory.Name, directory => directory.Name, (file, directory) => file)
                .Where(file => file.CreationTime.Date == DateTime.Today);
            filesDataGrid.ItemsSource = result.ToList();
        }
    }
}