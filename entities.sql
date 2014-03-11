CREATE DATABASE Catabase;

USE Catabase;

CREATE TABLE Crate (
	crateNo INT PRIMARY KEY IDENTITY(1,1),
	roomNo INT NOT NULL
);

/* NEED:
	Constrain values to number of crates in shelter
*/

CREATE TABLE Animal (
	animalID INT PRIMARY KEY IDENTITY(1,1),
	rfid VARCHAR(30),
	crateNo INT UNIQUE FOREIGN KEY REFERENCES Crate(crateNo),
	vetPriority INT,
	adoptionAvailability VARCHAR(10),
	type VARCHAR(30),
	name VARCHAR(50),
	dob DATE,
	sex char(1),
	weight DECIMAL (4, 2),
	diseases VARCHAR(50),
	allergies VARCHAR(50),
	notes VARCHAR(200)
);

ALTER TABLE Animal
ADD CONSTRAINT chk_adoptionAvailability
CHECK (adoptionAvailability IN ('Available','Adopted'));

ALTER TABLE Animal
ADD CONSTRAINT chk_type
CHECK (type IN ('Cat','Dog','Bird'));

ALTER TABLE Animal
ADD CONSTRAINT chk_sex
CHECK (sex IN ('M','F'));


Create Table Staff(
	staffID INT PRIMARY KEY IDENTITY(1, 1),
	manager CHAR(1),
	lName VARCHAR(50),
	fName VARCHAR(50),
	position VARCHAR(30),
	address VARCHAR(100),
	phone VARCHAR(12),
	email VARCHAR(30)
	PRIMARY KEY(staffID)
);

ALTER TABLE Staff
ADD CONSTRAINT chk_manager
CHECK (manager IN('Y', 'N'));

ALTER TABLE Staff
ADD CONSTRAINT chk_position
CHECK (position IN('Volunteer', 'Employee'));

ALTER TABLE Staff
ADD CONSTRAINT chk_phone
CHECK(LEN(phone) >= 10);


CREATE TABLE Veterinarian (
	vetID INT PRIMARY KEY IDENTITY(1,1),
	lName VARCHAR(30),
	fName VARCHAR(30),
	address VARCHAR(100),
	city VARCHAR(30),
	state VARCHAR(30),
	zip INT,
	phone VARCHAR(12),
	email VARCHAR(30)
);

ALTER TABLE Veterinarian
ADD CONSTRAINT chk_phone
CHECK (len(phone) >= 10);


Create Table FosterFamily
(
	FosterFamID INT PRIMARY KEY IDENTITY (1, 1),
	lName VARCHAR(50),
	fName VARCHAR(50),
	phone VARCHAR(12),
	address VARCHAR(100),
	email VARCHAR(30), 
	PRIMARY KEY (FosterFamID)
);

ALTER TABLE FosterFamily
ADD CONSTRAINT chk_phone
CHECK(LEN(phone) >= 10);


Create Table Client
(
	clientID INT PRIMARY KEY IDENTITY (1, 1),
	lName VARCHAR(50),
	fName VARCHAR(50),
	phone VARCHAR(12),
	address VARCHAR(100),
	email VARCHAR(50),
	status VARCHAR(50),
	notes VARCHAR(200),  
	PRIMARY KEY (clientID)
);

ALTER TABLE Client
ADD CONSTRAINT chk_phone
CHECK(LEN(phone) >= 10);

ALTER TABLE Client
ADD CONSTRAINT chk_status
CHECK(status IN('Looking', 'Found'));


CREATE TABLE VetRecord
(
	vetRecID INT PRIMARY KEY IDENTITY(1,1),
	vetID INT NOT NULL FOREIGN KEY REFERENCES Veterinarian(vetID),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	medProcedure VARCHAR(200) NOT NULL,
	diagnosis VARCHAR(200),
	medRecDATE DATE NOT NULL,
	vetNotes VARCHAR(400)
);


CREATE TABLE GeneralCareRecord
(
	genCareRecID INT PRIMARY KEY IDENTITY(1,1),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
	genRecDATE DATE NOT NULL,
	healthCond INT NOT NULL FOREIGN KEY REFERENCES HealthCondition(healthCondID),
	animalWeight DECIMAL (4, 2),
	generalNotes VARCHAR(400)
);

ALTER TABLE GeneralCareRecord
ADD CONSTRAINT chk_animalWeight 
CHECK (animalWeight>0.00 AND animalWeight<=200.00);

ALTER TABLE Animal
ADD CONSTRAINT chk_healthCond
CHECK (healthCond IN ('Healthy','Pregnant','Ill','Terminal','Decesased'));


CREATE TABLE FosterRecord
(
	fosterRecID INT PRIMARY KEY IDENTITY(1,1),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
	FosterFamID INT NOT NULL FOREIGN KEY REFERENCES FosterFamily(FosterFamID),
	inDATE DATE NOT NULL,
	outDATE DATE NOT NULL,
	fosterNotes VARCHAR(400)
);

ALTER TABLE Animal
ADD CONSTRAINT chk_DATEs
CHECK (inDATE <= outDATE);


CREATE TABLE AdoptionRecord
(
	adoptRecID INT PRIMARY KEY IDENTITY(1,1),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	clientID INT NOT NULL FOREIGN KEY REFERENCES Client(clientID),
	staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
	adoptDATE DATE NOT NULL,
	adoptNotes VARCHAR(400)
);


CREATE TABLE INTakeRecord
(
	INTakeRecID INT PRIMARY KEY IDENTITY(1,1),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
	crateNo INT NOT NULL FOREIGN KEY REFERENCES Crate(crateNo),
	INTakeDATE DATE NOT NULL,
	INTakeNotes VARCHAR(400)
);


CREATE TABLE ReturnRecord
(
	returnRecID INT PRIMARY KEY IDENTITY(1,1),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	clientID INT NOT NULL FOREIGN KEY REFERENCES Client(clientID),
	staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
	returnDATE DATE NOT NULL,
	returnNotes VARCHAR(400) NOT NULL
);


CREATE TABLE HealthCondition(
	healthCondID INT PRIMARY KEY IDENTITY(1,1),
	healthCondName VARCHAR (100) NOT NULL UNIQUE
);