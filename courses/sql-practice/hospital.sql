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
SELECT distinct year(birth_date) as y
FROM patients
order by y

-- Show unique first names from the patients table which only occurs once in the list.
SELECT first_name
FROM patients
group by first_name
having count(first_name) = 1

-- Display every patient's first_name. Order the list by the length of each name and then by alphabetically.
SELECT first_name
FROM patients
order by len(first_name), first_name

-- Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.
-- TODO - do again
-- solution 1
SELECT count(*) as male_count, 
	(
      select count(*)
      from patients
      where gender = 'F'
    ) as female_count
FROM patients
where gender = 'M'
-- sol. 2
select 
	sum(gender = 'M') as male_count,
    sum(gender = 'F') as female_count
from patients

-- Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
select first_name, last_name, allergies
from patients
where allergies in ('Penicillin', 'Morphine')
order by allergies, first_name, last_name

-- Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
-- TODO - do again
SELECT patient_id, diagnosis
FROM admissions
group by 
	patient_id,
    diagnosis
having count(patient_id) > 1 and count(diagnosis) > 1

-- Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
-- TODO - do again
select 
	city,
    count(city) as num_residents
from patients
group by city
order by num_residents desc, city