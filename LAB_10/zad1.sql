USE testCLR;
GO

--DROP TABLE test1;
--DROP TABLE logs;


CREATE TABLE test1 (
	num int
);

CREATE TABLE logs (
	log_id INT IDENTITY PRIMARY KEY,
	time_inserted DATETIME NOT NULL DEFAULT (getDate()),
	data VARCHAR(50) NOT NULL,
	username VARCHAR(50) NOT NULL,
);


INSERT INTO test1 VALUES(5);
--INSERT INTO logs (data, username) VALUES('test', 'test');

SELECT * FROM test1;
SELECT * FROM logs;