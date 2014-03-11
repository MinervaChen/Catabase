USE Catabase;

CREATE TABLE Crate (
	crateNo int PRIMARY KEY IDENTITY(1,1),
	roomNo int NOT NULL
);

/* NEED:
	Constrain values to number of crates in shelter
*/

CREATE TABLE Animal (
	animalID int PRIMARY KEY IDENTITY(1,1),
	rfid int,
	crateNo int UNIQUE FOREIGN KEY REFERENCES Crate(crateNo),
	vetPriority int,
	adoptionAvailability varchar(10),
	type varchar(30),
	name varchar(50),
	dob date,
	sex char(1),
	weight float,
	diseases varchar(50),
	allergies varchar(50),
	notes varchar(200)
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


/* STAFF GOES HERE */


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
);

ALTER TABLE Veterinarian
ADD CONSTRAINT chk_phone
CHECK (len(phone) > 9);


/* FOSTER FAMILY GOES HERE */


/* CLIENT GOES HERE */


CREATE TABLE VetRecord
(
	vetRecID INT PRIMARY KEY IDENTITY(1,1),
	vetID INT NOT NULL FOREIGN KEY REFERENCES Veterinarian(vetID),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	medProcedure VARCHAR(200) NOT NULL,
	diagnosis VARCHAR(200),
	medRecDate DATE NOT NULL,
	vetNotes VARCHAR(400)
);


CREATE TABLE GeneralCareRecord
(
	genCareRecID INT PRIMARY KEY IDENTITY(1,1),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
	genRecDate DATE NOT NULL,
	healthCond INT NOT NULL FOREIGN KEY REFERENCES HealthCondition(healthCondID),
	animalWeight DECIMAL (5, 2),
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
	inDate DATE NOT NULL,
	outDate DATE NOT NULL,
	fosterNotes VARCHAR(400)
);

ALTER TABLE Animal
ADD CONSTRAINT chk_dates
CHECK (inDate <= outDate);


CREATE TABLE AdoptionRecord
(
	adoptRecID INT PRIMARY KEY IDENTITY(1,1),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	clientID INT NOT NULL FOREIGN KEY REFERENCES Client(clientID),
	staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
	adoptDate DATE NOT NULL,
	adoptNotes VARCHAR(400)
);


CREATE TABLE IntakeRecord
(
	intakeRecID INT PRIMARY KEY IDENTITY(1,1),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
	crateNo INT NOT NULL FOREIGN KEY REFERENCES Crate(crateNo),
	intakeDate DATE NOT NULL,
	intakeNotes VARCHAR(400)
);


CREATE TABLE ReturnRecord
(
	returnRecID INT PRIMARY KEY IDENTITY(1,1),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	clientID INT NOT NULL FOREIGN KEY REFERENCES Client(clientID),
	staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
	returnDate DATE NOT NULL,
	returnNotes VARCHAR(400) NOT NULL
);


CREATE TABLE HealthCondition(
	healthCondID INT PRIMARY KEY IDENTITY(1,1),
	healthCondName VARCHAR (100) NOT NULL UNIQUE
);