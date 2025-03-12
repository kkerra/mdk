using System.Windows;
using System.Windows.Controls;

namespace Task3
{
    /// <summary>
    /// Логика взаимодействия для Counter.xaml
    /// </summary>
    public partial class Counter : UserControl
    {
        public event RoutedEventHandler ValueChanged;

        private int MaxValue = 5;

        public int Value
        {
            get { return (int)GetValue(ValueProperty); }
            set
            {
                SetValue(ValueProperty, value);
                UpdateValue();
            }
        } 

        // Using a DependencyProperty as the backing store for Value.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ValueProperty =
            DependencyProperty.Register("Value", typeof(int), typeof(Counter), new PropertyMetadata(0));

        public Counter()
        {
            InitializeComponent();

            Value = 1;
            DataContext = this;
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            Value++;
            ValueChanged?.Invoke(this, e);
        }

        private void DecreaseButton_Click(object sender, RoutedEventArgs e)
        {
            Value--;
            ValueChanged?.Invoke(this, e);
        }

        private void UpdateValue()
        {
            addButton.IsEnabled = true;
            decreaseButton.IsEnabled = true;
            if (Value == 0)
                decreaseButton.IsEnabled = false;
            if (Value == MaxValue)
                addButton.IsEnabled = false;
        }
    }
}
