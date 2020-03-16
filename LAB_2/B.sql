--Utwórz raport podaj¹cy iloœæ dostawców o adresie g³ównej siedziby podzielony wg stanu i miasta.
--Dane pochodz¹ z tabel Purchasing.Vendor, Purchasing.VendorAddress, Person.Address, PersonStateProvince.
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