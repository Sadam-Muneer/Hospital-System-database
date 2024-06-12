-- Query 1: Select all doctors
SELECT * FROM doctor;

-- Query 2: Select all patients
SELECT * FROM patient;

-- Query 3: Select all appointments
SELECT * FROM appointment;

-- Query 4: Select all staff members
SELECT * FROM staff;

-- Query 5: Select all rooms
SELECT * FROM room;

-- update table data
UPDATE patient
SET name ="junaid"
WHERE name = "Ahmar"

-- drop table

ALTER TABLE patient DROP COLUMN gender;

-- add column

ALTER TABLE patient ADD COLUMN email VARCHAR(30);
-- also column data
UPDATE patient SET email = 'patient1@example.com' WHERE patient_id = 101;
UPDATE patient SET email = 'patient2@example.com' WHERE patient_id = 102;
UPDATE patient SET email = 'patient3@example.com' WHERE patient_id = 103;
UPDATE patient SET email = 'patient4@example.com' WHERE patient_id = 104;
UPDATE patient SET email = 'patient5@example.com' WHERE patient_id = 105;

-- delet column email only 
alter TABLE patient DROP COLUMN email;
-- rename table name
ALTER table doctor rename to doctor2;

-- rename column name 
ALTER table doctor change name doctor_name varchar(20);
-- modift constraints
alter TABLE appointment MODIFY date varchar(25);

-- Query 6: Select appointments with corresponding doctor and patient details
SELECT a.appointment_id, d.name AS doctor_name, p.name AS patient_name, a.date, a.time
FROM appointment AS a
INNER JOIN doctor AS d ON a.doctor_id = d.doctor_id
INNER JOIN patient AS p ON a.patient_id = p.patient_id;

-- Query 7: Select doctors and their specializations
SELECT name, specialization FROM doctor;

-- Query 8: Select patients and their genders
SELECT name, gender FROM patient;

-- Query 9: Select appointments by a specific doctor
SELECT * FROM appointment WHERE doctor_id = 1;

-- Query 10: Select appointments on a specific date
SELECT * FROM appointment WHERE date = '01-06-2024';

-- Query 11: Select available rooms
SELECT * FROM room WHERE availability = TRUE;

-- Query 12: Select unavailable rooms
SELECT * FROM room WHERE availability = FALSE;

-- Query 13: Select appointments for a specific patient
SELECT * FROM appointment WHERE patient_id = 101;

-- Query 14: Select staff members by position
SELECT * FROM staff WHERE position = 'Nurse';

-- Query 15: Select appointments scheduled after a specific time
SELECT * FROM appointment WHERE time > '10AM';

-- Query 16: Select doctors with contact information
SELECT name, contact FROM doctor;

-- Query 17: Select patients with contact information
SELECT name, contact FROM patient;

-- Query 18: Select staff members with contact information
SELECT name, contact FROM staff;

-- Query 19: Select appointments for a specific patient on a specific date
SELECT * FROM appointment WHERE patient_id = 101 AND date = '01-06-2024';

-- Query 20: Select appointments for a specific doctor on a specific date
SELECT * FROM appointment WHERE doctor_id = 1 AND date = '01-06-2024';

-- Query 21: Select appointments scheduled in the morning
SELECT * FROM appointment WHERE time < '12PM';

-- Query 22: Select appointments scheduled in the afternoon
SELECT * FROM appointment WHERE time >= '12PM';

-- Query 23: Select appointments scheduled on weekends
SELECT * FROM appointment WHERE DAYOFWEEK(date) IN (1, 7);

-- Query 24: Select doctors specializing in Cardiology
SELECT * FROM doctor WHERE specialization = 'Cardiologist';

-- Query 25: Select patients with names starting with 'A'
SELECT * FROM patient WHERE name LIKE 'A%';

-- Query 26: Select appointments scheduled before a specific date
SELECT * FROM appointment WHERE date < '02-06-2024';

-- Query 27: Select appointments scheduled after a specific date
SELECT * FROM appointment WHERE date > '01-06-2024';

-- Query 28: Select rooms of type 'Single'
SELECT * FROM room WHERE type = 'Single';

-- Query 29: Select appointments for male patients
SELECT * FROM appointment 
WHERE patient_id IN (SELECT patient_id FROM patient WHERE gender = 'Male');

-- Query 30: Select doctors with names containing 'Dr.'
SELECT * FROM doctor WHERE name LIKE '%Dr.%';

-- Query 31: Select patients with names ending with 'a'
SELECT * FROM patient WHERE name LIKE '%a';

-- Query 32: Select appointments scheduled on weekdays
SELECT * FROM appointment WHERE DAYOFWEEK(date) BETWEEN 2 AND 6;

-- Query 33: Select doctors with IDs less than 3
SELECT * FROM doctor WHERE doctor_id < 3;

-- Query 34: Select patients with IDs greater than 103
SELECT * FROM patient WHERE patient_id > 103;

-- Query 35: Select staff members with IDs between 302 and 304
SELECT * FROM staff WHERE staff_id BETWEEN 302 AND 304;

-- Query 36: Select appointments with IDs not in a specific range
SELECT * FROM appointment WHERE appointment_id NOT BETWEEN 201 AND 203;

-- Query 37: Select appointments scheduled on a specific day and time
SELECT * FROM appointment WHERE date = '01-06-2024' AND time = '10AM';

-- Query 38: Select doctors specializing in Pediatrics or Neurology
SELECT * FROM doctor WHERE specialization IN ('Pediatrician', 'Neurologist');

-- Query 39: Select patients with IDs not in a specific list
SELECT * FROM patient WHERE patient_id NOT IN (101, 102);

-- Query 40: Select appointments scheduled on or after a specific date
SELECT * FROM appointment WHERE date >= '02-06-2024';

-- Query 41: Select rooms of type 'ICU' or 'Maternity'
SELECT * FROM room WHERE type IN ('ICU', 'Maternity');

-- Query 42: Select appointments scheduled before or on a specific date
SELECT * FROM appointment WHERE date <= '02-06-2024';

-- Query 43: Select staff members with names containing 'a' and 'i'
SELECT * FROM staff WHERE name LIKE '%a%' AND name LIKE '%i%';

-- Query 44: Select doctors not specializing in Gynecology
SELECT * FROM doctor WHERE specialization != 'Gynecologist';

-- Query 45: Select patients with names starting with 'Z' and ending with 'h'
SELECT * FROM patient WHERE name LIKE 'Z%h';

-- Query 46: Select appointments scheduled between two specific dates
SELECT * FROM appointment WHERE date BETWEEN '01-06-2024' AND '03-06-2024';

-- Query 47: Select rooms available for allocation
SELECT * FROM room WHERE availability = TRUE;

-- Query 48: Select appointments scheduled in the morning or afternoon
SELECT * FROM appointment WHERE time < '12PM' OR time >= '12PM';

-- Query 49: Select doctors with names containing 'a' or 'i'
SELECT * FROM doctor WHERE name LIKE '%a%' OR name LIKE '%i%';

-- Query 50: Select appointments for female patients older than 18
SELECT * FROM appointment 
WHERE patient_id IN (SELECT patient_id FROM patient WHERE gender = 'Female' AND TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 18);

-- Query 51: Select doctors with IDs greater than 2 and names starting with 'Dr.'
SELECT * FROM doctor WHERE doctor_id > 2 AND name LIKE 'Dr.%';

-- Query 52: Select patients with IDs less than 104 and genders other than 'Male'
SELECT * FROM patient WHERE patient_id < 104 AND gender != 'Male';

-- Query 53: Select staff members with IDs not in a specific range
SELECT * FROM staff WHERE staff_id NOT BETWEEN 303 AND 305;

-- Query 54: Select appointments scheduled on weekdays in June
SELECT * FROM appointment WHERE MONTH(date) = 6 AND DAYOFWEEK(date) BETWEEN 2 AND 6;

-- Query 55: Select rooms of type 'Single' and availability TRUE
SELECT * FROM room WHERE type = 'Single

-- Query 56: Select appointments for patients whose names contain 'a' and are scheduled after 10AM
SELECT * FROM appointment 
WHERE patient_id IN (SELECT patient_id FROM patient WHERE name LIKE '%a%') 
AND time > '10AM';

-- Query 57: Select doctors with IDs divisible by 2
SELECT * FROM doctor WHERE doctor_id % 2 = 0;

-- Query 58: Select patients with IDs divisible by 3
SELECT * FROM patient WHERE patient_id % 3 = 0;

-- Query 59: Select staff members with names starting with 'F' or ending with 'k'
SELECT * FROM staff WHERE name LIKE 'F%' OR name LIKE '%k';

-- Query 60: Select appointments for patients with IDs less than 104 or doctors with IDs greater than 2
SELECT * FROM appointment WHERE patient_id < 104 OR doctor_id > 2;

-- Query 61: Select doctors who are not Pediatricians and not Gynecologists
SELECT * FROM doctor WHERE specialization NOT IN ('Pediatrician', 'Gynecologist');

-- Query 62: Select patients with genders 'Male' or 'Female'
SELECT * FROM patient WHERE gender IN ('Male', 'Female');

-- Query 63: Select appointments for patients with names starting with 'Z' or doctors with names containing 'a'
SELECT * FROM appointment 
WHERE patient_id IN (SELECT patient_id FROM patient WHERE name LIKE 'Z%') 
OR doctor_id IN (SELECT doctor_id FROM doctor WHERE name LIKE '%a%');

-- Query 64: Select rooms with availability TRUE and type 'Single' or 'Double'
SELECT * FROM room WHERE availability = TRUE AND type IN ('Single', 'Double');

-- Query 65: Select appointments scheduled on even-numbered dates
SELECT * FROM appointment WHERE DAY(date) % 2 = 0;

-- Query 66: Select appointments with doctors specializing in available rooms
SELECT a.*
FROM appointment AS a
INNER JOIN doctor AS d ON a.doctor_id = d.doctor_id
INNER JOIN room AS r ON d.specialization = r.type
WHERE r.availability = TRUE;

-- Query 67: Select patients with duplicate contact numbers
SELECT name, contact 
FROM patient 
GROUP BY contact 
HAVING COUNT(*) > 1;

-- Query 68: Select doctors who have performed appointments
SELECT d.* 
FROM doctor AS d 
INNER JOIN appointment AS a ON d.doctor_id = a.doctor_id;

-- Query 69: Select appointments with doctors specializing in Pediatrics or with patient IDs greater than 103
SELECT * FROM appointment 
WHERE doctor_id IN (SELECT doctor_id FROM doctor WHERE specialization = 'Pediatrician') 
OR patient_id > 103;

-- Query 70: Select rooms with availability TRUE and type not 'ICU'
SELECT * FROM room WHERE availability = TRUE AND type != 'ICU';

-- Query 71: Select appointments scheduled in the last week
SELECT * FROM appointment WHERE date >= CURDATE() - INTERVAL 1 WEEK;

-- Query 72: Select patients born in the year 2000
SELECT * FROM patient WHERE YEAR(date_of_birth) = 2000;

-- Query 73: Select appointments with doctors whose names contain 'a' or 'i'
SELECT * FROM appointment 
WHERE doctor_id IN (SELECT doctor_id FROM doctor WHERE name LIKE '%a%' OR name LIKE '%i%');

-- Query 74: Select staff members with names containing 'a' and position 'Receptionist'
SELECT * FROM staff WHERE name LIKE '%a%' AND position = 'Receptionist';

-- Query 75: Select appointments with doctors specializing in available room types
SELECT a.*
FROM appointment AS a
INNER JOIN doctor AS d ON a.doctor_id = d.doctor_id
INNER JOIN room AS r ON d.specialization = r.type
WHERE r.availability = TRUE;

-- Query 76: Select patients with age greater than 30
SELECT * FROM patient WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 30;

-- Query 77: Select appointments scheduled for female patients or with doctors specializing in Gynecology
SELECT * FROM appointment 
WHERE patient_id IN (SELECT patient_id FROM patient WHERE gender = 'Female') 
OR doctor_id IN (SELECT doctor_id FROM doctor WHERE specialization = 'Gynecologist');

-- Query 78: Select staff members with names not starting with 'A'
SELECT * FROM staff WHERE name NOT LIKE 'A%';

-- Query 79: Select appointments scheduled for patients whose names start with 'A' or 'Z'
SELECT * FROM appointment 
WHERE patient_id IN (SELECT patient_id FROM patient WHERE name LIKE 'A%' OR name LIKE 'Z%');

-- Query 80: Select rooms with availability FALSE and type not 'ICU'
SELECT * FROM room WHERE availability = FALSE AND type != 'ICU';

-- Query 81: Select appointments scheduled for patients older than 40 or with doctors younger than 50
SELECT * FROM appointment 
WHERE patient_id IN (SELECT patient_id FROM patient WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 40) 
OR doctor_id IN (SELECT doctor_id FROM doctor WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 50);

-- Query 82: Select doctors with names starting with 'Dr.' and having appointments
SELECT d.* FROM doctor AS d 
INNER JOIN appointment AS a ON d.doctor_id = a.doctor_id 
WHERE d.name LIKE 'Dr.%';

-- Query 83: Select appointments scheduled after 3PM or on weekends
SELECT * FROM appointment WHERE time > '3PM' OR DAYOFWEEK(date) IN (1, 7);

-- Query 84: Select patients with contact numbers starting with '0304'
SELECT * FROM patient WHERE contact LIKE '0304%';

-- Query 85: Select appointments scheduled for patients with IDs in a specific range
SELECT * FROM appointment WHERE patient_id BETWEEN 101 AND 103;

-- Query 86: Select doctors with names containing 'a' and 'i', or 'e'
SELECT * FROM doctor WHERE name LIKE '%a%i%' OR name LIKE '%e%';

-- Query 87: Select patients with names starting with 'Sa' or ending with 'n'
SELECT * FROM patient WHERE name LIKE 'Sa%' OR name LIKE '%n';

-- Query 88: Select appointments with doctors specializing in 'Neurology' and 'Cardiology'
SELECT * FROM appointment 
WHERE doctor_id IN (SELECT doctor_id FROM doctor WHERE specialization IN ('Neurologist', 'Cardiologist'));

-- Query 89: Select rooms with availability TRUE and type 'ICU' or 'Maternity'
SELECT * FROM room WHERE availability = TRUE AND type IN ('ICU', 'Maternity');

-- Query 90: Select appointments scheduled for male patients younger than 25
SELECT * FROM appointment 
WHERE patient_id IN (SELECT patient_id FROM patient WHERE gender = 'Male' AND TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 25);

-- Query 91: Select staff members with IDs in a specific range and names starting with 'K'
SELECT * FROM staff WHERE staff_id BETWEEN 302 AND 304 AND name LIKE 'K%';

-- Query 92: Select appointments scheduled on weekdays and with doctors specializing in 'Orthopedic Surgeon'
SELECT * FROM appointment 
WHERE DAYOF

-- Query 92 (continued): Select appointments scheduled on weekdays and with doctors specializing in 'Orthopedic Surgeon'
SELECT * FROM appointment 
WHERE DAYOFWEEK(date) BETWEEN 2 AND 6 
AND doctor_id IN (SELECT doctor_id FROM doctor WHERE specialization = 'Orthopedic Surgeon');

-- Query 93: Select rooms with availability FALSE and type 'Maternity'
SELECT * FROM room WHERE availability = FALSE AND type = 'Maternity';

-- Query 94: Select appointments scheduled in the last month
SELECT * FROM appointment WHERE date >= CURDATE() - INTERVAL 1 MONTH;

-- Query 95: Select patients with duplicate names
SELECT name, COUNT(*) AS name_count 
FROM patient 
GROUP BY name 
HAVING COUNT(*) > 1;

-- Query 96: Select appointments with doctors who are also patients
SELECT a.* 
FROM appointment AS a 
INNER JOIN doctor AS d ON a.doctor_id = d.doctor_id 
INNER JOIN patient AS p ON d.name = p.name;

-- Query 97: Select staff members with names starting with 'S' and positions not 'Nurse'
SELECT * FROM staff WHERE name LIKE 'S%' AND position != 'Nurse';

-- Query 98: Select appointments scheduled on weekdays and with doctors specializing in 'Gynecologist' or 'Pediatrician'
SELECT * FROM appointment 
WHERE DAYOFWEEK(date) BETWEEN 2 AND 6 
AND doctor_id IN (SELECT doctor_id FROM doctor WHERE specialization IN ('Gynecologist', 'Pediatrician'));

-- Query 99: Select patients with contact numbers not starting with '030'
SELECT * FROM patient WHERE contact NOT LIKE '030%';

-- Query 100: Select appointments with patients who have the same gender as their doctor
SELECT a.* 
FROM appointment AS a 
INNER JOIN doctor AS d ON a.doctor_id = d.doctor_id 
INNER JOIN patient AS p ON a.patient_id = p.patient_id 
WHERE d.gender = p.gender;
