use MilosP2021

CREATE TABLE osoba(
id INT IDENTITY(1,1),
ime NVARCHAR(20),
prezime NVARCHAR(30),
id_mama INT CHECK ,
id_tata INT CHECK ,
pol CHAR)
