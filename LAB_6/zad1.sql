IF EXISTS(select * from sys.databases where name='Lab6db')
DROP DATABASE Lab6db;

CREATE DATABASE Lab6db;

EXEC sp_addrolemember @rolename=db_owner, @membername=[MSSQLSERVER\Lab6user];
select suser_sname(owner_sid) from sys.databases WHERE name='Lab6db';