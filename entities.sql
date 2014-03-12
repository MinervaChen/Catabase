CREATE DATABASE Catabase_TEAM11;

USE Catabase_TEAM11;

CREATE TABLE Crate
(
	crateNo INT PRIMARY KEY CLUSTERED IDENTITY(1,1),
	size VARCHAR(20),
	roomNo INT NOT NULL
);

ALTER TABLE Crate
ADD CONSTRAINT chk_size
CHECK (size IN ('extra small','small', 'medium', 'large', 'extra large'));


CREATE TABLE AnimalType
( 
	animalType VARCHAR(30) PRIMARY KEY CLUSTERED
);


CREATE TABLE HealthCondition
(
	healthCondName VARCHAR (100) PRIMARY KEY CLUSTERED
);


CREATE TABLE Animal 
(
	animalID INT PRIMARY KEY CLUSTERED IDENTITY(1,1),
	rfid VARCHAR(30),
	crateNo INT UNIQUE FOREIGN KEY REFERENCES Crate(crateNo),
	vetPriority SMALLINT,
	adoptionAvailability VARCHAR(10),
	animalType VARCHAR(30) NOT NULL FOREIGN KEY REFERENCES AnimalType(animalType),
	animalName VARCHAR(50),
	animalHealthCond VARCHAR (100) NOT NULL FOREIGN KEY REFERENCES HealthCondition(healthCondName),
	dob DATE,
	sex char(1),
	animalWeight DECIMAL(4, 2),
	diseases VARCHAR(50),
	allergies VARCHAR(50),
	notes VARCHAR(200),
	aIntakeDate DATE
);


ALTER TABLE Animal
ADD CONSTRAINT chk_adoptionAvailability
CHECK (adoptionAvailability IN ('available','adopted', 'in foster care'));

ALTER TABLE Animal
ADD CONSTRAINT chk_sex
CHECK (sex IN ('m','f'));

ALTER TABLE Animal
ADD CONSTRAINT chk_vetPriority
CHECK (vetPriority>=0 AND vetPriority<=10 );


Create Table Staff
(
	staffID INT PRIMARY KEY CLUSTERED IDENTITY(1, 1),
	manager CHAR(1),
	sLName VARCHAR(50),
	sFName VARCHAR(50),
	position VARCHAR(30),
	sStrAddress VARCHAR(100),
	sCity VARCHAR(100),
	sState VARCHAR(3),
	sZipcode VARCHAR(10),
	sPhone VARCHAR(15),
	sEmail VARCHAR(30)
);

ALTER TABLE Staff
ADD CONSTRAINT chk_manager
CHECK (manager IN('y', 'n'));

ALTER TABLE Staff
ADD CONSTRAINT chk_position
CHECK ((position IN('volunteer', 'employee') AND manager = 'n') OR (position = null AND manager = 'y'));

ALTER TABLE Staff
ADD CONSTRAINT chk_phone_s
CHECK(LEN(sPhone) >= 10);


CREATE TABLE InTakeRecord
(
	inTakeRecID INT PRIMARY KEY CLUSTERED IDENTITY(1,1),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
	crateNo INT NOT NULL FOREIGN KEY REFERENCES Crate(crateNo),
	inTakeDATE DATE, 
	inTakeNotes VARCHAR(400)
);

/*Is there a way to enforse that only manager can intake*/
/*Is there a way to inforce that intake date in animal is the same*/

CREATE TABLE Veterinarian 
(
	vetID INT PRIMARY KEY CLUSTERED IDENTITY(1,1),
	vLName VARCHAR(30),
	vFName VARCHAR(30),
	vStrAddress VARCHAR(100),
	vCity VARCHAR(100),
	vState VARCHAR(3),
	vZipcode VARCHAR(10),
	vPhone VARCHAR(15),
	vEmail VARCHAR(30)
);

ALTER TABLE Veterinarian
ADD CONSTRAINT chk_phone_v
CHECK (len(vPhone) >= 10);


Create Table FosterFamily
(
	fosterFamID INT PRIMARY KEY CLUSTERED IDENTITY (1, 1),
	fLName VARCHAR(50),
	fFName VARCHAR(50),
	fStrAddress VARCHAR(100),
	fCity VARCHAR(100),
	fState VARCHAR(3),
	fZipcode VARCHAR(10),
	fPhone VARCHAR(15),
	fEmail VARCHAR(30)
);

ALTER TABLE FosterFamily
ADD CONSTRAINT chk_phone_f
CHECK(LEN(fPhone) >= 10);


Create Table Client
	(
	clientID INT PRIMARY KEY CLUSTERED IDENTITY (1, 1),
	cLName VARCHAR(50),
	cFName VARCHAR(50),
	cStrAddress VARCHAR(100),
	cCity VARCHAR(100),
	cState VARCHAR(3),
	cZipcode VARCHAR(10),
	cPhone VARCHAR(15),
	cEmail VARCHAR(30),
	cStatus VARCHAR(50),
	cNotes VARCHAR(400),
);

ALTER TABLE Client
ADD CONSTRAINT chk_phone_c
CHECK(LEN(Cphone) >= 10);

ALTER TABLE Client
ADD CONSTRAINT chk_cStatus
CHECK(cStatus IN('looking', 'found', 'do not adopt', 'no interest'));


CREATE TABLE VetRecord
(
	vetRecID INT PRIMARY KEY CLUSTERED IDENTITY(1,1),
	vetID INT NOT NULL FOREIGN KEY REFERENCES Veterinarian(vetID),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	medProcedure VARCHAR(200) NOT NULL,
	diagnosis VARCHAR(200),
	medRecDATE DATE NOT NULL,
	vetNotes VARCHAR(400)
);


CREATE TABLE GeneralCareRecord
(
	genCareRecID INT PRIMARY KEY CLUSTERED IDENTITY(1,1),
	animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
	staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
	genRecDATE DATE NOT NULL,
	healthCond VARCHAR (100) NOT NULL FOREIGN KEY REFERENCES HealthCondition(healthCondName),
	animalWeight DECIMAL(4, 2),
	generalNotes VARCHAR(400)
);

ALTER TABLE GeneralCareRecord
ADD CONSTRAINT chk_animalWeight
CHECK (animalWeight>0.00 AND animalWeight<=200.00);


CREATE TABLE FosterRecord
(
fosterRecID INT PRIMARY KEY CLUSTERED IDENTITY(1,1),
animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
FosterFamID INT NOT NULL FOREIGN KEY REFERENCES FosterFamily(FosterFamID),
inDATE DATE NOT NULL,
outDATE DATE NOT NULL,
fosterNotes VARCHAR(400)
);

ALTER TABLE FosterRecord
ADD CONSTRAINT chk_DATEs
CHECK (inDATE <= outDATE);


CREATE TABLE AdoptionRecord
(
adoptRecID INT PRIMARY KEY CLUSTERED IDENTITY(1,1),
animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
clientID INT NOT NULL FOREIGN KEY REFERENCES Client(clientID),
staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
adoptDATE DATE NOT NULL,
adoptNotes VARCHAR(400)
);


CREATE TABLE ReturnRecord
(
returnRecID INT PRIMARY KEY CLUSTERED IDENTITY(1,1),
animalID INT NOT NULL FOREIGN KEY REFERENCES Animal(animalID),
clientID INT NOT NULL FOREIGN KEY REFERENCES Client(clientID),
staffID INT NOT NULL FOREIGN KEY REFERENCES Staff(staffID),
returnDATE DATE NOT NULL,
returnNotes VARCHAR(400) NOT NULL
);


