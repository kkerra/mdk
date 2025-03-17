using System.IO;
using System.Windows;

namespace LabWork12
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            FolderLabel.Content = Directory.GetCurrentDirectory();
        }

        private void ChooseFolderButton_Click(object sender, RoutedEventArgs e)
        {
            using FolderBrowserDialog dialog = new();
            DialogResult result = dialog.ShowDialog();
            if (result == System.Windows.Forms.DialogResult.OK)
                FolderLabel.Content = dialog.SelectedPath;
        }

        private void FindButton_Click(object sender, RoutedEventArgs e)
        {
            FilesListBox.Items.Clear();
            if (String.IsNullOrEmpty(FileTextBox.Text))
                System.Windows.MessageBox.Show("Укажите название файла");
            SearchOption option = SearchCurrentFolderRadioButton.IsChecked.Value ? SearchOption.TopDirectoryOnly : SearchOption.AllDirectories;

            try
            {
                string[] files = Directory.GetFiles(FolderLabel.Content.ToString(), $"*{FileTextBox.Text}*", option);
                foreach (string file in files)
                {
                    if(FilterBySize(file) && FilterByDate(file))
                        FilesListBox.Items.Add(file);
                }
                if (FilesListBox.Items.Count == 0)
                    System.Windows.MessageBox.Show("Не найдено файлов");
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show($"Ошибка: {ex.InnerException.Message}");
            }
        }

        private void UseFileSizeCheckBox_Checked(object sender, RoutedEventArgs e)
        {
            MinSizeTextBox.IsEnabled = true;
            MaxSizeTextBox.IsEnabled = true;
        }

        private void UseFileSizeCheckBox_Unchecked(object sender, RoutedEventArgs e)
        {
            MinSizeTextBox.IsEnabled = false;
            MaxSizeTextBox.IsEnabled = false;
        }

        private void UseCreationDateCheckBox_Checked(object sender, RoutedEventArgs e)
        {
            CreationDatePicker.IsEnabled = true;
        }

        private void UseCreationDateCheckBox_Unchecked(object sender, RoutedEventArgs e)
        {
            CreationDatePicker.IsEnabled = false;
        }

        private bool FilterByDate(string filepath)
        {
            if(!UseCreationDateCheckBox.IsChecked.Value) 
                return true;
            if(CreationDatePicker.SelectedDate == null)
                return false;
            try
            {
                DateTime fileCreationTime = File.GetCreationTime(filepath);
                return fileCreationTime.Date >= CreationDatePicker.SelectedDate.Value.Date;
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show($"Ошибка при проверке даты создания файла: {ex.InnerException.Message}");
                return false;
            }
        }

        private bool FilterBySize(string filepath)
        {
            if(!UseFileSizeCheckBox.IsChecked.Value) 
                return true;

            if(!int.TryParse(MinSizeTextBox.Text, out int minSize) || !int.TryParse(MaxSizeTextBox.Text, out int maxSize)) 
                return false;

            try
            {
                long fileSizeKB = new FileInfo(filepath).Length / 1024;
                return fileSizeKB >= minSize && fileSizeKB <= maxSize;
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show($"Ошибка при проверке даты создания файла: {ex.InnerException.Message}");
                return false;
            }
        }
    }
}