using Microsoft.Data.SqlClient;
using System.Data;

namespace Lection2005
{
    public static class DataAccessLayer
    {
        public static string GetConnectionString()
        {
            SqlConnectionStringBuilder builder = new()
            {
                DataSource = @"prserver\SQLEXPRESS",  //сервер
                UserID = "ispp3503",                  //пользователь
                Password = "3503",                    //пароль
                TrustServerCertificate = true,        //доверять сертификату
                InitialCatalog = "ispp3503"           //БД
            };
            return builder.ConnectionString;
        }

        public static void TestConnection()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();
            connection.Close();
        }

        public static int ChangePrice()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();
            string query = "UPDATE Book SET price = price + 1";
            SqlCommand command = new(query, connection);
            int changedRows = command.ExecuteNonQuery();
            return changedRows; //вернули количество измененных строк
        }

        public static double GetMaxPrice()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = "SELECT MAX(price) FROM Games";
            SqlCommand command = new(query, connection);
            var result = command.ExecuteScalar(); //вернули количество измененных строк
            return Convert.ToDouble(result);
        }

        public static void GetGames()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = "SELECT * FROM Games";
            SqlCommand command = new(query, connection);
            SqlDataReader reader = command.ExecuteReader(); //чтение

            //имена столбцов
            string columnNames = "";
            for (int i = 0; i < reader.FieldCount; i++)
            {
                columnNames += $"{reader.GetName(i)}";
            }
            Console.WriteLine(columnNames);

            //заполнение массива(одна стркоа)
            object[] rowCells = new object[reader.FieldCount];
            if (reader.Read())
            {
                reader.GetValues(rowCells);
                foreach (object cell in rowCells)
                    Console.WriteLine(cell);
            }

            //заполнение списка пользовательского типа Game
            List<Game> games = new();
            while (reader.Read())
            {
                var game = new Game
                {
                    Name = reader["name"].ToString(),
                    Price = Convert.ToDouble(reader["price"])
                };
                games.Add(game);
            }

            //null-значение
            if (reader["description"] != DBNull.Value) { }

            //есть строки
            if (reader.HasRows) { }
        }

        public static DataTable ChangeGames2()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = "SELECT * FROM Games";
            

            DataTable table = new();
            using SqlDataAdapter adapter = new(query, connection);
            SqlCommandBuilder builder = new(adapter);
            adapter.Update(table);
            return table;

            //для wpf
            // grid.ItemSource = table.DefaultView;
        }

        public static void EditGames(ref DataTable table)
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = "SELECT * FROM Games";
             SqlDataAdapter adapter = new(query, connection);

            SqlCommandBuilder builder = new(adapter);
            adapter.Update(table);

            table.Clear();
            adapter.Fill(table);
        }

        public static void TestCommandParameters()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = "SELECT * FROM Games WHERE price > @price AND category = @category";
            SqlCommand command = new(query, connection);

            command.Parameters.AddWithValue("@price", 500);
            command.Parameters.AddWithValue("@category", "RPG");


            command.Parameters.Add("@category", SqlDbType.NVarChar, 50);
            command.Parameters["@category"].Value = "RPG";
            command.Parameters["@category"].Direction = ParameterDirection.Output;


            SqlParameter priceParameter = new("@category", SqlDbType.NVarChar, 50);
            priceParameter.Value = "RPG";
            command.Parameters.Add(priceParameter);
        }

        public static void TestCommandParameters3()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = "SET @x = 2+3; SELECT @x;";
            SqlCommand command = new(query, connection);

            command.Parameters.Add("@x", SqlDbType.Int);
            command.Parameters["@x"].Direction= ParameterDirection.Output;

            command.ExecuteNonQuery();

            int result = Convert.ToInt32(command.Parameters["@x"].Value);
        }

        public static void TestCommandParameters2()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = @"INSERT INTO Author(surname,name, country)
                            VALUES('ASD','SADSA','ASD');
                            SELECT @id=SCOPE_IDENTITY()";
            SqlCommand command = new(query, connection);

            command.Parameters.Add("@id", SqlDbType.Int);
            command.Parameters["@id"].Direction = ParameterDirection.Output;

            command.ExecuteNonQuery();

            var result = Convert.ToInt32(command.Parameters["@id"].Value);
        }

        public static void TestCommandParameters4()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = "SET @maxPrice = MAX(price); SELECT @x;";
            SqlCommand command = new(query, connection);

            command.Parameters.Add("@maxPrice", SqlDbType.Int);
            command.Parameters["@maxPrice"].Direction = ParameterDirection.Output;

            command.ExecuteNonQuery();

            var result = Convert.ToDouble(command.Parameters["@maxPrice"].Value);
        }

        public static void CreateUser()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = "sys.sp_adduser 'ispp3515', 'teacher'";
            SqlCommand command = new(query, connection);
            command.ExecuteNonQuery();
        }

        public static void DropUser()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = "sys.sp_dropuser @userName";
            SqlCommand command = new(query, connection);
            command.Parameters.AddWithValue("@userName", "teacher");
            command.ExecuteNonQuery();
        }

        public static void DropUser2()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = "sys.sp_dropuser";
            SqlCommand command = new(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@name_in_db", "teacher");
            command.ExecuteNonQuery();
        }

        public static object Sum()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = "Proc1 @x, @y"; //вернет сумму
            SqlCommand command = new(query, connection);
            command.Parameters.AddWithValue("@x", 5);
            command.Parameters.AddWithValue("@y", 2);
            return command.ExecuteScalar();
        }

        public static int InsertGame()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = "Proc2 @name, @category, @price"; //вернет сумму
            SqlCommand command = new(query, connection);
            command.Parameters.AddWithValue("@name", "asd");
            command.Parameters.AddWithValue("@category", "survival");
            command.Parameters.AddWithValue("@price", 777);
            return command.ExecuteNonQuery();
        }

        public static DataTable GetRPGGames()
        {
            using SqlConnection connection = new(GetConnectionString());
            connection.Open();

            string query = "Proc3 @category"; //вернет сумму
            
            SqlDataAdapter adapter = new(query, connection);
            adapter.SelectCommand.Parameters.AddWithValue("@category", "RPG");
            DataTable table = new();
            adapter.Fill(table);
            return table;
        }
    }
}
