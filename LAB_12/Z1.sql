declare @xdoc xml
-- a)
set @xdoc = '<?xml version="1.0"?>
<lista></lista>';

-- b)
set @xdoc.modify('insert <student>Jan<nazwisko/>Kowalski<imie/></student> into (/lista)[1]');
set @xdoc.modify('insert <student>Adam<nazwisko/>Nowak<imie/></student> into (/lista)[1]');
set @xdoc.modify('insert <student>Micha³<nazwisko/>Kowalczyk<imie/></student> into (/lista)[1]');
set @xdoc.modify('insert <student>Ewelina<nazwisko/>Babacka<imie/></student> into (/lista)[1]');
set @xdoc.modify('insert <student>Justyna<nazwisko/>Kowalczyk<imie/></student> into (/lista)[1]');

-- c)
set @xdoc.modify('insert <grupa>1</grupa> as last into (/lista/student)[1]');
set @xdoc.modify('insert <grupa>1</grupa> as last into (/lista/student)[2]');
set @xdoc.modify('insert <grupa>1</grupa> as last into (/lista/student)[3]');
set @xdoc.modify('insert <grupa>1</grupa> as last into (/lista/student)[4]');
set @xdoc.modify('insert <grupa>1</grupa> as last into (/lista/student)[5]');


-- d, e)
select T.c.query('.') results from @xdoc.nodes('lista/student') T(c)

--select @xdoc