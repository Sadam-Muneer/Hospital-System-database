-- (1) list all patients and their assigned doctor names
                    SELECT patient.Patient_FName, patient.Patient_LName, doctor.Doctor_ID, staff.Emp_FName AS Doctor_FName, staff.Emp_LName AS Doctor_LName
                    FROM Patient
                    JOIN Appointment 
                    ON patient.Patient_ID = appointment.Patient_ID
                    JOIN Doctor 
                    ON appointment.Doctor_ID = doctor.Doctor_ID
                    JOIN Staff 
                    ON doctor.Emp_ID = staff.Emp_ID;


-- (2) find all staff members who joined between '2023-01-01' and '2023-12-31':
SELECT Emp_FName, Emp_LName, Date_Joining
FROM Staff
WHERE Date_Joining BETWEEN '2023-01-01' AND '2023-12-31';

-- (3) list the total number of employees in each department:
SELECT department.Dept_Name, 
COUNT(staff.Emp_ID) AS Total_Employees
FROM Department
JOIN Staff 
ON department.Dept_ID = staff.Dept_ID
GROUP BY department.Dept_Name;


-- (4) find all patients who have a certain blood type (e.g., 'O+') and their emergency contact names:
SELECT patient.Patient_ID, patient.Patient_FName, patient.Patient_LName, emergency_contact.Contact_Name, emergency_contact.Phone, emergency_contact.Relation
FROM Patient
JOIN Emergency_Contact 
ON patient.Patient_ID = emergency_contact.Patient_ID
WHERE patient.Blood_Type = 'O+'
ORDER BY patient.Patient_ID DESC;

-- (5) find all doctors and their specializations:
SELECT staff.Emp_FName AS Doctor_FName, staff.Emp_LName AS Doctor_LName, doctor.Specialization
FROM Doctor
JOIN Staff
ON doctor.Emp_ID = staff.Emp_ID
ORDER BY staff.Emp_FName ASC;

-- (6) find the average salary of employees by department:
SELECT department.Dept_Name, ROUND(AVG(payroll.Salary),2) AS Average_Salary
FROM Department
JOIN Staff 
ON department.Dept_ID = staff.Dept_ID
JOIN Payroll 
ON staff.Emp_ID = payroll.Emp_ID
GROUP BY department.Dept_Name
ORDER BY Average_Salary ASC;


-- (7) find all appointments scheduled on a specific date
SELECT a.Appt_ID, p.Patient_FName, p.Patient_LName, a.Date, a.Time, s.Emp_FName AS Doctor_FName, s.Emp_LName AS Doctor_LName
FROM Appointment a
JOIN Patient p 
ON a.Patient_ID = p.Patient_ID
JOIN Doctor d 
ON a.Doctor_ID = d.Doctor_ID
JOIN Staff s 
ON d.Emp_ID = s.Emp_ID
WHERE a.Date = '2023-06-20';

-- (8) find all patients who have been admitted to a specific room type (e.g., 'ICU'):
SELECT p.Patient_FName, p.Patient_LName, r.Room_Type
FROM Room r
JOIN Patient p 
ON r.Patient_ID = p.Patient_ID
WHERE r.Room_Type = 'ICU';

-- (9) find all bills with a total cost between 20000 and 30000
SELECT b.Bill_ID, p.Patient_FName, p.Patient_LName, b.Total
FROM Bill b
JOIN Patient p 
ON b.Patient_ID = p.Patient_ID
WHERE b.Total BETWEEN 20000 AND 30000
order by p.Patient_FName ASC;

-- (10) names and emails of doctors who work in the 'Cardiology' department:
SELECT d.Doctor_ID, s.Emp_FName AS Doctor_FName, s.Emp_LName AS Doctor_LName, s.Email
FROM Staff s
JOIN Doctor D 
ON d.Emp_ID = s.Emp_ID
JOIN Department dept 
ON d.Dept_ID = dept.Dept_ID
WHERE DEPT.Dept_Name = 'Dermatology';

-- (11) total cost of all tests conducted by a particular doctor
SELECT d.Doctor_ID, s.Emp_FName AS Doctor_FName, s.Emp_LName AS Doctor_LName, SUM(l.Test_Cost) AS Total_Test_Cost
FROM Doctor d
JOIN Staff s 
ON d.Emp_ID = s.Emp_ID
JOIN Lab_Screening l 
ON d.Doctor_ID = l.Doctor_ID
WHERE d.Doctor_ID = 5
GROUP BY d.Doctor_ID, s.Emp_FName, s.Emp_LName;

-- (12) Find the most expensive prescription given to a patient:
SELECT p.Patient_ID, p.Patient_FName, p.Patient_LName, m.M_Name, pr.Dosage, m.M_Cost
FROM Prescription pr
JOIN Patient p 
ON pr.Patient_ID = p.Patient_ID
JOIN Medicine m 
ON pr.Medicine_ID = m.Medicine_ID
ORDER BY m.M_Cost DESC
LIMIT 1;

-- (13) List all bills where the remaining balance is greater than zero, along with patient and insurance details
SELECT b.Bill_ID, b.Date, b.Total, b.Remaining_Balance, p.Patient_FName, p.Patient_LName, i.Provider, i.Plan
FROM Bill b
JOIN Patient p 
ON b.Patient_ID = p.Patient_ID
JOIN Insurance i 
ON b.Policy_Number = i.Policy_Number
WHERE b.Remaining_Balance > 100;