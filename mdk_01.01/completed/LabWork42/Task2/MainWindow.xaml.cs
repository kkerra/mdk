using System.IO;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Threading;

namespace Task2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private string[] images;
        private DispatcherTimer timer;
        private int currentImage = 0;

        public MainWindow()
        {
            InitializeComponent();            
        }

        private void LoadButton_Click(object sender, RoutedEventArgs e)
        {
            images = Directory.GetFiles(folderPathTextBox.Text, "*.jpg");

            timer = new DispatcherTimer(DispatcherPriority.Render);
            timer.Interval = TimeSpan.FromSeconds(0.3);
            timer.Tick += Timer_Tick;          
            timer.Start();
        }

        private void Timer_Tick(object? sender, EventArgs e)
        {
            currentImage++;
        }
    }
}