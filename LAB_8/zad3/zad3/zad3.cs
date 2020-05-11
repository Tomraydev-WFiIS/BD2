using System;
using System.Data;
using Microsoft.SqlServer.Server;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Data.Sql;


public partial class lab8zad3{
    private class DataResult{
        public SqlInt32 id;
        public SqlString address;
        public DataResult(SqlInt32 id, SqlString address){
            this.id = id;
            this.address = address;
        }
    }

    [Microsoft.SqlServer.Server.SqlFunction(
        Name = "lab8zad3",
        DataAccess = DataAccessKind.Read,
        FillRowMethodName = "FillRowTable",
        TableDefinition = "EmployeeID int, AddressLine1 nvarchar(30)"
    )]
    public static IEnumerable zad3(SqlString pattern){
        ArrayList coll = new ArrayList();
        SqlConnection conn = new SqlConnection("context connection=true");
        conn.Open();
        SqlCommand cmd = new SqlCommand(
            @"SELECT he.EmployeeID, pa.AddressLine1
                FROM AdventureWorks.HumanResources.Employee he
	            JOIN AdventureWorks.HumanResources.EmployeeAddress hea ON he.EmployeeID=hea.EmployeeID
	            JOIN AdventureWorks.Person.Address pa ON hea.AddressID=pa.AddressID
            ;",
            conn
        );
        SqlDataReader rdr = cmd.ExecuteReader();
        while (rdr.Read())
        {
            if (rdr["AddressLine1"].ToString().Contains(pattern.ToString()))
                coll.Add(new DataResult(rdr.GetSqlInt32(0), rdr.GetSqlString(1)));
        }
        return coll;
    }

    public static void FillRowTable(object dataResultObj, out SqlInt32 id, out SqlString AddressLine1){
        DataResult dataResult = (DataResult)dataResultObj;
        id = dataResult.id;
        AddressLine1 = dataResult.address;
    }
}