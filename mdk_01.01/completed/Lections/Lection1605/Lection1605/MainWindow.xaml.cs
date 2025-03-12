using System.Media;
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

using System.Speech;
using System.Speech.Recognition;
using System.Speech.Synthesis;

namespace Lection1605
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

        private void TestSoundPlayer_Click(object sender, RoutedEventArgs e)
        {
            SoundPlayer player = new SoundPlayer();
            player.SoundLocation = "forest.wav";
            player.Load();
            player.PlayLooping(); //зациклили
        }

        private void TestSystemSoundPlayer_Click(object sender, RoutedEventArgs e)
        {
            SystemSounds.Asterisk.Play();
        }

        private void TestMediaPlayer_Click(object sender, RoutedEventArgs e)
        {
            MediaPlayer player = new();
            player.SpeedRatio = 0.1;
            player.Open(new Uri("sounds\\child.mp3", UriKind.Relative));
            player.Play();
        }

        private void PauseMediaPlayer_Click(object sender, RoutedEventArgs e)
        {
            myMediaElement.Pause();
        }
    }
}