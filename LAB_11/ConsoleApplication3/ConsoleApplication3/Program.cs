using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using System.Data.Linq;

class Program
{
    static void Main(string[] args)
    {
        String connString = @"
        Data Source=.;
        Initial Catalog=Samochody;
        Integrated Security=True
        ";

        DataContext sDataContext = new DataContext(connString);
        Table<Samochod> Samochody = sDataContext.GetTable<Samochod>();

        // Zapytania
        var query1 = Samochody.Count(row => row.Kolor == "Niebieski");
        Console.WriteLine("Ilość niebieskich samochodów: " + query1);

        var query2 = Samochody.Any(row => row.IDMarka == 4);
        Console.WriteLine("Czy w zbiorze jest samochód marki Volvo: " + query2);

        var query3 = Samochody.All(row => row.Kolor == "Zielony");
        Console.WriteLine("Czy wsyzstkie samochody są zielone: " + query3);


    }
}


[Table(Name = "Marka")]
class Marka
{
    private int _ID;
    private String _Nazwa;
    [Column(Name = "ID", Storage = "_ID", DbType = "int NOT NULL IDENTITY", IsPrimaryKey = true, IsDbGenerated = true)]
    public int ID
    {
        get { return _ID; }
        set { _ID = value; }
    }
    [Column(Name = "Nazwa", Storage = "_Nazwa", DbType = "nvarchar(30)")]
    public String Nazwa
    {
        get { return _Nazwa; }
        set { _Nazwa = value; }
    }
    public override string ToString()
    {
        return "[" + ID + "] " + Nazwa;
    }
}


[Table(Name = "Samochod")]
class Samochod
{
    private int _ID;
    private int _IDMarka;
    private String _Kolor;
    private EntityRef<Marka> _Marka;

    [Association(Storage = "_Marka", ThisKey = "IDMarka", OtherKey = "ID")]
    public Marka Marka
    {
        set { _Marka.Entity = value; }
        get { return _Marka.Entity; }
    }

    [Column(Name = "ID", Storage = "_ID", DbType = "int NOT NULL IDENTITY", IsPrimaryKey = true, IsDbGenerated = true)]
    public int ID
    {
        get { return _ID; }
        set { _ID = value; }
    }

    [Column(Name = "IDMarka", Storage = "_IDMarka", DbType = "int NOT NULL")]
    public int IDMarka
    {
        get { return _IDMarka; }
        set { _IDMarka = value; }
    }

    [Column(Name = "Kolor", Storage = "_Kolor", DbType = "nvarchar(30)")]
    public String Kolor
    {
        get { return _Kolor; }
        set { _Kolor = value; }
    }
    public override String ToString()
    {
        return "[" + ID + "] " + Kolor + " " + Marka.Nazwa;
    }
}