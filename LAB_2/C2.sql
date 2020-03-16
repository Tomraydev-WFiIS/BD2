--W bazie tempdb ( powinna byæ, je¿eli nie utworzyæ ) Utwórz tabelê z kolumnami dla godziny i minuty pomiaru ( dwie osobne kolumny)
--oraz dwie nastêpne kolumny dla wartoœci mierzonych zawartoœæ CO2 i iloœæ przeje¿d¿aj¹cych pojazdów.
--Wype³niæ tabelê danymi. Wykorzystaæ PIVOT dla pokazania agregatów MIN, MAX, SUM w kolejnych godzinach
--(kolejne godziny powinny byæ w nag³ówkach) dla obu mierzonych wartoœci.  
USE tempdb
GO
IF OBJECT_ID('pomiary') IS NOT NULL
	DROP TABLE pomiary;
GO

CREATE TABLE pomiary(
	godzina int NOT NULL CHECK(godzina>=0 AND godzina<=24),
	minuta int NOT NULL CHECK(minuta>=0 AND minuta<=60),
	co2 float NOT NULL CHECK(co2 >= 0),
	pojazdy int NOT NULL CHECK(pojazdy >= 0)
);

INSERT INTO pomiary VALUES(8, 0, 0.01, 15);
INSERT INTO pomiary VALUES(8, 30, 0.01, 15);
INSERT INTO pomiary VALUES(10, 0, 0.02, 30);
INSERT INTO pomiary VALUES(10, 30, 0.02, 30);
INSERT INTO pomiary VALUES(12, 0, 0.03, 60);
INSERT INTO pomiary VALUES(12, 30, 0.03, 60);
INSERT INTO pomiary VALUES(14, 0, 0.05, 50);
INSERT INTO pomiary VALUES(14, 30, 0.05, 50);

GO
SELECT * FROM pomiary
PIVOT (SUM(pojazdy) FOR godzina IN ([8], [10], [12], [14])) AS a;
