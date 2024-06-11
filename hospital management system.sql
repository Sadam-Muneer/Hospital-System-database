-- Create hospital database if not exists
CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;

-- Table Patient
CREATE TABLE IF NOT EXISTS Patient (
    Patient_ID INT NOT NULL AUTO_INCREMENT,
    Patient_FName VARCHAR(20) NOT NULL,
    Patient_LName VARCHAR(20) NOT NULL,
    Phone VARCHAR(12) NOT NULL,
    Blood_Type VARCHAR(5) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Gender VARCHAR(10),
    Condition_ VARCHAR(30),
    Admission_Date DATE,
    Discharge_Date DATE,
    Room_ID INT,
    PRIMARY KEY (Patient_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);

-- Insert data into Patient
INSERT INTO Patient (Patient_ID, Patient_FName, Patient_LName, Phone, Blood_Type, Email, Gender, Condition_, Admission_Date, Discharge_Date, Room_ID) 
VALUES
(1, 'Ahmed', 'Khan', '03001234567', 'A+', 'ahmed.khan@gmail.com', 'Male', 'Flu', '2023-01-10', '2023-01-15', 101),
(2, 'Yasmeen', 'Ali', '03011234567', 'B+', 'yasmeen.ali@gmail.com', 'Female', 'Diabetes', '2023-02-12', '2023-02-20', 102),
(3, 'Mohammed', 'Rafiq', '03021234567', 'O-', 'mohammed.rafiq@gmail.com', 'Male', 'Hypertension', '2023-03-10', '2023-03-18', 103),
(4, 'Fatima', 'Hussain', '03031234567', 'AB+', 'fatima.hussain@gmail.com', 'Female', 'Asthma', '2023-04-14', '2023-04-22', 104),
(5, 'Bilal', 'Ahmad', '03041234567', 'A-', 'bilal.ahmad@gmail.com', 'Male', 'Fracture', '2023-05-10', '2023-05-17', 105);

-- Table Department
CREATE TABLE IF NOT EXISTS Department (
    Dept_ID INT NOT NULL AUTO_INCREMENT,
    Dept_Head VARCHAR(20) NOT NULL,
    Dept_Name VARCHAR(15) NOT NULL,
    Emp_Count INT,
    PRIMARY KEY (Dept_ID)
);

-- Insert data into Department
INSERT INTO Department (Dept_Head, Dept_Name, Emp_Count) 
VALUES
('Dr. Asim', 'Cardiology', 10),
('Dr. Nadia', 'Neurology', 8),
('Dr. Ali', 'Orthopedics', 12),
('Dr. Sara', 'Pediatrics', 15),
('Dr. Zafar', 'Oncology', 7);

-- Table Room
CREATE TABLE IF NOT EXISTS Room (
    Room_ID INT NOT NULL AUTO_INCREMENT,
    Room_Type VARCHAR(20) NOT NULL,
    PRIMARY KEY (Room_ID)
);

-- Insert data into Room
INSERT INTO Room (Room_Type)
VALUES
('General Ward'),
('ICU'),
('Private Room'),
('Surgical Ward'),
('Maternity Ward');

-- Table Staff
CREATE TABLE IF NOT EXISTS Staff (
    Emp_ID INT NOT NULL AUTO_INCREMENT,
    Emp_FName VARCHAR(20) NOT NULL,
    Emp_LName VARCHAR(20) NOT NULL,
    Date_Joining DATE DEFAULT CURRENT_DATE,
    Date_Separation DATE,
    Emp_Type VARCHAR(20) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Dept_ID INT NOT NULL,
    SSN INT NOT NULL,
    PRIMARY KEY (Emp_ID),
    FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID)
);

-- Insert data into Staff
INSERT INTO Staff (Emp_FName, Emp_LName, Emp_Type, Email, Address, Dept_ID, SSN) 
VALUES
('Asim', 'Khan', 'Doctor', 'asim.khan@gmail.com', 'House 1, Street 2, City A', 1, 123456789),
('Nadia', 'Ali', 'Doctor', 'nadia.ali@gmail.com', 'House 3, Street 4, City B', 2, 223456789),
('Ali', 'Hussain', 'Doctor', 'ali.hussain@gmail.com', 'House 5, Street 6, City C', 3, 323456789),
('Sara', 'Ahmed', 'Doctor', 'sara.ahmed@gmail.com', 'House 7, Street 8, City D', 4, 423456789),
('Zafar', 'Shaikh', 'Doctor', 'zafar.shaikh@gmail.com', 'House 9, Street 10, City E', 5, 523456789);

-- Table Doctor
CREATE TABLE IF NOT EXISTS Doctor (
    Doctor_ID INT NOT NULL AUTO_INCREMENT,
    Emp_ID INT NOT NULL,
    Specialization VARCHAR(50) NOT NULL,
    PRIMARY KEY (Doctor_ID),
    FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID)
);

-- Insert data into Doctor
INSERT INTO Doctor (Emp_ID, Specialization) 
VALUES
(1, 'Cardiologist'),
(2, 'Neurologist'),
(3, 'Orthopedic Surgeon'),
(4, 'Pediatrician'),
(5, 'Oncologist');

-- Table Appointment
CREATE TABLE IF NOT EXISTS Appointment (
    Appointment_ID INT NOT NULL AUTO_INCREMENT,
    Doctor_ID INT NOT NULL,
    Patient_ID INT NOT NULL,
    Appointment_Date DATE NOT NULL,
    Appointment_Time TIME NOT NULL,
    PRIMARY KEY (Appointment_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
);

-- Insert data into Appointment (Sample Data)
INSERT INTO Appointment (Doctor_ID, Patient_ID, Appointment_Date, Appointment_Time)
VALUES
(1, 1, '2023-01-11', '09:00:00'),
(2, 2, '2023-02-13', '10:00:00'),
(3, 3, '2023-03-11', '11:00:00'),
(4, 4, '2023-04-15', '12:00:00'),
(5, 5, '2023-05-11', '13:00:00');
