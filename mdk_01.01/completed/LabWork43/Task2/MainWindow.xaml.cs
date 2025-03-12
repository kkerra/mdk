using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace Task2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DispatcherTimer timer = new(DispatcherPriority.Render);
        DispatcherTimer timerMove = new(DispatcherPriority.Render);
        int score = 0;

        public MainWindow()
        {
            InitializeComponent();

            timer.Interval = TimeSpan.FromMilliseconds(500);
            timer.Start();
            timer.Tick += Timer_Tick;

            timerMove.Interval = TimeSpan.FromMilliseconds(50);
            timerMove.Start();
            timerMove.Tick += TimerMove_Tick;
        }

        private void TimerMove_Tick(object? sender, EventArgs e)
        {
            foreach (Shape item in gameCanvas.Children.OfType<Shape>())
            {
                double y = (double)item.GetValue(Canvas.TopProperty);
                Canvas.SetTop(item, y + 3);
                if (y >= 400)
                {
                    timer.Stop();
                    timerMove.Stop();
                    MessageBox.Show("End");
                    break;
                }
            }
        }

        private void Timer_Tick(object? sender, EventArgs e)
        {
            Ellipse enemy = new()
            {
                Width = 30,
                Height = 30,
                Fill = new SolidColorBrush(Colors.Purple),
            };
            gameCanvas.Children.Add(enemy);

            double x = new Random().NextDouble() * Width;
            Canvas.SetLeft(enemy, x);
            Canvas.SetTop(enemy, -enemy.Height / 2);

            enemy.MouseDown += Enemy_MouseDown;
        }

        private void Enemy_MouseDown(object sender, MouseButtonEventArgs e)
        {
            gameCanvas.Children.Remove(sender as UIElement);

            score++;
            scoreLabel.Content = score;
        }
    }
}