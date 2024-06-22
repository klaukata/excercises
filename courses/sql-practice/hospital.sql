-- Show all the columns from admissions where the patient was admitted and discharged on the same day.
SELECT * 
FROM admissions
where admission_date = discharge_date

-- Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
SELECT patient_id, first_name 
FROM patients
where len(first_name) >= 6 and first_name like 'S%s'