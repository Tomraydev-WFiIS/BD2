use testCLR;

create table test ( complexField dbo.ComplexNumber);
insert into test (complexField) values('25+52i');
select complexField.ComplexConjugate().ToString() as sprz�enie from test;
select complexField.abs() as modu� from test;
drop table test;