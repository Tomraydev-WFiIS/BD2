using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Transactions;


public partial class StoredProcedures
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void SimpleTransactionScope()
    {
        //tworzymy obiekt klasy TransactionScope
        TransactionScope oTran = new TransactionScope();
        using (SqlConnection oConn = new SqlConnection ("context connection=true;"))
        {
            try
            {
                //otwieramy connection
                oConn.Open();
                //pierwszy krok transakcji
                SqlCommand oCmd =
                new SqlCommand("INSERT actor VALUES (1, 'Brad', 'Pitt')", oConn);
                oCmd.ExecuteNonQuery();
                //drugi krok transakcji
                oCmd.CommandText = "INSERT INTO movie VALUES (1, 'Once Upon a Time in Hollywood')";
                oCmd.ExecuteNonQuery();
                //trzeci krok transakcji
                oCmd.CommandText = "INSERT INTO actor_movie_mapping VALUES (1, 1)";
                oCmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                SqlContext.Pipe.Send(ex.Message.ToString());
            }
            finally
            {
                //commit lub rollback
                oTran.Complete();
                oConn.Close();
            }
        }
        //Uwaga: usuwamy obiekt transakcji
        oTran.Dispose();
    }
};