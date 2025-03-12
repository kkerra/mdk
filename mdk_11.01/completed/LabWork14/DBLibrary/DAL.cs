using Microsoft.Data.SqlClient;

namespace DBLibrary
{
    public class DAL
    {
        private static string _server = @"PRSERVER\SQLEXPRESS";
        private static string _database = "ispp3503";
        private static string _username = "ispp3503";
        private static string _password = "3503";

        public static string ConnectionString
        {
            get
            {
                SqlConnectionStringBuilder builder = new()
                {
                    DataSource = _server,
                    InitialCatalog = _database,
                    UserID = _username,
                    Password = _password,
                    TrustServerCertificate = true
                };
                return builder.ConnectionString;
            }
        }

        public static void ChangeConnectionSettings(string server, string database, string username, string password)
        {
            _server = server;
            _database = database;
            _username = username;
            _password = password;
        }

        public static bool IsConnected()
        {
            using SqlConnection connection = new(ConnectionString);
            try
            {
                connection.Open();
                return true;
            }
            catch
            {
                Console.WriteLine($"Ошибка подключения");
                return false;
            }
        }

        public static async Task<int> ExecuteCommandAsync(string query)
        {
            using SqlConnection connection = new(ConnectionString);
            await connection.OpenAsync();
            SqlCommand command = new(query, connection);

            return await command.ExecuteNonQueryAsync();
        }

        public static async Task<object?> ExecuteScalarAsync(string query)
        {
            using SqlConnection connection = new(ConnectionString);
            await connection.OpenAsync();
            SqlCommand command = new(query, connection);

            return await command.ExecuteScalarAsync();
        }

        public static async Task UpdatePriceAsync(int gameId, int newPrice)
        {
            using SqlConnection connection = new(ConnectionString);
            await connection.OpenAsync();
            string query = "UPDATE Game SET Price=@price WHERE GameId=@id";
            SqlCommand command = new(query, connection);
            command.Parameters.AddWithValue("@id", gameId);
            command.Parameters.AddWithValue("@price", newPrice);

            await command.ExecuteNonQueryAsync();
        }

        public static async Task UploadPhotoAsync(string title, string path)
        {
            using SqlConnection connection = new(ConnectionString);
            await connection.OpenAsync();
            string query = "UPDATE Movie SET Poster=@path WHERE Title=@title";
            SqlCommand command = new(query, connection);
            byte[] photoData = File.ReadAllBytes(path);
            command.Parameters.AddWithValue("@title", title);
            command.Parameters.AddWithValue("@path", path);

            await command.ExecuteNonQueryAsync();
        }
    }
}
