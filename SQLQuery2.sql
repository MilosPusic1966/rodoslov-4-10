USE MilosP20

-- mama date osobe
SELECT * FROM osoba WHERE ID= (SELECT id_mama FROM osoba WHERE ID=1)

-- baba (po mami) date osobe
SELECT * FROM osoba WHERE id=
(SELECT id_mama FROM osoba WHERE ID=(SELECT id_mama FROM osoba WHERE ID=1))

-- braca i sestre date osobe
