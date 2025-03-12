namespace Task1
{
    public partial class Form1 : Form
    {
        DirectoryInfo directory = new(@"C:\temp\ispp35");

        public Form1()
        {
            InitializeComponent();
        }

        private void Task1Button_Click(object sender, EventArgs e)
        {
            FileInfo[] files = directory.GetFiles("*", SearchOption.AllDirectories);

            var fileDetails = files
                .Select(file => new
                {
                    file.Name,
                    file.DirectoryName,
                    file.Length,
                    file.CreationTime,
                })
                .OrderBy(file => file.Name)
                .ThenByDescending(file => file.CreationTime);
            filesDataGridView.DataSource = fileDetails.ToList();
        }

        private void Task2Button_Click(object sender, EventArgs e)
        {
            FileInfo[] files = directory.GetFiles("*", SearchOption.AllDirectories);

            var extensions = files
                .Select(file => new
                {
                    file.Extension
                })
                .Distinct();
            filesDataGridView.DataSource = extensions.ToList();
        }

        private void Task3Button_Click(object sender, EventArgs e)
        {
            FileInfo[] files = directory.GetFiles("*", SearchOption.AllDirectories);

            var extensionsCount = files
                .GroupBy(file => file.Extension)
                .Select(group => new
                {
                    Extension = group.Key,
                    Count = group.Count()
                });
            filesDataGridView.DataSource = extensionsCount.ToList();
        }

        private void Task4Button_Click(object sender, EventArgs e)
        {
            FileInfo[] files = directory.GetFiles("*", SearchOption.AllDirectories);

            var searchResult = files
                .Where(file => file.Name.Contains(searchTextBox.Text));
            filesDataGridView.DataSource = searchResult.ToList();
        }

        private void Task5Button_Click(object sender, EventArgs e)
        {
            DateTime currentDate = DateTime.Now.Date;
            FileInfo[] files = directory.GetFiles("*", SearchOption.AllDirectories);

            var lastFiles = files
                .Where(file => file.CreationTime.Date == currentDate)
                .OrderByDescending(file => file.CreationTime)
                .Take(5);
            filesDataGridView.DataSource = lastFiles.ToList();
        }

        private void Task6Button_Click(object sender, EventArgs e)
        {
            FileInfo[] files = directory.GetFiles("*", SearchOption.AllDirectories);

            var filesCount = files.Count();
            double totalSize = files.Sum(file => file.Length) / (1024 * 1024);
            MessageBox.Show($"Количество файлов: {filesCount}, общий размер: {totalSize} МБ");
        }

        private void Task8Button_Click(object sender, EventArgs e)
        {
            FileInfo[] files = directory.GetFiles("*", SearchOption.AllDirectories);

            var countResult = files
                .Count(file => file.Name.Contains(searchTextBox.Text));
            MessageBox.Show($"Количество файлов {countResult}");
        }
    }
}