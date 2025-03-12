using Microsoft.Data.SqlClient;

namespace DBLibrary
{
    public static class DAL
    {
        public static string ConnectionString 
        {
            get
            {
                SqlConnectionStringBuilder builder = new()
                {
                    DataSource = @"PRSERVER\SQLEXPRESS",
                    InitialCatalog = "ispp3503",
                    UserID = "ispp3503",
                    Password = "3503",
                    TrustServerCertificate = true
                };
                return builder.ConnectionString;
            }
        }

        public static async Task UpdatePriceAsync(int newPrice, int gameId)
        {
            using SqlConnection connection = new(ConnectionString);
            await connection.OpenAsync();

            string query = "UPDATE Game SET Price=@price WHERE GameId=@id";
            SqlCommand command = new(query, connection);
            command.Parameters.AddWithValue("@id", gameId);
            command.Parameters.AddWithValue("@price", newPrice);

            await command.ExecuteNonQueryAsync(); //dml
        }

        public static async Task<string?> GetTitleByIdAsync(int gameId)
        {
            using SqlConnection connection = new(ConnectionString);
            await connection.OpenAsync();

            string query = "SELECT Name FROM Game WHERE GameId=@id";
            SqlCommand command = new(query, connection);
            command.Parameters.AddWithValue("@id", gameId);

            var title = await command.ExecuteScalarAsync(); //select scalar
            return (string?)title;
        }

        public static async Task<List<string>> GetTitlesAsync()
        {
            using SqlConnection connection = new(ConnectionString);
            await connection.OpenAsync();

            string query = "SELECT Name FROM Game";
            SqlCommand command = new(query, connection);

            var reader = await command.ExecuteReaderAsync(); //select lines
            List<string> titles = new();
            while (await reader.ReadAsync())
            {
                titles.Add(reader["Name"].ToString());
            }
            return titles;
        }

        public static async Task<List<Game>> GetGamesAsync()
        {
            using SqlConnection connection = new(ConnectionString);
            await connection.OpenAsync();

            string query = "SELECT * FROM Game";
            SqlCommand command = new(query, connection);

            var reader = await command.ExecuteReaderAsync(); //select games
            List<Game> games = new();
            while (await reader.ReadAsync())
            {
                if (reader["Name"] != DBNull.Value)
                { }
                games.Add(new Game
                {
                    Id = Convert.ToInt32(reader["GameId"]),
                    Name = reader["Name"].ToString(),
                    Price = Convert.ToDouble(reader["Price"])
                });

            }
            return games;
        }
    }
}
