using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    internal class DataAccessLayer
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

        public static bool InsertAuthor(string surname, string name, string country)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            string query = "InsertAuthor @surname, @name, @country";
            SqlCommand command = new(query, connection);
            command.Parameters.AddWithValue("@surname", surname);
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@country", country);
            return command.ExecuteNonQuery() > 0;
        }

        public static int GetId(string surname, string name, string country)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            string query = "GetNewAuthorId @surname, @name, @country";
            SqlCommand command = new(query, connection);
            command.Parameters.AddWithValue("@surname", surname);
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@country", country);
            return Convert.ToInt32(command.ExecuteScalar());
        }

        public static DataTable GetBooks(double startPrice, double endPrice)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            string query = "GetBooks @startPrice, @endPrice";            
            SqlDataAdapter adapter = new(query, connection);
            adapter.SelectCommand.Parameters.AddWithValue("@startPrice", startPrice);
            adapter.SelectCommand.Parameters.AddWithValue("@endPrice", endPrice);
            DataTable table = new();
            adapter.Fill(table);
            return table;
        }
    }
}
