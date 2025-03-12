using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace _1105
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

        private void Window_MouseMove(object sender, MouseEventArgs e)
        {
            Point point = e.GetPosition(this);
            positionLabel.Content = $"{point.X}; {point.Y}";
        }

        private void Element_MouseMove(object sender, MouseEventArgs e)
        {
            var element = (UIElement)sender;
            Point point = e.GetPosition(element);
            positionLabel.Content = $"{point.X}; {point.Y}";
        }

        private void Window_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }
        Point? dragStart = null;
        private void Canvas_MouseMove(object sender, MouseEventArgs e)
        {
            if (dragStart == null)
                return;

            var element = (UIElement)(e.Source);
            var dragFinish = e.GetPosition(canvas);
            Canvas.SetLeft(element, dragFinish.X - element.RenderSize.Width /2);
            Canvas.SetTop(element, dragFinish.Y - element.RenderSize.Height / 2);
        }

        private void Canvas_MouseDown(object sender, MouseButtonEventArgs e)
        {
            var element = (UIElement)(e.Source);
            dragStart = e.GetPosition(element);
            element.CaptureMouse();
        }

        private void Canvas_MouseUp(object sender, MouseButtonEventArgs e)
        {
            var element = (UIElement)(e.Source);
            dragStart = null;
            element.ReleaseMouseCapture();
        }
    }
}