namespace Lection15._03
{
    public partial class TextEditorForm : Form
    {
        public TextEditorForm()
        {
            InitializeComponent();

            button1.Click += OpenButton_Click;
        }

        private void OpenButton_Click(object? sender, EventArgs e)
        {
            SearchForm form = new SearchForm();
            form.Action = FindText; //указание, какой метод вызывается
            form.ShowDialog();
        }

        private void FindText(string obj)
        {
            textBox1.Text = $"{obj} не найдена";
        }
    }
}
