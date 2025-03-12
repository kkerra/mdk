namespace Lection0319
{
    public partial class GamesForm : Form
    {
        List<Game> Games => new List<Game>
        {
            new Game{IdGame = 1, Name = "Tetris", Category = "�����������", Price = 150},
            new Game{IdGame = 2, Name = "Flappy Bird", Description = "���� ��� ������� �����", Category = "����������", Price = 10},
            new Game{IdGame = 3, Name = "Pac-man", Description = "���� ��� �������", Category = "������", Price = 300},
            new Game{IdGame = 4, Name = "Arkanoid", Category = "������", Price = 400},
            new Game{IdGame = 5, Name = "Mario", Description = "���� ��� �����", Category = "����������", Price = 1000},
            new Game{IdGame = 6, Name = "Tetris2", Category = "�����������", Price = 150},
            new Game{IdGame = 7, Name = "Flappy Bird2", Description = "���� ��� ������� �����", Category = "����������", Price = 10},
            new Game{IdGame = 8, Name = "Pac-man2", Description = "���� ��� �������", Category = "������", Price = 300},
            new Game{IdGame = 9, Name = "Arkanoid2", Category = "������", Price = 400},
            new Game{IdGame = 10, Name = "Mario2", Description = "���� ��� �����", Category = "����������", Price = 1000},
        };

        List<Category> Categories => new List<Category>
        {
            new Category{Name = "�����������", Description = "�������� ����� �����������"},
            new Category{Name = "����������", Description = "�������� ����� ����������"},
            new Category{Name = "RPG", Description = "�������� ����� RPG"},
            new Category{Name = "������", Description = "�������� ����� ������"}
        };

        public GamesForm()
        {
            InitializeComponent();

            //gamesDataGridView.DataSource = Games
            //    .Where(game => game.Price < 500)
            //    .ToList();

            var games = Games.Select(game => new
            {
                game.Name,
                game.Price,
                SalePrice = game.Price * 0.9
            });

            gamesDataGridView.DataSource = games.ToList();

            //var games = Games
            //    .Where(game => game.Category == "������")
            //    .Where(game => game.Description != null);

            //var games = Games.AsEnumerable();
            ////���� ���� ������ if �� ���������
            //games.Where(game => game.Category == "������");
            ////���� ���� ������ if �� ��������
            //games.Where(game => game.Description != null);

            ////���������
            //int pageSize = 3;   // ���������� ��������� �����

            ////1 ������� ������ ������ ��������� ��������
            //int lastPageNumber = Games.Count / pageSize + (Games.Count % pageSize > 0 ? 1 : 0);
            ////2 ������� ������ ������ ��������� ��������
            //int maxPageNumber = (int)Math.Ceiling(1.0 * Games.Count / pageSize);


            //int pageNumber = 1; // ����� �������� � 1
            //var games = Games.Skip(pageSize * (pageNumber - 1)).Take(pageSize);

            //var games = Games.OrderBy(game => game.Category)
            //    .ThenBy(game => game.Price);

            //gamesDataGridView.DataSource = games.ToList();

            //var maxPrice = Games.Max(game => game.Price);
            //MessageBox.Show($"{maxPrice} ���");

            //string[] numbers = ["1", "2", "weurh", "sdfkj", "5"];
            //var result = numbers.Aggregate((s1, s2) => $"{s1}; {s2}");
            //MessageBox.Show(result );

            //var games = Games.GroupBy(game => game.Category)
            //    .Select(group => new
            //    {
            //        Category = group.Key,
            //        MaxPrice = group.Max(g => g.Price),
            //        MinPrice = group.Min(g => g.Price),
            //        GamesCount = group.Count()
            //    });

            //gamesDataGridView.DataSource = games.ToList();

            //bool checkPrice = Games.All(game => game.Price > 0);
            //MessageBox.Show(checkPrice.ToString());

            //var password = "12qwwA!";
            //bool hasDigit = password.Any(symbol => Char.IsDigit(symbol));
            //bool hasPunctuation = password.Any(symbol => Char.IsPunctuation(symbol));
            //bool hasLower = password.Any(symbol => Char.IsLower(symbol));
            //bool hasUpper = password.Any(symbol => Char.IsUpper(symbol));

            //MessageBox.Show($"{password}\n" +
            //    $"{hasDigit} - �����\n" +
            //    $"{hasLower} - \n" +
            //    $"{password}\n");
        }
    }
}
