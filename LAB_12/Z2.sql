USE tempdb;

--DROP XML SCHEMA COLLECTION AdresSchema;
CREATE XML SCHEMA COLLECTION AdresSchema AS '
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" targetNamespace="zadanie2" xmlns:prod="http://www.microsoft.com/schemas/adventureworks/products">
<xs:element name="adres">
	<xs:complexType>
		<xs:sequence>
			<xs:element name="ulica" type="xs:string"/>
			<xs:element name="numer_domu" type="xs:string"/>
			<xs:element name="numer_mieszkania" type="xs:string"/>
			<xs:element name="miejscowoœæ" type="xs:string"/>
			<xs:element name="kod" type="xs:string"/> 
		</xs:sequence>
	</xs:complexType>
</xs:element>
</xs:schema>
';

--DROP TABLE person;
CREATE TABLE person (
	id INTEGER PRIMARY KEY,
	nazwisko VARCHAR(30),
	imie VARCHAR(20), 
	adres XML,
);


INSERT INTO person VALUES(
	1,
	'Adam',
	'Adacki',
	'<adres xmlns="zadanie2">
		<ulica>Pawia</ulica>
		<numer_domu>4</numer_domu>
		<numer_mieszkania>27</numer_mieszkania>
		<miejscowoœæ>Kraków</miejscowoœæ>
		<kod>31-502</kod>
	</adres>'
);

SELECT * FROM person;