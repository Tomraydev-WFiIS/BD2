using System;
using System.Data.SqlClient;
namespace Lab06.Examples
{
    class Example_Lab06_1
    {
        static void Main(string[] args)
        {
            string sqlconnection = @"DATA SOURCE=MSSQLServer;" +
            "INITIAL CATALOG=Lab6db; INTEGRATED SECURITY=SSPI;";
            SqlConnection connection = new SqlConnection(sqlconnection);
            try
            {
                connection.Open();
                // zad3 c)
                string lecturer_query = @"
                SELECT w.fname, w.lname, COUNT(s.id) AS n_students FROM grupa g
	                JOIN student s ON s.id=g.id_stud
	                JOIN wykladowca w ON w.id=g.id_wykl
	                GROUP BY w.fname, w.lname
                ";
                SqlCommand command = new SqlCommand(lecturer_query, connection);
                SqlDataReader datareader = command.ExecuteReader();
                while (datareader.Read())
                {
                    Console.WriteLine("{0}\t{1}\t{2}",
                    datareader["fname"].ToString(),
                    datareader["lname"].ToString(),
                    datareader["n_students"].ToString());
                }
                datareader.Close();
                Console.WriteLine("\n");

                string course_query = @"
                SELECT p.name, COUNT(s.id) AS n_students FROM grupa g
	                JOIN student s ON s.id=g.id_stud
	                JOIN przedmiot p ON p.id=g.id_przed
	                GROUP BY p.name
                ";
                command = new SqlCommand(course_query, connection);
                datareader = command.ExecuteReader();
                while (datareader.Read())
                {
                    Console.WriteLine("{0}\t{1}\t",
                    datareader["name"].ToString(),
                    datareader["n_students"].ToString());
                }
            }
            catch (SqlException ex)
            { Console.WriteLine(ex.Message); }
            finally
            { connection.Close(); }
            Console.Write("Press a Key to Continue...");
            Console.ReadKey();
        }
    }
}