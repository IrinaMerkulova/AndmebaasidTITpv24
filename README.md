## AndmebaasidTITpv24
andmebaasidega seotud SQL kood ja konspektid
## Sisukord
- [Põhimõisted](#pohimoisted)



## Põhimõisted
- andmebaas - struktureeritud andmete kogum
- tabel = olem -сущность -entity
- veerg = väli - поле *столбец
- rida = kirje - записи
- andmebaasi haldussüsteem - tarkvara, millega abil saab luua andmebaas: mariaDB / XAMPP, SQL SERVER management Studio.<img width="235" height="250" alt="{24793110-7008-49C7-B8F3-A91B332E3CC7}" src="https://github.com/user-attachments/assets/57a70e1f-41a0-4b45-85b1-bef9e5e008f9" />

- primaarne võti -PRIMARY KEY - veerg(tavaliselt id nimega), unikaalne identifikaator, mis eristab iga kirje.
- välisvõti - FOREIGN KEY -FK- veerg, mis loob seos teise tabeli primaarvõtmega.
- päring - QUERY - запрос

## Andmetüübid
```
1. Numbrilised: INT, SmallINT, float, decimal(5,2)
2. Tekst/sümboolised: varchar(255), char(5), TEXT
3. Loogilised: boolean, true/false, bit, bool
4. Kuupäeva: date, time, datetime
```
## SQL - structure Query Language - struktureeritud päringu keel
- Tabeli loomine
```sql
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
```
- Andmete sisestamine tabelisse
```sql
   INSERT INTO opilane
VALUES ('Artjom','Jegorov', '2000-12-10',1,'+325689','Tallinn', 4.5);

INSERT INTO opilane(perenimi, eesnimi, keskmineHinne)
VALUES ('Sereda', 'Ivan', 4.2),
('Holovanov', 'Ivan', 4.2),
('Suvorov', 'Marko', 5.0);
```

## Seosed (tabelivahelised seosed)
- üks-ühele (nt mees-naine)
- üks-mitmele (nt ema-lapsed)<img width="568" height="259" alt="{E2FACBE8-350C-4C5E-921C-593CFC1BE579}" src="https://github.com/user-attachments/assets/3a0612f4-d242-4ac9-863d-0065ee8346c8" />
- mitu-mitmele  (nt õpilased - õpetajad)

## PIIRANGUD
constraint- ограничения (5)
1. PRIMARY KEY
2. FOREIGN KEY
3. CHECK
4. NOT NULL
5. UNIQUE

```sql
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
```
## ALTER TABLE 
-tabeli struktuuri muutmine (struktuur: veerudenimed, andmetüübid, piirangud)

```sql
--uue veeru lisamine
ALTER TABLE opilane ADD isikukood varchar(11);

--veeru kustutamine
ALTER TABLE opilane DROP COLUMN isikukood;

--andmetüübi muutmine varchar(11)-->char(11)
ALTER TABLE opilane ALTER COLUMN isikukood char(11);

--sisseehitatud protseduur, mis näitab tabeli struktuur
sp_help opilane;

```
```sql
--PK lisamine
ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm PRIMARY KEY (ryhmId);
--UNIQUE lisamine
ALTER TABLE ryhm ADD CONSTRAINT un_ryhm UNIQUE (ryhmNimi);

--kontollimiseks täidame tabelit ryhm
SELECT * FROM ryhm;
INSERT INTO ryhm (ryhmId, ryhmNimi)
VALUES (2, 'TITpe24');

--lisame Foreign Key - võõrvõti-välisvõti
ALTER TABLE opilane ADD ryhmId int;
SELECT * FROM opilane;
SELECT * FROM ryhm;
ALTER TABLE opilane ADD CONSTRAINT fk_ryhm 
FOREIGN KEY (ryhmId) REFERENCES ryhm(ryhmId);
```










