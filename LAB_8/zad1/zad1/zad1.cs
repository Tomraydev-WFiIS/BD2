using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;


public partial class StoredProcedures
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void zad1(SqlString pattern)
    {
        SqlConnection conn = new SqlConnection("context connection=true");
        conn.Open();
        SqlCommand cmd = new SqlCommand(
            @"SELECT he.EmployeeID, pa.AddressLine1
                FROM HumanResources.Employee he
	            JOIN HumanResources.EmployeeAddress hea ON he.EmployeeID=hea.EmployeeID
	            JOIN Person.Address pa ON hea.AddressID=pa.AddressID
            ;",
            conn
        );
        SqlDataReader rdr = cmd.ExecuteReader();
        while (rdr.Read()){
            if (rdr["AddressLine1"].ToString().Contains(pattern.ToString()))
                SqlContext.Pipe.Send(rdr["EmployeeID"].ToString() + ", " + rdr["AddressLine1"].ToString());
        }
    }
};