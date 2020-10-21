-- Query/ Script Examples 


-- Getting Patient's First name and last name, with their Appointments in order by Date and time

SELECT Appointment.date_id AS Date, Appointment.time_id As Time,+  Patient.patient_last_name + ', ' + Patient.patient_first_name As FullName
FROM Appointment
INNER JOIN Patient
	ON Appointment.patient_id = Patient.patient_id
ORDER BY date_id, time_id


-- Formatting phone numbers
-- SUBSTRING(string, start, length)

Update Patient
SET patient_phone = SUBSTRING(patient_phone, 1, 3) + '-' +
					SUBSTRING(patient_phone, 4, 3) + '-' +
					SUBSTRING(patient_phone, 7, 4)

-- Seeing if certain doctors tend to have more Appointments with through a specific Insurance Company 

SELECT 'Dr. ' + Doctor.doctor_last_name As DocName, Insurance.insurance_company, 
COUNT(Insurance.insurance_company) As CountOfAppointmentByInsuranceCompany, 
CASE
	WHEN COUNT(Insurance.insurance_company) > 2 THEN 'Thats a lot of appointments!'
	WHEN COUNT(Insurance.insurance_company) > 1 THEN 'Thats a normal number of appointments'
	ELSE 'That is not a lot of appointments'
END As AppoitmentDescription
FROM Appointment
INNER JOIN Doctor
	ON Appointment.doctor_id = doctor.doctor_id
INNER JOIN Insurance
	ON Appointment.patient_id = Insurance.patient_id 
GROUP BY Insurance.insurance_company, Doctor.doctor_last_name
