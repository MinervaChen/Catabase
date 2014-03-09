CREATE DATABASE Catabase;

USE Catabase;

-- VETERINARIAN TABLE

CREATE TABLE Veterinarian (
vetID int PRIMARY KEY IDENTITY(1,1),
lName varchar(30),
fName varchar(30),
address varchar(50),
city varchar(30),
state varchar(30),
zip int,
phone varchar(12),
email varchar(30)
)

ALTER TABLE Veterinarian
ADD CONSTRAINT phone_len
CHECK (len(phone) > 9)

ALTER TABLE Veterinarian
DROP CONSTRAINT phone_len

INSERT INTO Veterinarian
VALUES ('James', 'Prow', '830 NE 55th St.', 'Seattle', 'Washington', 98105, '4252938', 'jkprow@gmail.com')

-- CRATE

CREATE TABLE Crate (
crateNo int PRIMARY KEY IDENTITY(1,1),
roomNo int NOT NULL
)

-- ANIMAL

CREATE TABLE Animal (
animalID int PRIMARY KEY IDENTITY(1,1),
rfid int,
crateNo int UNIQUE FOREIGN KEY REFERENCES Crate(crateNo),
needsVetAttention char(1),
adoptionAvailability varchar(10),
type varchar(30),
name varchar(50),
dob date,
sex char(1),
weight float,
diseases varchar(50),
allergies varchar(50),
notes varchar(200)
)

/*
ALTER TABLE Veterinarian
ADD CONSTRAINT availability_check
CHECK VALUE WHERE IN ('Available', 'Adopted')
*/