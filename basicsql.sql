
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10)
);

-- Doctors table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(100)
);

-- Appointments table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Diagnosis VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Insert sample data
INSERT INTO Patients VALUES
(1, 'Alice Johnson', 34, 'Female'),
(2, 'Bob Smith', 28, 'Male'),
(3, 'Carol White', 45, 'Female'),
(4, 'David Brown', 60, 'Male');

INSERT INTO Doctors VALUES
(1, 'Dr. James', 'Cardiologist'),
(2, 'Dr. Emily', 'Dermatologist'),
(3, 'Dr. John', 'Neurologist');

INSERT INTO Appointments VALUES
(1, 1, 1, '2025-04-15', 'Hypertension'),
(2, 2, 2, '2025-04-16', 'Acne'),
(3, 3, 3, '2025-04-17', 'Migraine'),
(4, 4, 1, '2025-04-18', 'Heart Disease'),
(5, 1, 3, '2025-04-20', 'Seizure');

select*from patients;
select*from doctors;
select*from appointments

select name,age from patients
select name,Specialty from doctors

select name,age from patients where age>40
select * from Appointments where AppointmentDate>'2025-04-16'

select gender,count(*) as gendercount from patients group by gender

-- joins

select p.PatientID,p.name,d.DoctorID from appointments as a
join patients as p on a.patientid=p.patientid
join doctors as d on a.doctorid=d.doctorid

select d.name,d.Specialty,a.Diagnosis from Appointments as a
JOIN Doctors d ON a.DoctorID = d.DoctorID

select p.name,d.name,a.AppointmentDate from appointments as a 
join patients p on a.patientid=p.patientid
join doctors d on a.DoctorID=d.DoctorID

select a.AppointmentID,a.appointmentdate,d.name as doctorname from appointments as a
join doctors as d on a.doctorid=d.doctorid

select distinct
 d.name as doctorname,
 d.Specialty from doctors d
join appointments a on d.doctorid=a.doctorid;





use mohana
