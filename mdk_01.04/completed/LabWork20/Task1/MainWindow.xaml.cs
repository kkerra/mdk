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

namespace Task1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DispatcherTimer timer;
        private Point? _previousMousePosition;

        public MainWindow()
        {
            InitializeComponent();
            timer = new();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += Timer_Tick;
            timer.Start();
        }

        private void Timer_Tick(object? sender, EventArgs e)
        {
            timeLabel.Content = DateTime.Now.ToString("HH:mm:ss");
        }

        private void Window_MouseMove(object sender, MouseEventArgs e)
        {
            Point currentMousePosition = e.GetPosition(this);
            if(_previousMousePosition != null && _previousMousePosition != currentMousePosition)
            {
                Close();
            }
            _previousMousePosition = currentMousePosition;
        }
    }
}