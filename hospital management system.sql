-- Create doctor table if it doesn't exist
CREATE TABLE IF NOT EXISTS doctor (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(50),
    specialization VARCHAR(50),
    contact VARCHAR(20)
);

-- Insert sample data into Doctor table
INSERT INTO doctor (doctor_id, name, specialization, contact) 
VALUES 
    (1, 'Dr. Muhammad Ali', 'Cardiologist', '+92-123-456789'),
    (2, 'Dr. Fatima Khan', 'Pediatrician', '+92-987-654321'),
    (3, 'Dr. Ahmed Hassan', 'Orthopedic Surgeon', '+92-333-123456'),
    (4, 'Dr. Aisha Mahmood', 'Gynecologist', '+92-345-678901'),
    (5, 'Dr. Bilal Ahmed', 'Neurologist', '+92-321-098765');
    
-- Create patient table if it doesn't exist
CREATE TABLE IF NOT EXISTS patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(50),
    gender VARCHAR(10),
    contact VARCHAR(20)
);

-- Insert sample data into Patient table
INSERT INTO patient (patient_id, name, gender, contact) 
VALUES 
    (101, 'Ali Raza', 'Male', '+92-111-222333'),
    (102, 'Sara Khan', 'Female', '+92-333-444555'),
    (103, 'Ahmed Khan', 'Male', '+92-555-666777'),
    (104, 'Aisha Malik', 'Female', '+92-777-888999'),
    (105, 'Zainab Ali', 'Female', '+92-999-000111');

-- Create appointment table if it doesn't exist
CREATE TABLE IF NOT EXISTS appointment (
    appointment_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    date DATE,
    time TIME,
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

-- Insert sample data into Appointment table
INSERT INTO appointment (appointment_id, doctor_id, patient_id, date, time) 
VALUES 
    (201, 1, 101, '01-06-2024', '10AM'),
    (202, 2, 102, '01-06-2024', '11AM'),
    (203, 3, 103, '02-06-2024', '12AM'),
    (204, 4, 104, '02-06-2024', '13AM'),
    (205, 5, 105, '03-06-2024', '14AM');

-- Create staff table if it doesn't exist
CREATE TABLE IF NOT EXISTS staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(50),
    position VARCHAR(50),
    contact VARCHAR(20)
);

-- Insert sample data into Staff table
INSERT INTO staff (staff_id, name, position, contact) 
VALUES 
    (301, 'Ayesha Ali', 'Nurse', '+92-333-111222'),
    (302, 'Khalid Khan', 'Receptionist', '+92-555-444777'),
    (303, 'Fahad Ahmed', 'Janitor', '+92-999-888111'),
    (304, 'Sana Malik', 'Pharmacist', '+92-777-666999'),
    (305, 'Hamza Raza', 'Lab Technician', '+92-111-000333');

-- Create room table if it doesn't exist
CREATE TABLE IF NOT EXISTS room (
    room_number INT PRIMARY KEY,
    type VARCHAR(20),
    availability BOOLEAN
);

-- Insert sample data into Room table
INSERT INTO room (room_number, type, availability) 
VALUES 
    (501, 'Single', TRUE),
    (502, 'Double', TRUE),
    (503, 'ICU', FALSE),
    (504, 'Maternity', TRUE),
    (505, 'Single', FALSE);
