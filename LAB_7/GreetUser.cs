using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public partial class LabCLR
{
    public static SQLString GreetUser(string current_user, string server_name, string system_name)
    {
        string greeting = "Witaj: {0}, dzisiaj jest: {1}, pracujesz na serwerze {2} w systemie {3}.";
        return string.Format(greeting, current_user, DateTime.Now.ToString(), server_name, system_name);
    }
};