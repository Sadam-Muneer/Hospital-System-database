CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;
-- ..............Table Patient...............
CREATE TABLE IF NOT EXISTS Patient (
    Patient_ID INT NOT NULL,
    Patient_FName VARCHAR(20) NOT NULL,
    Patient_LName VARCHAR(20) NOT NULL,
    Phone VARCHAR(12) NOT NULL,
    Blood_Type  VARCHAR(5) NOT NULL,
    Email VARCHAR(50),
    Gender  VARCHAR(10),
    Condition_ VARCHAR(30),
    Admission_Date DATE,
    Discharge_Date DATE,
    PRIMARY KEY (Patient_ID) 
    );
    -- .........Add column in patient table.............
    
    ALTER Table Patient
    ADD COLUMN Patient_city VARCHAR(20) DEFAULT 'Multan';
    
      -- Insert data into Patient
INSERT INTO Patient (Patient_ID, Patient_FName, Patient_LName, Phone, Blood_Type, Email, Gender, Condition_, Admission_Date, Discharge_Date) 
VALUES
(1, 'Ahmed', 'Khan', '03001234567', 'A+', 'ahmed.khan@example.com', 'Male', 'Flu', '2023-01-10', '2023-01-15'),
(2, 'yasmeen', 'Ali', '03011234567', 'B+', 'yasmeen.ali@example.com', 'Female', 'Diabetes', '2023-02-12', '2023-02-20'),
(3, 'Mohammed', 'Rafiq', '03021234567', 'O-', 'mohammed.rafiq@example.com', 'Male', 'Hypertension', '2023-03-10', '2023-03-18'),
(4, 'Fatima', 'Hussain', '03031234567', 'AB+', 'fatima.hussain@example.com', 'Female', 'Asthma', '2023-04-14', '2023-04-22'),
(5, 'Bilal', 'Ahmad', '03041234567', 'A-', 'bilal.ahmad@example.com', 'Male', 'Fracture', '2023-05-10', '2023-05-17'),
(6, 'Zainab', 'Shaikh', '03051234567', 'B-', 'zainab.shaikh@example.com', 'Female', 'Anemia', '2023-06-05', '2023-06-15'),
(7, 'Hassan', 'Qureshi', '03061234567', 'O+', 'hassan.qureshi@example.com', 'Male', 'Migraine', '2023-07-08', '2023-07-14'),
(8, 'AliHassan', 'Farooq', '03071234567', 'A+', 'AliHassan.farooq@example.com', 'Male', 'Allergy', '2023-08-11', '2023-08-19'),
(9, 'Ali', 'Javed', '03081234567', 'B+', 'ali.javed@example.com', 'Male', 'Heart Disease', '2023-09-13', '2023-09-22'),
(10, 'Maria', 'Zafar', '03091234567', 'O-', 'maria.zafar@example.com', 'Female', 'Skin Infection', '2023-10-15', '2023-10-23'),
(11, 'Usman', 'Ibrahim', '03101234567', 'AB-', 'usman.ibrahim@example.com', 'Male', 'Cancer', '2023-11-17', '2023-11-25'),
(12, 'Sara', 'Nasir', '03111234567', 'A+', 'sara.nasir@example.com', 'Female', 'Kidney Stone', '2023-12-19', '2023-12-27'),
(13, 'Imran', 'Hameed', '03121234567', 'B+', 'imran.hameed@example.com', 'Male', 'Liver Disease', '2024-01-10', '2024-01-18'),
(14, 'Rida', 'Mustafa', '03131234567', 'O+', 'rida.mustafa@example.com', 'Female', 'Thyroid', '2024-02-11', '2024-02-19'),
(15, 'Kamran', 'Abbas', '03141234567', 'AB+', 'kamran.abbas@example.com', 'Male', 'Stroke', '2024-03-12', '2024-03-20');
-- ..............Table Department...............
CREATE TABLE IF NOT EXISTS Department (
    Dept_ID INT NOT NULL,
    Dept_Head VARCHAR(20) NOT NULL,
    Dept_Name VARCHAR(15) NOT NULL,
    Emp_Count INT,
    PRIMARY  KEY (Dept_ID) 
  );
  -- Insert data into Department
INSERT INTO Department (Dept_ID, Dept_Head, Dept_Name, Emp_Count) 
VALUES
(1, 'Dr. Asim', 'Cardiology', 10),
(2, 'Dr. Nadia', 'Neurology', 8),
(3, 'Dr. Ali', 'Orthopedics', 12),
(4, 'Dr. Sara', 'Pediatrics', 15),
(5, 'Dr. Zafar', 'Oncology', 7),
(6, 'Dr. Yasmin', 'Gynecology', 9),
(7, 'Dr. Bilal', 'Dermatology', 6),
(8, 'Dr. yasmeen', 'ENT', 5),
(9, 'Dr. Kamran', 'Ophthalmology', 8),
(10, 'Dr. Raza', 'Gastronterology', 7),
(11, 'Dr. Umer', 'Urology', 4),
(12, 'Dr. Nadia', 'Rheumatology', 6),
(13, 'Dr. Ahmed', 'Psychiatry', 10),
(14, 'Dr. Farooq', 'Pulmonology', 5),
(15, 'Dr. Hina', 'Nephrology', 4);
-- ..............Table Staff...............
CREATE TABLE IF NOT EXISTS Staff (
    Emp_ID INT  NOT NULL,
    Emp_FName  VARCHAR(20) NOT NULL,
    Emp_LName  VARCHAR(20) NOT NULL,
    Date_Joining  DATE,
    Date_Seperation DATE,
    Emp_Type VARCHAR(20) NOT NULL,
    Email  VARCHAR(50),
    Address  VARCHAR(50) NOT NULL,
    Dept_ID  INT NOT NULL,
    SSN  INT NOT NULL,
    PRIMARY KEY (Emp_ID),
    FOREIGN KEY (Dept_ID) REFERENCES Department  (Dept_ID)
);
   -- Insert data into Staff
INSERT INTO Staff (Emp_ID, Emp_FName, Emp_LName, Date_Joining, Date_Seperation, Emp_Type, Email, Address, Dept_ID, SSN) 
VALUES
(1, 'Asim', 'Khan', '2022-01-01', NULL, 'Doctor', 'asim.khan@example.com', 'House 1, Street 2, City A', 1, 123456789),
(2, 'Nadia', 'Ali', '2022-02-01', NULL, 'Doctor', 'nadia.ali@example.com', 'House 3, Street 4, City B', 2, 223456789),
(3, 'Ali', 'Hussain', '2022-03-01', NULL, 'Doctor', 'ali.hussain@example.com', 'House 5, Street 6, City C', 3, 323456789),
(4, 'Sara', 'Ahmed', '2022-04-01', NULL, 'Doctor', 'sara.ahmed@example.com', 'House 7, Street 8, City D', 4, 423456789),
(5, 'Zafar', 'Shaikh', '2022-05-01', NULL, 'Doctor', 'zafar.shaikh@example.com', 'House 9, Street 10, City E', 5, 523456789),
(6, 'Yasmin', 'Farooq', '2022-06-01', NULL, 'Doctor', 'yasmin.farooq@example.com', 'House 11, Street 12, City F', 6, 623456789),
(7, 'Bilal', 'Ibrahim', '2022-07-01', NULL, 'Doctor', 'bilal.ibrahim@example.com', 'House 13, Street 14, City G', 7, 723456789),
(8, 'yasmeen', 'Raza', '2022-08-01', NULL, 'Doctor', 'yasmeen.raza@example.com', 'House 15, Street 16, City H', 8, 823456789),
(9, 'Kamran', 'Javed', '2022-09-01', NULL, 'Doctor', 'kamran.javed@example.com', 'House 17, Street 18, City I', 9, 923456789),
(10, 'Raza', 'Mustafa', '2022-10-01', NULL, 'Doctor', 'raza.mustafa@example.com', 'House 19, Street 20, City J', 10, 123456780),
(11, 'Umer', 'Zafar', '2022-11-01', NULL, 'Doctor', 'umer.zafar@example.com', 'House 21, Street 22, City K', 11, 223456780),
(12, 'Nadia', 'Iqbal', '2022-12-01', NULL, 'Doctor', 'nadia.iqbal@example.com', 'House 23, Street 24, City L', 12, 323456780),
(13, 'Ahmed', 'Qureshi', '2023-01-01', NULL, 'Doctor', 'ahmed.qureshi@example.com', 'House 25, Street 26, City M', 13, 423456780),
(14, 'Farooq', 'Khan', '2023-02-01', NULL, 'Doctor', 'farooq.khan@example.com', 'House 27, Street 28, City N', 14, 523456780),
(15, 'Hina', 'Nasir', '2023-03-01', NULL, 'Doctor', 'hina.nasir@example.com', 'House 29, Street 30, City O', 15, 623456780);
-- ..............Table Doctor...............
CREATE TABLE IF NOT EXISTS Doctor (
    Doctor_ID INT NOT NULL,
    Qualifications VARCHAR(20) NOT NULL,
    Emp_ID INT NOT NULL,
    Specialization VARCHAR(20) NOT NULL,
    Dept_ID INT NOT NULL,
    PRIMARY KEY (Doctor_ID),
    FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID),
    FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID)
);
   -- Insert data into Doctor
INSERT INTO Doctor (Doctor_ID, Qualifications, Emp_ID, Specialization, Dept_ID)
VALUES
(1, 'MBBS', 1, 'Cardiology', 1),
(2, 'MBBS', 2, 'Neurology', 2),
(3, 'MBBS', 3, 'Orthopedics', 3),
(4, 'MBBS', 4, 'Pediatrics', 4),
(5, 'MBBS', 5, 'Oncology', 5),
(6, 'MBBS', 6, 'Gynecology', 6),
(7, 'MBBS', 7, 'Dermatology', 7),
(8, 'MBBS', 8, 'ENT', 8),
(9, 'MBBS', 9, 'Ophthalmology', 9),
(10, 'MBBS', 10, 'Gastroenterology', 10),
(11, 'MBBS', 11, 'Urology', 11),
(12, 'MBBS', 12, 'Rheumatology', 12),
(13, 'MBBS', 13, 'Psychiatry', 13),
(14, 'MBBS', 14, 'Pulmonology', 14),
(15, 'MBBS', 15, 'Nephrology', 15);
-- ..............Table Nurse...............
CREATE TABLE IF NOT EXISTS Nurse (
    Nurse_ID INT  NOT NULL,
    Patient_ID  INT  NOT NULL,
    Emp_ID  INT NOT NULL,
    Dept_ID INT NOT NULL,
    PRIMARY KEY(Nurse_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID),
    FOREIGN KEY (Emp_ID) REFERENCES Staff  (Emp_ID),
    FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID)
);
   -- Insert data into Nurse
INSERT INTO Nurse (Nurse_ID, Patient_ID, Emp_ID, Dept_ID)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6),
(7, 7, 7, 7),
(8, 8, 8, 8),
(9, 9, 9, 9),
(10, 10, 10, 10),
(11, 11, 11, 11),
(12, 12, 12, 12),
(13, 13, 13, 13),
(14, 14, 14, 14),
(15, 15, 15, 15);
-- ..............Table Emergency_Contact...............
CREATE TABLE IF NOT EXISTS Emergency_Contact(
    Contact_ID INT  NOT NULL,
    Contact_Name VARCHAR(20) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Relation VARCHAR(20) NOT NULL,
    Patient_ID  INT NOT NULL,
    PRIMARY KEY (Contact_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
);
   -- Insert data into Emergency_Contact
INSERT INTO Emergency_Contact (Contact_ID, Contact_Name, Phone, Relation, Patient_ID) 
VALUES
(1, 'Mubashir Khan', '03211234567', 'Father', 1),
(2, 'Farzana Ali', '03221234567', 'Mother', 2),
(3, 'Raheel Rafiq', '03231234567', 'Brother', 3),
(4, 'Sadia Hussain', '03241234567', 'Sister', 4),
(5, 'Murtaza Ahmad', '03251234567', 'Father', 5),
(6, 'Hina Shaikh', '03261234567', 'Mother', 6),
(7, 'Kashif Qureshi', '03271234567', 'Brother', 7),
(8, 'Lubna Farooq', '03281234567', 'Sister', 8),
(9, 'Sameer Javed', '03291234567', 'Father', 9),
(10, 'Samina Zafar', '03301234567', 'Mother', 10),
(11, 'Sohail Ibrahim', '03311234567', 'Brother', 11),
(12, 'Nida Nasir', '03321234567', 'Sister', 12),
(13, 'Amir Hameed', '03331234567', 'Father', 13),
(14, 'Shazia Mustafa', '03341234567', 'Mother', 14),
(15, 'Noman Abbas', '03351234567', 'Brother', 15);
-- ..............Table Payroll...............
  CREATE TABLE IF NOT EXISTS Payroll (
    Account_No VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    Bonus DECIMAL(10,2),
    Emp_ID INT NOT NULL,
    IBAN VARCHAR(50),
    PRIMARY KEY (Account_No),
    FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID)
   );
   -- Insert data into Payroll
INSERT INTO Payroll (Account_No, Salary, Bonus, Emp_ID, IBAN) 
VALUES
('PK1234567890123456', 150000.00, 15000.00, 1, 'PK11ABCD12345678901234'),
('PK2234567890123456', 160000.00, 16000.00, 2, 'PK22ABCD12345678901234'),
('PK3234567890123456', 170000.00, 17000.00, 3, 'PK33ABCD12345678901234'),
('PK4234567890123456', 180000.00, 18000.00, 4, 'PK44ABCD12345678901234'),
('PK5234567890123456', 190000.00, 19000.00, 5, 'PK55ABCD12345678901234'),
('PK6234567890123456', 200000.00, 20000.00, 6, 'PK66ABCD12345678901234'),
('PK7234567890123456', 210000.00, 21000.00, 7, 'PK77ABCD12345678901234'),
('PK8234567890123456', 220000.00, 22000.00, 8, 'PK88ABCD12345678901234'),
('PK9234567890123456', 230000.00, 23000.00, 9, 'PK99ABCD12345678901234'),
('PK0234567890123456', 240000.00, 24000.00, 10, 'PK00ABCD12345678901234'),
('PK0334567890123456', 250000.00, 25000.00, 11, 'PK01ABCD12345678901234'),
('PK0434567890123456', 260000.00, 26000.00, 12, 'PK02ABCD12345678901234'),
('PK0534567890123456', 270000.00, 27000.00, 13, 'PK03ABCD12345678901234'),
('PK0634567890123456', 280000.00, 28000.00, 14, 'PK04ABCD12345678901234'),
('PK0734567890123456', 290000.00, 29000.00, 15, 'PK05ABCD12345678901234');

-- ..............Table Lab_Screening...............
 CREATE TABLE  IF NOT EXISTS Lab_Screening (
    Lab_ID INT NOT NULL,
    Patient_ID  INT  NOT NULL,
    Technician_ID  INT  NOT NULL,
    Doctor_ID  INT NOT NULL,
    Test_Cost  DECIMAL(10,2),
    Date  DATE  NOT NULL,
    PRIMARY KEY (Lab_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID)
);
-- Insert data into Lab_Screening
INSERT INTO Lab_Screening (Lab_ID, Patient_ID, Technician_ID, Doctor_ID, Test_Cost, Date) 
VALUES
(1, 1, 1, 1, 5000.00, '2023-01-12'),
(2, 2, 2, 2, 6000.00, '2023-02-14'),
(3, 3, 3, 3, 7000.00, '2023-03-16'),
(4, 4, 4, 4, 8000.00, '2023-04-18'),
(5, 5, 5, 5, 9000.00, '2023-05-20'),
(6, 6, 6, 6, 10000.00, '2023-06-22'),
(7, 7, 7, 7, 11000.00, '2023-07-24'),
(8, 8, 8, 8, 12000.00, '2023-08-26'),
(9, 9, 9, 9, 13000.00, '2023-09-28'),
(10, 10, 10, 10, 14000.00, '2023-10-30'),
(11, 11, 11, 11, 15000.00, '2023-11-01'),
(12, 12, 12, 12, 16000.00, '2023-12-03'),
(13, 13, 13, 13, 17000.00, '2024-01-05'),
(14, 14, 14, 14, 18000.00, '2024-02-07'),
(15, 15, 15, 15, 19000.00, '2024-03-09');

-- ..............Table Insurance...............
CREATE TABLE IF NOT EXISTS Insurance (
    Policy_Number VARCHAR(20) NOT NULL,
    Patient_ID INT NOT NULL,
    Ins_Code VARCHAR(20) NOT NULL,
    End_Date VARCHAR(10),
    Provider VARCHAR(20),
    Plan VARCHAR(20),
    Co_Pay  DECIMAL(10,2),
    Coverage VARCHAR(20),
    Maternity  BOOLEAN,
    Dental  BOOLEAN,
    Optical BOOLEAN,
    PRIMARY  KEY (Policy_Number),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
);
-- Insert data into Insurance
INSERT INTO Insurance (Policy_Number, Patient_ID, Ins_Code, End_Date, Provider, Plan, Co_Pay, Coverage, Maternity, Dental, Optical) 
VALUES
('P1234567890', 1, 'IC123', '2024-01-10', 'Provider1', 'PlanA', 1000.00, 'Full', TRUE, TRUE, TRUE),
('P2234567890', 2, 'IC124', '2024-02-12', 'Provider2', 'PlanB', 2000.00, 'Full', TRUE, TRUE, TRUE),
('P3234567890', 3, 'IC125', '2024-03-14', 'Provider3', 'PlanC', 3000.00, 'Full', TRUE, TRUE, TRUE),
('P4234567890', 4, 'IC126', '2024-04-16', 'Provider4', 'PlanD', 4000.00, 'Full', TRUE, TRUE, TRUE),
('P5234567890', 5, 'IC127', '2024-05-18', 'Provider5', 'PlanE', 5000.00, 'Full', TRUE, TRUE, TRUE),
('P6234567890', 6, 'IC128', '2024-06-20', 'Provider6', 'PlanF', 6000.00, 'Full', TRUE, TRUE, TRUE),
('P7234567890', 7, 'IC129', '2024-07-22', 'Provider7', 'PlanG', 7000.00, 'Full', TRUE, TRUE, TRUE),
('P8234567890', 8, 'IC130', '2024-08-24', 'Provider8', 'PlanH', 8000.00, 'Full', TRUE, TRUE, TRUE),
('P9234567890', 9, 'IC131', '2024-09-26', 'Provider9', 'PlanI', 9000.00, 'Full', TRUE, TRUE, TRUE),
('P0234567890', 10, 'IC132', '2024-10-28', 'Provider10', 'PlanJ', 10000.00, 'Full', TRUE, TRUE, TRUE),
('P0334567890', 11, 'IC133', '2024-11-30', 'Provider11', 'PlanK', 11000.00, 'Full', TRUE, TRUE, TRUE),
('P0434567890', 12, 'IC134', '2024-12-02', 'Provider12', 'PlanL', 12000.00, 'Full', TRUE, TRUE, TRUE),
('P0534567890', 13, 'IC135', '2025-01-04', 'Provider13', 'PlanM', 13000.00, 'Full', TRUE, TRUE, TRUE),
('P0634567890', 14, 'IC136', '2025-02-06', 'Provider14', 'PlanN', 14000.00, 'Full', TRUE, TRUE, TRUE),
('P0734567890', 15, 'IC137', '2025-03-08', 'Provider15', 'PlanO', 15000.00, 'Full', TRUE, TRUE, TRUE);

-- ..............Table Medicine...............
CREATE TABLE IF NOT EXISTS Medicine (
    Medicine_ID INT  NOT NULL,
    M_Name VARCHAR(20) NOT NULL,
    M_Quantity INT NOT NULL,
    M_Cost  Decimal(10,2),
   PRIMARY KEY (Medicine_ID)
    );
-- Insert data into Medicine
INSERT INTO Medicine (Medicine_ID, M_Name, M_Quantity, M_Cost) 
VALUES
(1, 'Paracetamol', 100, 5.00),
(2, 'Ibuprofen', 200, 10.00),
(3, 'Amoxicillin', 150, 15.00),
(4, 'Metformin', 80, 20.00),
(5, 'Omeprazole', 120, 25.00),
(6, 'Aspirin', 130, 30.00),
(7, 'Ciprofloxacin', 90, 35.00),
(8, 'Azithromycin', 110, 40.00),
(9, 'Lisinopril', 140, 45.00),
(10, 'Amlodipine', 160, 50.00),
(11, 'Simvastatin', 70, 55.00),
(12, 'Levothyroxine', 180, 60.00),
(13, 'Atorvastatin', 75, 65.00),
(14, 'Metoprolol', 200, 70.00),
(15, 'Losartan', 85, 75.00);
-- ..............Table Prescription...............
CREATE TABLE IF NOT EXISTS Prescription (
    Prescription_ID INT  NOT NULL,
    Patient_ID  INT  NOT NULL,
    Medicine_ID  INT  NOT NULL,
    Date  DATE,
    Dosage  INT,
    Doctor_ID INT NOT NULL,
    PRIMARY KEY (Prescription_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID),
    FOREIGN KEY (Medicine_ID) REFERENCES Medicine (Medicine_ID)
);
-- Insert data into Prescription
INSERT INTO Prescription (Prescription_ID, Patient_ID, Medicine_ID, Date, Dosage, Doctor_ID) 
VALUES
(1, 1, 1, '2023-01-11', 500, 1),
(2, 2, 2, '2023-02-13', 600, 2),
(3, 3, 3, '2023-03-15', 700, 3),
(4, 4, 4, '2023-04-17', 800, 4),
(5, 5, 5, '2023-05-19', 900, 5),
(6, 6, 6, '2023-06-21', 1000, 6),
(7, 7, 7, '2023-07-23', 1100, 7),
(8, 8, 8, '2023-08-25', 1200, 8),
(9, 9, 9, '2023-09-27', 1300, 9),
(10, 10, 10, '2023-10-29', 1400, 10),
(11, 11, 11, '2023-11-01', 1500, 11),
(12, 12, 12, '2023-12-03', 1600, 12),
(13, 13, 13, '2024-01-05', 1700, 13),
(14, 14, 14, '2024-02-07', 1800, 14),
(15, 15, 15, '2024-03-09', 1900, 15);

-- ..............Table Medical_History...............
CREATE TABLE IF NOT EXISTS Medical_History (
    Record_ID  INT NOT NULL,
    Patient_ID  INT NOT NULL,
    Allergies VARCHAR(50),
    Pre_Conditions VARCHAR(50),
    PRIMARY KEY (Record_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
);
-- Insert data into Medical_History
INSERT INTO Medical_History (Record_ID, Patient_ID, Allergies, Pre_Conditions) 
VALUES
(1, 1, 'None', 'None'),
(2, 2, 'Peanuts', 'Diabetes'),
(3, 3, 'Penicillin', 'Hypertension'),
(4, 4, 'Dust', 'Asthma'),
(5, 5, 'None', 'None'),
(6, 6, 'None', 'Anemia'),
(7, 7, 'None', 'Migraine'),
(8, 8, 'Pollen', 'Allergy'),
(9, 9, 'None', 'Heart Disease'),
(10, 10, 'None', 'Skin Infection'),
(11, 11, 'None', 'Cancer'),
(12, 12, 'None', 'Kidney Stone'),
(13, 13, 'None', 'Liver Disease'),
(14, 14, 'None', 'Thyroid'),
(15, 15, 'None', 'Stroke');

-- ..............Table Appointment...............
CREATE TABLE IF NOT EXISTS Appointment (
    Appt_ID INT  NOT NULL,
    Scheduled_On  DATETIME NOT NULL,
    Date  DATE,
    Time TIME,
    Doctor_ID INT NOT NULL,
    Patient_ID  INT NOT NULL,
    PRIMARY KEY (Appt_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID), 
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
);
-- Insert data into Appointment
INSERT INTO Appointment (Appt_ID, Scheduled_On, Date, Time, Doctor_ID, Patient_ID) VALUES
(1, '2023-01-10 10:00:00', '2023-01-10', '10:00:00', 1, 1),
(2, '2023-02-12 11:00:00', '2023-02-12', '11:00:00', 2, 2),
(3, '2023-03-14 12:00:00', '2023-03-14', '12:00:00', 3, 3),
(4, '2023-04-16 13:00:00', '2023-04-16', '13:00:00', 4, 4),
(5, '2023-05-18 14:00:00', '2023-05-18', '14:00:00', 5, 5),
(6, '2023-06-20 15:00:00', '2023-06-20', '15:00:00', 6, 6),
(7, '2023-07-22 16:00:00', '2023-07-22', '16:00:00', 7, 7),
(8, '2023-08-24 17:00:00', '2023-08-24', '17:00:00', 8, 8),
(9, '2023-09-26 18:00:00', '2023-09-26', '18:00:00', 9, 9),
(10, '2023-10-28 19:00:00', '2023-10-28', '19:00:00', 10, 10),
(11, '2023-11-30 20:00:00', '2023-11-30', '20:00:00', 11, 11),
(12, '2024-01-01 21:00:00', '2024-01-01', '21:00:00', 12, 12),
(13, '2024-02-03 22:00:00', '2024-02-03', '22:00:00', 13, 13),
(14, '2024-03-05 23:00:00', '2024-03-05', '23:00:00', 14, 14),
(15, '2024-04-07 00:00:00', '2024-04-07', '00:00:00', 15, 15);
-- ............Table Room...........
 CREATE TABLE IF NOT EXISTS Room (
    Room_ID INT NOT NULL,
    Room_Type VARCHAR(50) NOT NULL,
    Patient_ID  INT  NOT NULL,
    Room_Cost  DECIMAL(10,2),
    PRIMARY KEY (Room_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
    );
-- Insert data into Room
INSERT INTO Room (Room_ID, Room_Type, Patient_ID, Room_Cost) VALUES
(1, 'Private', 1, 1000.00),
(2, 'Private', 2, 2000.00),
(3, 'Semi-Private', 3, 1500.00),
(4, 'Semi-Private', 4, 2500.00),
(5, 'General', 5, 3000.00),
(6, 'General', 6, 4000.00),
(7, 'ICU', 7, 5000.00),
(8, 'ICU', 8, 6000.00),
(9, 'General', 9, 7000.00),
(10, 'Semi-Private', 10, 8000.00),
(11, 'Private', 11, 9000.00),
(12, 'ICU', 12, 10000.00),
(13, 'General', 13, 11000.00),
(14, 'Semi-Private', 14, 12000.00),
(15, 'Private', 15, 13000.00);
-- .............Table Bill.............
CREATE TABLE IF NOT EXISTS Bill (
    Bill_ID INT NOT NULL,
    Date  DATE,
    Room_Cost Decimal(10,2),
    Test_Cost  DECIMAL(10,2),
    Other_Charges  DECIMAL(10,2),
    M_Cost DECIMAL(10,2),
    Total  DECIMAL(10,2),
    Patient_ID INT NOT NULL,
    Remaining_Balance DECIMAL(10,2),
    Policy_Number VARCHAR(20) NOT NULL,
    PRIMARY KEY (Bill_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID),
    FOREIGN KEY (Policy_Number) REFERENCES Insurance (Policy_Number)
);

-- Insert data into Bill
INSERT INTO Bill (Bill_ID, Date, Room_Cost, Test_Cost, Other_Charges, M_Cost, Total, Patient_ID, Remaining_Balance, Policy_Number) 
VALUES
(1, '2023-01-12', 1000.00, 5000.00, 200.00, 5.00, 6205.00, 1, 0.00, 'P1234567890'),
(2, '2023-02-14', 2000.00, 6000.00, 300.00, 10.00, 8310.00, 2, 0.00, 'P2234567890'),
(3, '2023-03-16', 1500.00, 7000.00, 400.00, 15.00, 8915.00, 3, 0.00, 'P3234567890'),
(4, '2023-04-18', 2500.00, 8000.00, 500.00, 20.00, 11020.00, 4, 0.00, 'P4234567890'),
(5, '2023-05-20', 3000.00, 9000.00, 600.00, 25.00, 12625.00, 5, 0.00, 'P5234567890'),
(6, '2023-06-22', 4000.00, 10000.00, 700.00, 30.00, 14730.00, 6, 0.00, 'P6234567890'),
(7, '2023-07-24', 5000.00, 11000.00, 800.00, 35.00, 16835.00, 7, 0.00, 'P7234567890'),
(8, '2023-08-26', 6000.00, 12000.00, 900.00, 40.00, 18940.00, 8, 0.00, 'P8234567890'),
(9, '2023-09-28', 7000.00, 13000.00, 1000.00, 45.00, 21045.00, 9, 0.00, 'P9234567890'),
(10, '2023-10-30', 8000.00, 14000.00, 1100.00, 50.00, 23150.00, 10, 0.00, 'P0234567890'),
(11, '2023-11-01', 9000.00, 15000.00, 1200.00, 55.00, 25255.00, 11, 0.00, 'P0334567890'),
(12, '2023-12-03', 10000.00, 16000.00, 1300.00, 60.00, 27360.00, 12, 0.00, 'P0434567890'),
(13, '2024-01-05', 11000.00, 17000.00, 1400.00, 65.00, 29465.00, 13, 0.00, 'P0534567890'),
(14, '2024-02-07', 12000.00, 18000.00, 1500.00, 70.00, 31570.00, 14, 0.00, 'P0634567890'),
(15, '2024-03-09', 13000.00, 19000.00, 1600.00, 75.00, 33675.00, 15, 0.00, 'P0734567890');
SET SQL_SAFE_UPDATES = 0;
UPDATE BILL
set Remaining_Balance = 500
where Remaining_Balance = 0.00;