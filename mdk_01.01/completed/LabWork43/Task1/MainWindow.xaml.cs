using System.Windows;
using System.Windows.Input;
using System.Windows.Threading;

namespace Task1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DispatcherTimer timer = new(DispatcherPriority.Render);
        int cookie = 0;
        int grandmom = 0;
        int exchange = 15;

        public MainWindow()
        {
            InitializeComponent();

            timer.Tick += Timer_Tick;
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Start();

            grandmomRectangle.IsEnabled = false;
            grandmomRectangle.Opacity = 0.5;
        }

        private void Timer_Tick(object? sender, EventArgs e)
        {
            ChangeCookieCount();
            EnableGrandmom();
        }

        private void ChangeCookieCount(int cookieCount = 1)
        {
            cookie += cookieCount;
            cookieLabel.Content = cookie;
        }

        private void EnableGrandmom()
        {
            grandmomRectangle.IsEnabled = cookie >= exchange;
            grandmomRectangle.Opacity = (cookie >= exchange) ? 1 : 0.5;
        }

        private void CookieEllipse_MouseDown(object sender, MouseButtonEventArgs e)
        {
            ChangeCookieCount();
        }

        private void GrandmomRectangle_MouseDown(object sender, MouseButtonEventArgs e)
        {
            ChangeCookieCount(-exchange);
            EnableGrandmom();

            grandmom++;
            grandmomLabel.Content = grandmom;
            timer.Interval = TimeSpan.FromMilliseconds(1000 / (grandmom + 1));
            timer.Start();
        }
    }
}