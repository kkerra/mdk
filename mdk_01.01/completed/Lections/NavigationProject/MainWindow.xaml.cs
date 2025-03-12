using NavigationProject.Pages;
using System.Configuration;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Resources;

namespace NavigationProject
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            App.CurrentFrame = MainFrame;
            App.CurrentFrame.Navigate(new MenuPage());

            var cursorUri = new Uri("working.ani", UriKind.Relative);
            StreamResourceInfo resourceInfo = Application.GetResourceStream(cursorUri);
            Cursor = new(resourceInfo.Stream);

            var imagePath = new Uri(@"pack://application:,,,/Images/galaxy.jpg");
            var bitmapImage = new BitmapImage(imagePath);
            image1.Source = bitmapImage;
            //ellipse.Fill = new ImageBrush(bitmapImage);

            SolidColorBrush brush = new(Colors.CadetBlue);
            ellipse.Fill = brush;

            var imagePath2 = new Uri(@"X:\МДК.01.01\Images\background.jpg");
            var bitmapImage2 = new BitmapImage(imagePath2);
            image2.Source = bitmapImage2;

            var imagePath3 = new Uri(@"\Resources\zombie.png", UriKind.RelativeOrAbsolute);
            var bitmapImage3 = new BitmapImage(imagePath3);
            image3.Source = bitmapImage3;

            Properties.Settings.Default.Login = "aksldjlask";
            Properties.Settings.Default.Save();

            MessageBox.Show(Properties.Settings.Default.Login);

            MessageBox.Show(ConfigurationManager.AppSettings.Get("password"));
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.GoBack();
        }

        private void MainFrame_ContentRendered(object sender, EventArgs e)
        {
            //BackButton.IsEnabled = MainFrame.CanGoBack;

            if(MainFrame.CanGoBack)
                BackButton.Visibility = Visibility.Visible;
            else
                BackButton.Visibility = Visibility.Hidden;
        }

        private void LightButton_Click(object sender, RoutedEventArgs e)
        {
            ChangeTheme("Light");
        }

        private void DarkButton_Click(object sender, RoutedEventArgs e)
        {
            ChangeTheme("Dark");
        }

        void ChangeTheme(string themeName)
        {
            Application.Current.Resources.Clear();

            Uri uriDict = new($"Themes/Common.xaml", UriKind.Relative);
            ResourceDictionary dictionary = Application.LoadComponent(uriDict) as ResourceDictionary;
            Application.Current.Resources.MergedDictionaries.Add(dictionary);

            uriDict = new($"Themes/{themeName}.xaml", UriKind.Relative);
            dictionary = Application.LoadComponent(uriDict) as ResourceDictionary;
            Application.Current.Resources.MergedDictionaries.Add(dictionary);
        }
    }
}