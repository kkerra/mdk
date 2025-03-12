using System.IO;
using Task2.Data;
using Task2.Models;

namespace Task2.Services
{
    public class ScreenshotsService
    {
        private AppDbContext _context;

        public ScreenshotsService()
        {
            _context = new AppDbContext();
        }

        public void AddScreenshot(string filePath, int gameId)
        {
            if (!File.Exists(filePath))
            {
                throw new FileNotFoundException();
            }
            byte[] fileBytes = File.ReadAllBytes(filePath);
            if (fileBytes.Length > 10 * 1024 * 1024)
            {
                throw new Exception("Размер файла не должен превышать 10 МБ");
            }
            Screenshot screenshot = new()
            {
                GameId = gameId,
                FileName = Path.GetFileName(filePath),
                Photo = fileBytes
            };

            _context.Lw21screenshots.Add(screenshot);
            _context.SaveChanges();
        }
    }
}
