using Microsoft.Win32;
using System.IO;
using System.Security.Cryptography;
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
        private List<FileInfoHash> filesHash = new();

        public MainWindow()
        {
            InitializeComponent();
            filesListView.ItemsSource = filesHash;
        }

        private string CalculateSHA256Hash(string file)
        {
            using (var sha256 = SHA256.Create())
            {
                using (var stream = File.OpenRead(file))
                {
                    byte[] hashBytes = sha256.ComputeHash(stream);
                    return BitConverter.ToString(hashBytes).Replace("-", "").ToLowerInvariant();
                }
            }
        }

        private string CalculateMd5Hash(string file)
        {
            using (var md5 = MD5.Create())
            {
                using (var stream = File.OpenRead(file))
                {
                    byte[] hashBytes = md5.ComputeHash(stream);
                    return BitConverter.ToString(hashBytes).Replace("-", "").ToLowerInvariant();
                }
            }
        }

        private void CalculateHashesButton_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(folderPathTextBox.Text))
            {
                MessageBox.Show("Выберите папку");
                return;
            }
            if (!Directory.Exists(folderPathTextBox.Text))
            {
                MessageBox.Show("Указанная папка не существует");
                return;
            }

            filesHash.Clear();
            filesListView.Items.Refresh();

            var files = Directory.GetFiles(folderPathTextBox.Text);

            foreach (var file in files)
            {
                var fileInfo = new FileInfoHash()
                {
                    FileName = System.IO.Path.GetFileName(file),
                    MD5Hash = CalculateMd5Hash(file),
                    SHA256Hash = CalculateSHA256Hash(file),
                    FilePath = System.IO.Path.GetFullPath(file)
                };
                filesHash.Add(fileInfo);
            }

            filesListView.ItemsSource = filesHash;
        }
    }
}