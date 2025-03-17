using Microsoft.Win32;
using System.IO;
using System.Net.WebSockets;
using System.Security.Cryptography;
using System.Windows;

namespace LabWork21
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

        private void BrowseButton_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog dialog = new();
            if (dialog.ShowDialog() == true)
                filePathTextBox.Text = dialog.FileName;
        }

        private async void CalculateButton_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(filePathTextBox.Text))
            {
                MessageBox.Show("Выберите файл");
                return;
            }

            try
            {
                MD5HashLabel.Content = $"MD5: {CalculateMD5Hash(filePathTextBox.Text)}";
                SHA256HashLabel.Content = $"SHA256: {CalculateSHA256Hash(filePathTextBox.Text)}";
            }

            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.InnerException.Message}");
                throw;
            }
        }

        private string CalculateSHA256Hash(string filepath)
        {
            using(var sha256 = SHA256.Create())
            {
                using(var stream = File.OpenRead(filepath))
                {
                    byte[] hashBytes = sha256.ComputeHash(stream);
                    return BitConverter.ToString(hashBytes).Replace("-", "").ToLowerInvariant();
                }                
            }
        }

        private string CalculateMD5Hash(string filepath)
        {
            using(var  md5 = MD5.Create())
            {
                using(var stream = File.OpenRead(filepath))
                {
                    byte[] hashBytes = md5.ComputeHash(stream);
                    return BitConverter.ToString(hashBytes).Replace("-", "").ToLowerInvariant();
                }
            }
        }
    }
}