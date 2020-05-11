use testCLR;

SET STATISTICS TIME ON

/* Tê zakomentowan¹ czêœæ uruchomiæ najpierw by wygenerowaæ liczby

DROP TABLE nums;
CREATE TABLE nums (
	num float
);

DECLARE @i INT
DECLARE @n FLOAT
SET @i = 1
WHILE (@i <= 100000)
BEGIN
	SELECT @n = RAND()*1000;
    INSERT INTO nums (num) VALUES (@n);
    SELECT @i = @i + 1
END
*/


SELECT AVG(num) as 'AVG' FROM nums;
SELECT dbo.avg(num) as 'dbo.avg' FROM nums;