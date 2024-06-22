-- Show all the columns from admissions where the patient was admitted and discharged on the same day.
SELECT * 
FROM admissions
where admission_date = discharge_date

-- Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
SELECT patient_id, first_name 
FROM patients
where len(first_name) >= 6 and first_name like 'S%s'

-- Show the patient id and the total number of admissions for patient_id 579.
SELECT patient_id, count(*)
FROM admissions
where patient_id = 579

-- Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
SELECT distinct city
FROM patients
where province_id = 'NS'

-- Write a query to find list of patients first_name, last_name, and allergies where allergies are not null and are from the city of 'Hamilton'
SELECT first_name, last_name, allergies
FROM patients
where allergies not null and city = 'Hamilton'

-- Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
SELECT patients.patient_id as id, first_name, last_name
FROM patients
join admissions on id = admissions.patient_id
where diagnosis = "Dementia"

-- Show unique birth years from patients and order them by ascending.
SELEct distinct year(birth_date) as y
FROM patients
order by y