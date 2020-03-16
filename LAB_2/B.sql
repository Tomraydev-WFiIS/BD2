--Utw�rz raport podaj�cy ilo�� dostawc�w o adresie g��wnej siedziby podzielony wg stanu i miasta.
--Dane pochodz� z tabel Purchasing.Vendor, Purchasing.VendorAddress, Person.Address, PersonStateProvince.
USE AdventureWorks
GO


SELECT psp.Name AS State, pa.City, COUNT(psp.Name) AS "n of vendors" FROM Purchasing.Vendor pv
JOIN Purchasing.VendorAddress pva ON pv.VendorID=pva.VendorID
JOIN Person.Address pa ON pva.AddressID=pa.AddressID
JOIN Person.StateProvince psp ON pa.StateProvinceID=psp.StateProvinceID
GROUP BY GROUPING SETS(
	(psp.Name),
	(psp.Name, pa.City)
)
ORDER BY State
;