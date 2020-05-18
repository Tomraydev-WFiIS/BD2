using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.SqlServer.Server;


public partial class Triggers
{
    // Enter existing table or view for the target and uncomment the attribute line
    [Microsoft.SqlServer.Server.SqlTrigger (Name="Trigger1", Target="test1", Event="FOR INSERT")]
    public static void Trigger1()
    {
        using (SqlConnection cn = new SqlConnection("context connection=true"))
        {
            cn.Open();
            string sql = "INSERT INTO logs " +
            "(data, username)" +
            "VALUES((SELECT CAST(num as VARCHAR(50)) FROM INSERTED), USER)";
            SqlCommand sqlComm = new SqlCommand(sql, cn);
            sqlComm.ExecuteNonQuery();
        }
    }
}
