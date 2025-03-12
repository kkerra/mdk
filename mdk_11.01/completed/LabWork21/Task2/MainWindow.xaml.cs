using System.IO;
using System.Windows;
using System.Windows.Media.Imaging;
using Task2.Services;

namespace Task2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private ScreenshotsService _service = new();

        public MainWindow()
        {
            InitializeComponent();
            byte[] fileBytes = File.ReadAllBytes(@"C:\temp\ispp35\ТРиЗБД\games\logos\battlefield 4.png");
            image.Source = BitmapImage.Convert(.GetImageFromByteArray(fileBytes);
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                _service.AddScreenshot(FilepathTextBox.Text, Convert.ToInt32(GameTextBox.Text));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}