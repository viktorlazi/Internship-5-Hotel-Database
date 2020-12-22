use master
DROP DATABASE HotelChain

CREATE DATABASE HotelChain

USE HotelChain

CREATE TABLE Hotels(
    Id int IDENTITY(1,1) PRIMARY KEY,
    HotelName nvarChar(100) NOT NULL
)

INSERT INTO Hotels VALUES
('Kaktus'),
('Trump'),
('Popaj'),
('Split'),
('Hilton')

create table Rooms(
    Id int IDENTITY(1,1) PRIMARY KEY,
    HotelId int FOREIGN KEY REFERENCES Hotels(id),
    Category nvarchar(50) NOT NULL,
    Capacity int NOT NULL,
    PricePerNight decimal(12,2),
    RoomNumber int
)

INSERT INTO Rooms VALUES
(1, 'Luxury', 2, 700.00, 120),
(1, 'Casual', 2, 300.00, 111),
(2, 'Luxury', 4, 1500.00, 101),
(2, 'OnlyForTopOnePercent', 5, 300000.00, 1),
(2, '1Bed', 1, 350.00, 2),
(3, 'Room', 2, 40.00, 300),
(3, 'Room', 1, 30.00, 22),
(4, '2Bed', 2, 200.00, 3231),
(4, 'Luxury', 1, 500.00, 32),
(5, 'Luxury', 2, 1700.00, 99),
(5, 'Comfortable', 1, 700.00, 2),
(5, 'BigRoom', 10, 2500.00, 20)

create table Buyers(
    Id int IDENTITY(1,1) PRIMARY KEY,
    FirstName nvarChar(50) NOT NULL,
    LastName nvarChar(50) NOT NULL,
)

INSERT INTO Buyers VALUES
('Mate', 'Jelić'),
('Viktor', 'Lazić'),
('Srečko', 'Srečković'),
('Duje', 'Mandić'),
('Roko', 'Čule'),
('Filip', 'Brstilo'),
('Gost', 'Gostičević')

CREATE TABLE Employees(
    Id int PRIMARY KEY IDENTITY(1,1),
    Job nvarchar(100) NOT NULL,
    FirstName nvarchar(50) NOT NULL,
    LastName nvarchar(50) NOT NULL,
    HotelId int FOREIGN KEY REFERENCES Hotels(Id)
)

INSERT INTO Employees VALUES
('Reception', 'Luka', 'Lukić', 1),
('Cleaner', 'Borna', 'Peti', 1),
('Reception', 'Siniša', 'Vuco', 2),
('Cleaner', 'Željko', 'Željković', 2),
('Director', 'Maja', 'Lipa', 2),
('Cleaner', 'Andrea', 'Šolić', 2),
('Reception', 'Karla', 'Željković', 3),
('Cleaner', 'Glen', 'Glenović', 3),
('Director', 'Srp', 'Srpić', 3),
('Reception', 'Konj', 'Vrana', 4),
('Cleaner', 'Antonio', 'Guzovrat', 4),
('Reception', 'Ana', 'Mrkonja', 5),
('Cleaner', 'Anita', 'Slonovski', 5)

create table Bookings(
    Id int IDENTITY(1,1) PRIMARY KEY,
    CheckIn DateTime2 NOT NULL,
    CheckOut DateTime2 NOT NULL,
    TimeOfPayment DATETIME2 NOT NULL,
    RoomId int FOREIGN KEY REFERENCES Rooms(Id) NOT NULL,
    BuyerId int FOREIGN KEY REFERENCES Buyers(Id) NOT NULL,
    PansionType nvarChar(50) NOT NULL,
    Price decimal(12,2)
)

INSERT INTO Bookings VALUES
('2020-11-04', '2020-11-05', '2020-11-04', 2, 1, 'Ništa', 100),
('2020-12-12', '2020-12-15', '2020-12-12', 3, 2, 'Puni', 5000),
('2020-12-20', '2020-12-22', '2020-12-20', 4, 2, 'Polu', 400),
('2019-06-08', '2019-09-05', '2019-06-08', 5, 2, 'Polu', 600),
('2020-11-04', '2020-11-15', '2020-11-04', 6, 3, 'Puni', 500),
('2020-11-04', '2020-11-25', '2020-11-04', 7, 3, 'Puni', 1500),
('2020-01-04', '2020-11-05','2020-01-04', 8, 4, 'Puni', 3000),
('2017-11-04', '2017-11-05', '2017-11-04', 9, 4, 'Polu', 2000),
('2020-10-14', '2020-11-05', '2020-10-14', 10, 5, 'Polu', 1000),
('2020-11-04', '2020-11-05', '2020-11-04',11, 5, 'Ništa', 1000)



--Dohvatiti sve sobe hotela određenog imena, i to poredane uzlazno po svom broju
SELECT * FROM Rooms WHERE HotelId = (SELECT Id FROM Hotels WHERE HotelName = 'Kaktus') ORDER BY RoomNumber


--Dohvatiti sve sobe u svim hotelima kojima broj počinje sa brojem 1
SELECT * FROM Rooms WHERE RoomNumber LIKE 1

--Dohvatiti samo ime i prezime svih čistačica u određenom hotelu
Select FirstName, LastName FROM Employees WHERE Job = 'Cleaner' AND HotelId = (SELECT Id FROM Hotels WHERE HotelName = 'Hilton')

--Dohvatiti kupnje od 1.12.2020. koje prelaze cijenu od 1000
SELECT * FROM Bookings WHERE TimeOfPayment > '2020-12-01 00:00' AND Price > 1000

--Dohvatiti sve boravke u svim hotelima koji su trenutno u tijeku
SELECT * FROM Bookings WHERE CheckOut > GETDATE()

--Izbrisati sve boravke koji su napravljeni prije 1.1.2020.
DELETE FROM Bookings WHERE TimeOfPayment < '2020-01-01'

--Sve sobe drugog hotela po redu koje imaju kapacitet 3 povećati kapacitet na 4
UPDATE Rooms SET Capacity = 4 WHERE HotelId = 2 AND Capacity = 3

--Dohvatiti povijesni pregled boravaka određene sobe, poredano po vremenu boravka
SELECT * FROM Bookings WHERE RoomId = 4 ORDER BY CheckIn

--Dohvatiti sve boravke koji su bili ili pansion ili polupansion, i to samo u određenom hotelu
SELECT * FROM Bookings WHERE (PansionType = 'Puni' OR PansionType = 'Polu') AND RoomId = (SELECT Id FROM Hotels WHERE HotelName = 'Trump')

--Promovirati 2 zaposlenika sobne posluge u recepcioniste
UPDATE TOP(2) Employees SET Job = 'Reception' WHERE Job = 'Cleaner'

