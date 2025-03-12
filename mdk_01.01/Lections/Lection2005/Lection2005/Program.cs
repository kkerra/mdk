using Lection2005;
using System.Data;

Console.WriteLine("Hello, World!");

try
{
    //DataAccessLayer.TestConnection();
    //Console.WriteLine("connected");
    //DataAccessLayer.GetMaxPrice();
    //DataAccessLayer.ChangePrice();
    //DataAccessLayer.GetGames();
    //DataAccessLayer.CreateUser();
    //DataAccessLayer.DropUser();
    //DataAccessLayer.DropUser2();
    //Console.WriteLine( DataAccessLayer.Sum());
    //Console.WriteLine( DataAccessLayer.InsertGame());
    DataTable games = DataAccessLayer.GetRPGGames();
    for (int i = 0; i < games.Rows.Count; i++)
    {
        Console.WriteLine(games.Rows[i][1]);
    }
    DataAccessLayer.InsertGame();
}
catch(Exception ex)
{
    Console.WriteLine("error");
}