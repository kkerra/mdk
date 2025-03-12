using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Threading;

namespace Task3
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DispatcherTimer timer = new(DispatcherPriority.Render);
        Point point = new(3, 3);

        public MainWindow()
        {
            InitializeComponent();

            timer.Interval = TimeSpan.FromMilliseconds(30);
            timer.Tick += Timer_Tick;
            timer.Start();
        }

        private void Timer_Tick(object? sender, EventArgs e)
        {
            Canvas.SetLeft(ballEllipse, Canvas.GetLeft(ballEllipse) + point.X);
            Canvas.SetTop(ballEllipse, Canvas.GetTop(ballEllipse) + point.Y);

            if (Canvas.GetLeft(ballEllipse) <= 0 || 
                Canvas.GetLeft(ballEllipse) >= gameCanvas.ActualWidth - ballEllipse.Height)
                point.X = -point.X;

            if (Canvas.GetTop(ballEllipse) < 0 || 
                Canvas.GetTop(ballEllipse) >= Canvas.GetTop(racketRectangle) + ballEllipse.Height
                )
                point.Y = -point.Y;

            if(Canvas.GetTop(ballEllipse) >= gameCanvas.ActualHeight - ballEllipse.Height)
            {
                timer.Stop();
                MessageBox.Show("Конец");
                point = new(0, 0);
            }
        }

        private void Window_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Left && Canvas.GetLeft(racketRectangle) > 0)
                Canvas.SetLeft(racketRectangle, Canvas.GetLeft(racketRectangle) - 10);

            if (e.Key == Key.Right && 
                Canvas.GetLeft(racketRectangle) < gameCanvas.ActualWidth - racketRectangle.Width)
                Canvas.SetLeft(racketRectangle, Canvas.GetLeft(racketRectangle) + 10);
        }
    }
}