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

        public static int EditTableData(string query)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            SqlCommand command = new(query, connection);
            return command.ExecuteNonQuery();
        }

        public static bool UpdatePrice(int bookId, double price)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            string query = $"UPDATE Book SET price = {price} WHERE bookId = {bookId}";
            SqlCommand command = new(query, connection);
            return (command.ExecuteNonQuery() > 0);
        }

        public static DataTable GetDataTable(string tableName)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            string query = $"SELECT * FROM {tableName}";
            SqlDataAdapter adapter = new(query, connection);
            DataTable table = new();
            adapter.Fill(table);
            return table;
        }

        public static void EditTable(ref DataTable table, string tableName)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            string query = $"SELECT * FROM {tableName}";
            using SqlDataAdapter adapter = new(query, connection);

            SqlCommandBuilder builder = new(adapter);

            adapter.Update(table);
            table.Clear();
            adapter.Fill(table);
        }
    }
}
