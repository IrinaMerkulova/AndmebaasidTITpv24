## AndmebaasidTITpv24
andmebaasidega seotud SQL kood ja konspektid
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
