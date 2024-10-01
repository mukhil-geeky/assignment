-- Healthcare System Schema
USE TASK3_1;

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    DateOfBirth DATE,
    Gender VARCHAR(10)
);

INSERT INTO Patients (PatientID, PatientName, DateOfBirth, Gender) VALUES
(1, 'Alice Johnson', '1980-05-15', 'Female'),
(2, 'Bob Smith', '1995-11-30', 'Male'),
(3, 'Carol White', '1970-02-20', 'Female'),
(4, 'David Brown', '1960-01-01', 'Male'),
(5, 'Eva Green', '2002-07-10', 'Female');

INSERT INTO Patients (PatientID, PatientName, DateOfBirth, Gender) VALUES
(6, 'Mukhil M P', '2001-06-22', 'Male');


CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100),
    Specialty VARCHAR(100)
);

INSERT INTO Doctors (DoctorID, DoctorName, Specialty) VALUES
(1, 'Dr. Emma Brown', 'Cardiology'),
(2, 'Dr. Liam Smith', 'Neurology'),
(3, 'Dr. Noah Williams', 'Pediatrics'),
(4, 'Dr. Olivia Jones', 'Orthopedics');





CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate) VALUES
(1, 1, 1, '2024-10-05'),
(2, 2, 2, '2024-10-06'),
(3, 1, 3, '2024-10-07'),
(4, 4, 1, '2024-10-08'),
(5, 5, 4, '2024-10-09');

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate) VALUES
(8, 2, 1, '2023-10-09'),
(9, 3, 3, '2023-10-10');



CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY,
    MedicationName VARCHAR(200),
    DosageForm VARCHAR(50)
);

INSERT INTO Medications (MedicationID, MedicationName, DosageForm) VALUES
(1, 'Aspirin', 'Tablet'),
(2, 'Amoxicillin', 'Capsule'),
(3, 'Ibuprofen', 'Liquid'),
(4, 'Metformin', 'Tablet');


CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY,
    PatientID INT,
    MedicationID INT,
    PrescriptionDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);

INSERT INTO Prescriptions (PrescriptionID, PatientID, MedicationID, PrescriptionDate) VALUES
(1, 1, 1, '2024-09-15'),
(2, 2, 2, '2024-09-20'),
(3, 3, 3, '2024-09-25'),
(4, 4, 4, '2024-09-30');

-- Questions

-- 1. List all patients and their appointments, including patients who have never had an appointment.

SELECT P.PatientID , P.PatientName, A.AppointmentId
FROM Patients P
LEFT JOIN  Appointments A ON P.PatientID = A.PatientID;

-- 2. Display all doctors and their scheduled appointments, including doctors without any appointments.

SELECT D.DoctorID , D.DoctorName, A.AppointmentId,A.AppointmentDate
FROM Doctors D
LEFT JOIN  Appointments A ON D.DoctorID = A.PatientID;

-- 3. Show all medications and the patients they've been prescribed to, including medications that haven't been prescribed.

SELECT M.MedicationID,M.MedicationName,M.DosageForm,P.PatientID,P.PatientName
FROM Medications M
LEFT JOIN Prescriptions R ON R.MedicationID = M.MedicationID
LEFT JOIN Patients P ON P.PatientID = R.PatientID
LEFT JOIN Appointments A ON A.PatientID = P.PatientID;

-- 4. List all possible patient-doctor combinations, regardless of whether an appointment has occurred.

SELECT *
FROM Patients
CROSS JOIN  Doctors;



-- 5. Display all prescriptions with patient and medication information, including prescriptions where either the patient or medication information is missing.

SELECT * 
FROM Prescriptions R
LEFT JOIN Patients P ON R.PatientID = P.PatientID
LEFT JOIN Medications M ON R.MedicationID = M.MedicationID;

-- 6. Show all patients who have never been prescribed any medication, along with their appointment history.

SELECT P.PatientID,P.PatientName,P.DateOfBirth,P.Gender
FROM Patients P
LEFT JOIN Prescriptions R ON P.PatientID = R.MedicationID
LEFT JOIN Medications M ON R.MedicationID = M.MedicationID

WHERE M.MedicationID IS NULL;

-- 7. List all doctors who have appointments in the next week, along with the patients they're scheduled to see.

SELECT D.DoctorID,D.DoctorName,D.Specialty,P.PatientID,P.PatientName,A.AppointmentDate
FROM Doctors D
LEFT JOIN Appointments A ON D.DoctorID = A.DoctorID
LEFT JOIN Patients P ON P.PatientID = A.PatientID
WHERE DATEPART(WEEK,A.AppointmentDate) = DATEPART(WEEK,GETDATE()) +1;


-- 8. Display all medications prescribed to patients over 60 years old, including medications not prescribed to this age group.

SELECT M.MedicationID,M.MedicationName,M.DosageForm,P.PatientID,P.PatientName,P.DateOfBirth,P.Gender
FROM Medications M
LEFT JOIN Prescriptions R ON R.MedicationID = M.MedicationID
LEFT JOIN Patients P ON P.PatientID = R.PatientID
WHERE DATEDIFF(YEAR,P.DateOfBirth,GETDATE()) > 60;

-- 9. Show all appointments from last year and any associated prescription information.

SELECT A.AppointmentID,A.PatientID,A.DoctorID,A.AppointmentDate,R.PrescriptionID,R.PrescriptionDate,R.MedicationID
FROM Appointments A
LEFT JOIN Prescriptions R ON A.PatientID = R.MedicationID
WHERE YEAR(A.AppointmentDate) = YEAR(GETDATE())-1;


-- 10. List all possible specialty-medication combinations, regardless of whether a doctor of that specialty has prescribed that medication.
 
 SELECT D.Specialty,M.MedicationID,M.MedicationName,M.DosageForm
 FROM Doctors D
 CROSS JOIN Medications M;