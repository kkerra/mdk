using Microsoft.Win32;
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
        public MainWindow()
        {
            InitializeComponent();
        }

        private void OpenButton_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog dialog = new();
            dialog.Filter = "Media | *.mp3;*.wav;*.mp4";
            if (dialog.ShowDialog() != true)
                return;
            mediaElement.Source = new Uri(dialog.FileName);
            mediaElement.Play();
        }

        private void PlayButton_Click(object sender, RoutedEventArgs e)
        {
            mediaElement.Play();   
        }

        private void PauseButton_Click(object sender, RoutedEventArgs e)
        {
            mediaElement.Pause();
        }

        private void StopButton_Click(object sender, RoutedEventArgs e)
        {
            mediaElement.Stop();
        }

        private void MediaElement_MediaOpened(object sender, RoutedEventArgs e)
        {
            TimeSpan totalTime = new();
            TimeSpan currentTime = new();

            //currentTimeTextBlock.Text = currentTime.ToString(@"hh\:mm\:ss");
            //totalTimeTextBlock.Text = totalTime.ToString(@"hh\:mm\:ss");
        }
    }
}