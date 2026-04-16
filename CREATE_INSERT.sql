CREATE DATABASE TITpv24baas;

--ab kustutamine
DROP DATABASE opilaneMudel;

use TITpv24baas;
--tabeli loomine
CREATE TABLE opilane(
opilaneID int Primary Key identity(1,1),--automaatselt täidab numbritega
eesnimi varchar(25),
perenimi varchar(30) NOT NULL,
synniaeg DATE,
stip bit,
mobiil varchar(13),
aadress TEXT,
keskmineHinne decimal(2,1) );--(2--kokku, 1- peale komat nt 4.5)

SELECT * FROM opilane;

--tabeli täitmine
INSERT INTO opilane
VALUES ('Artjom','Jegorov', '2000-12-10',1,'+325689','Tallinn', 4.5);

INSERT INTO opilane(perenimi, eesnimi, keskmineHinne)
VALUES ('Sereda', 'Ivan', 4.2),
('Holovanov', 'Ivan', 4.2),
('Suvorov', 'Marko', 5.0);

--andmete uuendamine tabelis
UPDATE opilane SET stip=1, aadress='Tallinn';

UPDATE opilane SET stip=1, aadress='Tartu' WHERE opilaneID=5;

--kustutamine
--tabeli kustutamine
DROP TABLE opilane;
--andmete kustutamine tabelis
DELETE FROM opilane WHERE opilaneID=2;
Select * from opilane;

--FOREIGN KEY
CREATE TABLE opetamine(
opetamineId int PRIMARY KEY identity(1,1),
kuupaev DATE,
oppeaine varchar(30),
opilaneID int, 
FOREIGN KEY (opilaneID) REFERENCES opilane(opilaneID),
hinne int CHECK(hinne<=5));

SELECT * FROM opetamine;
SELECT * FROM opilane;
--täidame tabeli
INSERT INTO opetamine
VALUES ('2026-04-16', 'andmebaasid', 5, 4)



