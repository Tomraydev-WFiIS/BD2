using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;


[Serializable]
[Microsoft.SqlServer.Server.SqlUserDefinedAggregate(Format.Native)]
public struct sumDivisibleBy3
{
    private SqlInt32 sum;
    public void Init()
    {
        this.sum = 0;
    }
    public void Accumulate(SqlInt32 Value)
    {
        if ((Value) > 0 && (Value)%3 == 0)
        {
            this.sum += 1;
        }
    }
    public void Merge(sumDivisibleBy3 Group)
    {
        this.sum += Group.sum;
    }
    public SqlInt32 Terminate()
    {
        return ((SqlInt32)this.sum);
    }
};