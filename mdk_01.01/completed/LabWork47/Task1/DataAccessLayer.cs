using Microsoft.Data.SqlClient;
using System.Data;
using System.Windows;

namespace Task1
{
    public class DataAccessLayer
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

        public static int GetAmountBook(int price)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            string query = "SELECT COUNT(*) FROM Book WHERE price < @price";
            SqlCommand command = new(query, connection);
            command.Parameters.AddWithValue("@price", price);
            return Convert.ToInt32(command.ExecuteScalar());
        }

        public static void GetId(string query)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            SqlCommand command = new($"{query};SET @id=SCOPE_IDENTITY()", connection);

            command.Parameters.Add("@id", SqlDbType.Int);
            command.Parameters["@id"].Direction = ParameterDirection.Output;
            command.ExecuteNonQuery();

            MessageBox.Show($"id:{command.Parameters["@id"].Value}");
        }

        public static DataTable GetBooks(double price, string genre)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            string query = "SELECT * FROM Book WHERE genre = @genre AND price < @price";
            SqlCommand command = new(query, connection);
            command.Parameters.Add("@price", SqlDbType.Decimal);
            command.Parameters.Add("@genre", SqlDbType.NVarChar, 10);
            command.Parameters["@price"].Value = price;
            command.Parameters["@genre"].Value = genre;

            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new();
            table.Load(reader);

            return table;
        }

        public static bool UpdateBook(int id, double price, string title)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            string query = "UPDATE Book SET price = @price, title = @title WHERE bookId = @id";
            SqlCommand command = new(query, connection);
            command.Parameters.AddWithValue("@id", id);
            command.Parameters.AddWithValue("@price", price);
            command.Parameters.AddWithValue("@title", title);

            return command.ExecuteNonQuery() > 0;
        }
    }
}
