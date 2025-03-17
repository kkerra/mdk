using System.Collections;
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
using Task2;

namespace Task3
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
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

            var dublicates = FindDuplication(folderPathTextBox.Text);
            filesListView.ItemsSource = dublicates;
        }

        private List<FileInfoHash> FindDuplication(string text)
        {
            var fileHashes = new Dictionary<string, List<string>>();
            var duplicateFiles = new List<FileInfoHash>();

            var files = Directory.GetFiles(folderPathTextBox.Text, "*.*", SearchOption.AllDirectories);

            foreach (var file in files)
            {
                string hash = CalculateMd5Hash(file);
                if (!fileHashes.ContainsKey(hash))
                    fileHashes[hash] = [];
                fileHashes[hash].Add(file);
            }

            foreach(var entry in fileHashes)
            {
                if(entry.Value.Count > 1)
                {
                    foreach(var file in entry.Value)
                    {
                        duplicateFiles.Add(new FileInfoHash()
                        {
                            FileName = System.IO.Path.GetFileName(file),
                            FilePath = file,
                        });
                    }
                }
            }
            return duplicateFiles;
        }
    }
}