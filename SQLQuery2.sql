USE MilosP20

-- mama date osobe
SELECT * FROM osoba WHERE ID= (SELECT id_mama FROM osoba WHERE ID=1)

-- baba (po mami) date osobe
SELECT * FROM osoba WHERE id=
(SELECT id_mama FROM osoba WHERE ID=(SELECT id_mama FROM osoba WHERE ID=1))

-- braca i sestre date osobe
SELECT * FROM osoba WHERE id_mama= (SELECT id_mama FROM osoba WHERE ID=1) 
AND NOT ID=1

-- deca osobe sa kljucem ID
SELECT * FROM osoba WHERE id_mama = 15

CREATE FUNCTION parent(@ulaz INT, @pol CHAR)
RETURNS INT
AS
BEGIN
DECLARE @rezultat INT
IF @pol = 'm' SET @rezultat = (SELECT id_tata FROM osoba 
WHERE id=@ulaz)
ELSE 
SET @rezultat = (SELECT id_mama FROM osoba 
WHERE id=@ulaz)
RETURN @rezultat
END
select dbo.parent(5, 'm')
select * FROM osoba WHERE id=dbo.parent(5,'z')

select*FROM osoba WHERE id=(SELECT dbo.parent(dbo.parent(1, 'm'), 'm'))

CREATE FUNCTION child (@ulaz INT)
RETURNS TABLE
AS
RETURN SELECT id FROM osoba WHERE id_mama = @ulaz OR id_tata = @ulaz

select * FROM dbo.child(12)

select * from osoba WHERE id in
(select * FROM dbo.child(
dbo.parent(dbo.parent(1,'z'),'z')) 
except (select dbo.parent(1,'z')))

select * from osoba JOIN 
(select * FROM dbo.child(
dbo.parent(dbo.parent(1,'z'),'z')) 
except (select dbo.parent(1,'z'))) as aaa
ON osoba.id=aaa.id

UPDATE osoba 
SET pol='m'
WHERE id in 
(SELECT DISTINCT id_tata FROM osoba)

UPDATE osoba 
SET pol='z'
WHERE id in 
(SELECT DISTINCT id_mama FROM osoba)