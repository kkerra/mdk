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

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            label2.AllowDrop = true;

            ListBox1.Items.Add("RFSERFWSERS");
            ListBox1.Items.Add("dfs");
            ListBox1.Items.Add("ssdf");
            ListBox1.Items.Add("sdf");
            ListBox1.Items.Add("qw1p");
        }

        private void Label1_MouseDown(object sender, MouseButtonEventArgs e)
        {
            var element = sender as Label;
            DragDrop.DoDragDrop(element,element.Content, DragDropEffects.Copy);

        }

        private void Label2_Drop(object sender, DragEventArgs e)
        {
            var element = sender as Label;
            element.Content= e.Data.GetData(DataFormats.Text);
        }

        private void valueListBox_Drop(object sender, DragEventArgs e)
        {
            var element = sender as ListBox;
            element.Items.Add(e.Data.GetData(DataFormats.Text));
        }

        private void ListBox1_MouseDown(object sender, MouseButtonEventArgs e)
        {
            
        }

        private void ListBox2_Drop(object sender, DragEventArgs e)
        {
            ListBox2.Items.Add(e.Data.GetData(DataFormats.Text));
        }

        private void ListBox1_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selected = ListBox1.SelectedItem;
            DragDrop.DoDragDrop(ListBox1,selected, DragDropEffects.Copy);
        }
    }
}