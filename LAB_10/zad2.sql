use testCLR;
GO
/*
DROP TABLE actor_movie_mapping;
DROP TABLE actor;
DROP TABLE movie;
*/

/*
CREATE TABLE actor (
actor_id INT  PRIMARY KEY,
first_name VARCHAR(50),
surname VARCHAR(50),
);


GO
CREATE TABLE movie (
movie_id INT PRIMARY KEY,
title VARCHAR(50),
);


GO
CREATE TABLE actor_movie_mapping (
actor_id INT FOREIGN KEY REFERENCES actor(actor_id),
movie_id INT FOREIGN KEY REFERENCES movie(movie_id)
);
*/
EXEC dbo.SimpleTransactionScope;

SELECT * FROM actor;
SELECT * FROM movie;
SELECT * FROM actor_movie_mapping;