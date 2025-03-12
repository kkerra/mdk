using Microsoft.Data.SqlClient;
using System.Data;

namespace Task1
{
    public static class DataAccessLayer
    {
        public static string ServerName { get; } = @"prserver\SQLEXPRESS";
        public static string Login { get; } = "ispp3503";
        public static string Password { get; } = "3503";
        public static string Database { get; } = "ispp3503";

        public static string ConnectionString
        {
            get
            {
                SqlConnectionStringBuilder builder = new()
                {
                    DataSource = ServerName,
                    UserID = Login,
                    Password = Password,
                    TrustServerCertificate = true,
                    InitialCatalog = Database
                };
                return builder.ConnectionString;
            }
        }

        public static object GetValue(string query)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            SqlCommand command = new(query, connection);
            return command.ExecuteScalar();
        }

        public static DataTable GetValues(string query)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            using SqlDataAdapter adapter = new(query, connection);
            DataTable table = new();
            adapter.Fill(table);
            return table;
        }

        public static List<Book> GetBooks()
        {
            string query = "SELECT bookId, title, price FROM Book";
            List<Book> books = [];
            using SqlConnection connection = new(ConnectionString);
            connection.Open();
            SqlCommand command = new(query, connection);
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                var book = new Book
                {
                    Id = Convert.ToInt32(reader["bookId"]),
                    Title = reader["title"].ToString(),
                    Price = Convert.ToDouble(reader["price"])
                };
                books.Add(book);
            }
            return books;
        }
    }
}
