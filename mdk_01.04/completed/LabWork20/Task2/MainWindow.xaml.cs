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
using System.Windows.Threading;

namespace Task2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DispatcherTimer timer = new();
        private string _imagesFolder = "C:\\Temp\\ispp35\\СП\\images";
        string[] _imageFiles;
        int _currentIndex = 0;

        public MainWindow()
        {
            InitializeComponent();
            timer.Interval = TimeSpan.FromSeconds(10);
            timer.Tick += Timer_Tick;
            timer.Start();
            LoadImages();
        }

        private void LoadImages()
        {
            _imageFiles = Directory.GetFiles(_imagesFolder);
            DisplayImage();
        }

        private void DisplayImage()
        {
            BitmapImage bitmapImage = new BitmapImage(new Uri(_imageFiles[_currentIndex]));
            image.Source = bitmapImage;
        }

        private void Timer_Tick(object? sender, EventArgs e)
        {
            _currentIndex = (_currentIndex + 1) % _imageFiles.Length;
            DisplayImage();
        }
    }
}