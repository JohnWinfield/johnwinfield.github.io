-- Creating Tables and Inserting data into those Tables

-- Dropping all Foreign Key's before dropping tables
ALTER TABLE Insurance
DROP CONSTRAINT IF EXISTS fk_patient_id

ALTER TABLE Appointment
DROP 
	CONSTRAINT IF EXISTS fk_patient_id2,
	CONSTRAINT IF EXISTS fk_doctor_id
GO

-- DOCTOR TABLE
DROP TABLE IF EXISTS Doctor

CREATE TABLE Doctor
	(doctor_id INT Primary Key,
	doctor_first_name VARCHAR(25),
	doctor_last_name VARCHAR(25)
	)

-- Patient Table
DROP TABLE IF EXISTS Patient

CREATE TABLE Patient
	(patient_id INT PRIMARY KEY,
	patient_first_name VARCHAR(25),
	patient_last_name VARCHAR(25),
	patient_phone VARCHAR(50)
	)

-- Insurance Table
DROP TABLE IF EXISTS Insurance

CREATE TABLE Insurance
	(insurance_id INT PRIMARY KEY,
	insurance_company VARCHAR(50),
	group_number VARCHAR(10), -- Same for each Insurnace Company
	member_number VARCHAR(15), -- Unqieu to each person
	copay_amount INT,
	patient_id INT,
	CONSTRAINT fk_patient_id
		FOREIGN KEY (patient_id)
		REFERENCES Patient (patient_id)
	)

-- Appointment Table
DROP TABLE IF EXISTS Appointment

CREATE TABLE Appointment
	(appointment_id INT PRIMARY KEY,
	date_id DATE,
	time_id TIME,
	room_number VARCHAR(5),
	patient_id INT,
	CONSTRAINT fk_patient_id2
		FOREIGN KEY (patient_id)
		REFERENCES Patient (patient_id),
	doctor_id INT,
	CONSTRAINT fk_doctor_id
		FOREIGN KEY (doctor_id)
		REFERENCES Doctor (doctor_id)
	)

-- INSERTS
INSERT INTO Doctor VALUES
(55, 'Steve', 'Smith'),
(66, 'Abby', 'Anderson'),
(77, 'Billy', 'Boyd')

INSERT INTO Patient VALUES
(1001, 'William', 'Simmons', '2222222222'),
(1002, 'Thomas', 'Simmons', '3333333333'),
(1003, 'Ford', 'Hendrix', '4444444444'),
(1004, 'Mike', 'Bobay', '5555555555'),
(1005, 'Harley', 'Taylor', '6666666666'),
(1006, 'Robert', 'Irby', '7777777777'),
(1007, 'Daniel', 'Patton', '8888888888'),
(1008, 'Jovany', 'Cabrera','9999999999'),
(1009, 'LeBron', 'James', '1112223333'),
(1010, 'Kobe', 'Bryant', '4445556666'),
(1011, 'Jimmy', 'Butler', '7778889999'),
(1012, 'Josh', 'Butterworth', '5554443333'),
(1013, 'Steve', 'Schmitt', '8887776666'),
(1014, 'Winfield', 'Taylor', '1110001111')



INSERT INTO Insurance VALUES
(301, 'BCBS', '5000', 'B_5000_33', 25, 1001),
(302, 'Kaiser', '3000', 'K_3000_72', 35, 1002),
(303, 'Anthem', '4000', 'A_4000_12', 50, 1003),
(304, 'BCBS', '5000', 'B_5000_99', 25, 1004),
(305, 'BCBS', '5000', 'B_5000_92', 25, 1005),
(306, 'BCBS', '5000', 'B_5000_68', 25, 1006),
(307, 'Kaiser', '3000', 'K_3000_33', 35, 1007),
(308, 'Kaiser', '3000', 'K_3000_26', 35, 1008),
(309, 'BCBS', '5000', 'B_5000_26', 25, 1009),
(310, 'BCBS', '5000', 'B_5000_27', 25, 1010),
(311, 'Kaiser', '3000', 'K_3000_35', 35, 1011),
(312, 'BCBS', '5000', 'B_5000_28', 25, 1012),
(313, 'Kaiser', '3000', 'K_3000_04', 35, 1013),
(314, 'Anthem', '4000', 'A_4000_13', 50, 1014)

INSERT INTO Appointment VALUES
(5001, '2020-10-05', '10:00', '112', 1001, 55),
(5002, '2020-10-06', '9:00', '113', 1002, 66),
(5003, '2020-10-20', '13:00', '114', 1003, 66),
(5004, '2020-10-05', '11:00', '114', 1004, 77),
(5005, '2020-10-15', '8:00', '111', 1005, 66),
(5006, '2020-10-12', '15:00', '112', 1006, 66),
(5007, '2020-10-13', '11:30', '113', 1007, 77),
(5008, '2020-10-11', '13:00', '113', 1008, 66),
(5009, '2020-10-10', '15:30', '114', 1009, 55),
(5010, '2020-10-21', '2:30', '112', 1010, 66),
(5011, '2020-10-03', '10:30', '113', 1011, 77),
(5012, '2020-10-23', '12:00', '112', 1012, 77),
(5013, '2020-10-31', '8:00', '111', 1013, 55),
(5014, '2020-10-31', '16:00', '114', 1014, 66)


