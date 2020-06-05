using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;

namespace Z4
{
    class Program
    {
        static void Main(string[] args)
        {
            // Osoby
            XElement osoby = new XElement("osoby",
                new XElement("osoba",
                    new XElement("id", 1),
                    new XElement("imie", "Andrzej"),
                    new XElement("nazwisko", "Zawada"),
                    new XElement("idrola", 1)
                ),
                new XElement("osoba",
                    new XElement("id", 2),
                    new XElement("imie", "Jan"),
                    new XElement("nazwisko", "Nowak"),
                    new XElement("idrola", 2)
                ),
                new XElement("osoba",
                    new XElement("id", 3),
                    new XElement("imie", "Monika"),
                    new XElement("nazwisko", "Kowalska"),
                    new XElement("idrola", 2)
                )
            );

            // Role
            XElement role = new XElement("role",
                new XElement("rola",
                    new XElement("id", 1),
                    new XElement("nazwa", "Szef")
                ),
                new XElement("rola",
                    new XElement("id", 2),
                    new XElement("nazwa", "Pracownik")
                )
            );

            // Zarobki
            XElement zarobki = new XElement("zarobki",
                new XElement("idosoba",
                    new XAttribute("id", 1),
                    new XAttribute("rok", "2004"),
                    new XAttribute("zarobki_roczne", "60000")
                ),
                new XElement("idosoba",
                    new XAttribute("id", 1),
                    new XAttribute("rok", "2005"),
                    new XAttribute("zarobki_roczne", "45000")
                ),
                new XElement("idosoba",
                    new XAttribute("id", 2),
                    new XAttribute("rok", "2004"),
                    new XAttribute("zarobki_roczne", "73000")
                )
            );

            XElement xml = new XElement("pracownicy", osoby, role, zarobki);
            Console.WriteLine(xml);
        }
    }
}
