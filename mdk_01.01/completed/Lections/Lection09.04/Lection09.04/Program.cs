using Word = Microsoft.Office.Interop.Word;
using Excel = Microsoft.Office.Interop.Excel;
using System.Runtime.InteropServices;
using System.Diagnostics;

//var wordApp = new Word.Application();
//wordApp.Visible = true;

//string tempelate = Path.Combine(Environment.CurrentDirectory, "Шаблоны", "отчет.docx");
//var document = wordApp.Documents.Add(tempelate);
//string filename = Path.Combine(Environment.CurrentDirectory, "Файл", "1.pdf");
//document.SaveAs(filename, Word.WdSaveFormat.wdFormatPDF);

//document.Close(false);
//wordApp.Quit();

var app = new Excel.Application();
app.Visible = true;

app.SheetsInNewWorkbook = 10;
var workbook = app.Workbooks.Add();

workbook.Worksheets.Add();
workbook.Worksheets.Add(After: workbook.Worksheets[3], Count: 2);

var worksheet = workbook.Worksheets[1];
worksheet.Name = "1234";

Excel.Range range = worksheet.range[
    worksheet.Cells[2][5], worksheet.Cells[8][10]
    ];
//range.Merge();

worksheet.Cells[1, 2] = 123;
range.Value = 0;

worksheet.Cells[1, 2].Formula = "=2+3";
range.Formula = "=SIN(1)";

int columnNumber = 5;
int codeA = (int)'A';
char columnName = (char)(codeA + columnNumber - 1); //получение по номеру столбца буквы

range = worksheet.Cells[8, 1];
range.EntireRow.Insert();

worksheet.Columns.Autofit();
worksheet.Rows.Autofit();

//worksheet.Range["2:5"].Delete();
//worksheet.Range["C:F"].Delete();