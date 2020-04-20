USE Lab6db;
GO
DROP TABLE grupa;
DROP TABLE przedmiot;
DROP TABLE wykladowca;
DROP TABLE student;


CREATE TABLE student (
	id int PRIMARY KEY,
	fname varchar(30),
	lname varchar(30),
);
CREATE TABLE wykladowca (
	id int PRIMARY KEY,
	fname varchar(30),
	lname varchar(30),
);
CREATE TABLE przedmiot (
	id int PRIMARY KEY,
	name varchar(50),
);
CREATE TABLE grupa (
	id_wykl int FOREIGN KEY REFERENCES wykladowca(id),
	id_stud int FOREIGN KEY REFERENCES student(id),
	id_przed int FOREIGN KEY REFERENCES przedmiot(id),
	PRIMARY KEY (id_wykl, id_stud, id_przed),
);


INSERT INTO student (id, fname, lname) VALUES (1, 'Jan', 'Kowalski');
INSERT INTO student (id, fname, lname) VALUES (2, 'Adam', 'Nowak');
INSERT INTO student (id, fname, lname) VALUES (3, 'Marcelina', 'Kowalczyk');

INSERT INTO wykladowca (id, fname, lname) VALUES (1, 'Jan', 'Miodek');
INSERT INTO wykladowca (id, fname, lname) VALUES (2, 'Jerzy', 'Bralczyk');

INSERT INTO przedmiot (id, name) VALUES (1, 'Politologia');
INSERT INTO przedmiot (id, name) VALUES (2, 'Literatura Polska');

INSERT INTO grupa (id_wykl, id_stud, id_przed) VALUES (1,1,1);
INSERT INTO grupa (id_wykl, id_stud, id_przed) VALUES (1,2,1);
INSERT INTO grupa (id_wykl, id_stud, id_przed) VALUES (1,3,1);

INSERT INTO grupa (id_wykl, id_stud, id_przed) VALUES (2,1,2);
INSERT INTO grupa (id_wykl, id_stud, id_przed) VALUES (2,2,2);

--SELECT w.fname, w.lname, COUNT(s.id) AS n_students FROM grupa g
--	JOIN student s ON s.id=g.id_stud
--	JOIN wykladowca w ON w.id=g.id_wykl
--	GROUP BY w.fname, w.lname
--;

--SELECT p.name, COUNT(s.id) AS n_students FROM grupa g
--	JOIN student s ON s.id=g.id_stud
--	JOIN przedmiot p ON p.id=g.id_przed
--	GROUP BY p.name
--;