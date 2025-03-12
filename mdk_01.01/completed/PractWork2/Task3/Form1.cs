using Excel = Microsoft.Office.Interop.Excel;
namespace Task3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void MultiplicationButton_Click(object sender, EventArgs e)
        {
            var app = new Excel.Application();
            app.Visible = true;
            var workbook = app.Workbooks.Add();
            var worksheet = workbook.Worksheets[1];
            worksheet.Name = "Умножение";

            Excel.Range header = worksheet.Range["D9", "L9"];
            header.Merge();
            header.Font.Bold = true;
            header.Font.Italic = true;
            header.Font.Size = 20;
            header.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
            header.Value = "Таблица умножения";

            Excel.Range multiplication = worksheet.Range["D10", "L18"];
            multiplication.Borders[Excel.XlBordersIndex.xlEdgeBottom].LineStyle = Excel.XlLineStyle.xlDashDotDot;
            multiplication.Borders[Excel.XlBordersIndex.xlEdgeRight].LineStyle = Excel.XlLineStyle.xlDashDotDot;
            multiplication.Rows["1"].Interior.Color = ColorTranslator.ToOle(Color.Aqua);
            multiplication.Rows["1"].Borders.LineStyle = Excel.XlLineStyle.xlSlantDashDot;
            multiplication.Columns["A"].Interior.Color = ColorTranslator.ToOle(Color.Aqua);
            multiplication.Columns["A"].Borders.LineStyle = Excel.XlLineStyle.xlSlantDashDot;

            for (int i = 1; i <= multiplication.Rows.Count; i++)
            {
                for (int j = 1; j <= multiplication.Columns.Count; j++)
                {
                    multiplication.Cells[i, j] = i * j;
                    multiplication.Font.Size = 15;
                }
            }            
        }
    }
}
