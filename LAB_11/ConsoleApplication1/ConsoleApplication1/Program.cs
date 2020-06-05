using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    class Samochod{
        public int ID { get; set; }
        public int IDMarka { get; set; }
        public String Kolor { get; set; }
    }

    class Marka{
        public int ID { get; set; }
        public String Nazwa { get; set; }
    }

    class Program
    {
        static void Main(string[] args)
        {
            List<Samochod> samochody = new List<Samochod> {
                new Samochod() { ID = 1, IDMarka = 1, Kolor = "Czarny"},
                new Samochod() { ID = 2, IDMarka = 2, Kolor = "Niebieski"},
                new Samochod() { ID = 3, IDMarka = 3, Kolor = "Czerwony"},
                new Samochod() { ID = 4, IDMarka = 4, Kolor = "Zielony"},
                new Samochod() { ID = 5, IDMarka = 2, Kolor = "Niebieski"},
            };

            List<Marka> marki = new List<Marka> {
                new Marka { ID = 1, Nazwa = "Fiat"},
                new Marka { ID = 2, Nazwa = "BMW"},
                new Marka { ID = 3, Nazwa = "Audi"},
                new Marka { ID = 4, Nazwa = "Volvo"},
            };

            var query1 = samochody.Count(row => row.Kolor == "Niebieski");
            Console.WriteLine("Ilość niebieskich samochodów: " + query1);

            var query2 = samochody.Any(row => row.IDMarka == 4);
            Console.WriteLine("Czy w zbiorze jest samochód marki Volvo: " + query2);

            var query3 = samochody.All(row => row.Kolor == "Zielony");
            Console.WriteLine("Czy wsyzstkie samochody są zielone: " + query3);
        }
    }
}
