using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Windows;

namespace LabWork22
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private string FileName = "passwords.txt";
        private List<SitesPassword> passwords = new List<SitesPassword>();
        private byte[] key =
{
0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
0x09, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16
};

        public MainWindow()
        {
            InitializeComponent();
            DataContext = this;
            LoadPasswords();
        }

        private void LoadPasswords()
        {
            try
            {
                if (File.Exists(FileName))
                {
                    using (StreamReader reader = new(FileName))
                    {
                        string line;
                        while ((line = reader.ReadLine()) != null)
                        {
                            string[] parts = line.Split(';');
                            if (parts.Length == 3)
                                passwords.Add(new SitesPassword { Site = parts[0], Login = parts[1], Password = AesDescrypt(parts[2]) });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.InnerException.Message}");
            }
            passwordsListView.ItemsSource = passwords;
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(siteTextBox.Text)
               || String.IsNullOrEmpty(loginTextBox.Text)
               || String.IsNullOrEmpty(passwordTextBox.Text))
            {
                MessageBox.Show("Заполните все поля");
                return;
            }
            try
            {
                using (StreamWriter writer = File.AppendText(FileName))
                {
                    writer.WriteLine($"{siteTextBox.Text};{loginTextBox.Text};{AesEncrypt(passwordTextBox.Text)}");
                }
                passwords.Add(new SitesPassword { Site = siteTextBox.Text, Login = loginTextBox.Text, Password = passwordTextBox.Text });
                passwordsListView.ItemsSource = null;
                passwordsListView.ItemsSource = passwords;

                siteTextBox.Clear();
                loginTextBox.Clear();
                passwordTextBox.Clear();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.InnerException.Message}");
            }
        }

        private string AesEncrypt(string password)
        {

            using (Aes aes = Aes.Create())
            {
                aes.Key = key;
                byte[] iv = aes.IV;
                using (MemoryStream stream = new())
                {
                    stream.Write(iv, 0, iv.Length);

                    using (CryptoStream cryptoStream = new(stream, aes.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        using (StreamWriter writer = new(cryptoStream))
                        {
                            writer.Write(password);
                        }
                    }
                    return Convert.ToBase64String(stream.ToArray());
                }
            }
        }

        private string AesDescrypt(string password)
        {
            byte[] fullCipher = Convert.FromBase64String(password);
            using (Aes aes = Aes.Create())
            {
                aes.Key = key;

                byte[] iv = new byte[aes.IV.Length];
                Array.Copy(fullCipher, 0, iv, 0, iv.Length);

                byte[] cipher = new byte[fullCipher.Length - iv.Length];
                Array.Copy(fullCipher, iv.Length, cipher, 0, cipher.Length);
                using(MemoryStream stream = new(cipher))
                {
                    using (CryptoStream cryptoStream = new(stream, aes.CreateDecryptor(key, iv), CryptoStreamMode.Read))
                    {
                        using(StreamReader reader = new(cryptoStream))
                        {
                            return reader.ReadToEnd();
                        }
                    }
                }
            }
        }

        private void GeneratePasswordButton_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(passwordLengthTextBox.Text))
            {
                MessageBox.Show("Введите длину пароля");
                return;
            }
            StringBuilder password = new();
            Random random = new();
            while (password.Length < Convert.ToInt32(passwordLengthTextBox.Text))
            {
                var type = random.Next(3);
                int charCode = type switch
                {
                    0 => random.Next((int)'A', (int)'Z' + 1),
                    1 => random.Next((int)'a', (int)'z' + 1),
                    _ => random.Next((int)'0', (int)'9' + 1),
                };
                char randomChar = (char)charCode;
                password.Append(randomChar);
            }
            passwordTextBox.Text = password.ToString();
        }
    }
}