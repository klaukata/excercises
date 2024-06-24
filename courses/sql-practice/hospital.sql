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
select 
	city,
    count(city) as num_residents
from patients
group by city
order by num_residents desc, city

-- Show first name, last name and role of every person that is either patient or doctor.
select
	first_name,
    last_name,
    'Patient' as role
from patients
union all
select
	first_name,
    last_name,
    'Doctor' as role
from doctors

-- Show all allergies ordered by popularity. Remove NULL values from query.
select 
	allergies,
    count(allergies) as num_allergies
from patients
where allergies not null
group by allergies
order by num_allergies desc

-- Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
select 
	first_name, 
    last_name, 
    birth_date
from patients
where year(birth_date) between 1970 and 1979
order by birth_date

-- We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
select concat(upper(last_name), ',',lower(first_name)) as full_name
from patients
order by first_name desc

-- Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
select 
	province_id,
    sum(height) AS sum_height
from patients
group by province_id
having sum(height) >= 7000

-- Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
select (max(weight) - min(weight))
from patients
where last_name = 'Maroni'

-- Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
select 
	day(admission_date) as days,
    count(admission_date) as admissions_num
from admissions
group by days
order by admissions_num desc

-- Show all columns for patient_id 542's most recent admission_date.
-- sol1
select *
from admissions
where patient_id = 542
group by patient_id
having max(admission_date)
-- sol2
select *
from admissions
where patient_id = 542
order by admission_date desc
limit 1

-- Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:
-- 1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
-- 2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters.
select 
	patient_id, 
    attending_doctor_id, 
    diagnosis
from admissions
where
	(attending_doctor_id like '%2%' and len(patient_id) = 3)
    or
    (patient_id % 2 != 0 and attending_doctor_id in (1, 5, 19))

-- Show first_name, last_name, and the total number of admissions attended for each doctor.
select 
	doctors.first_name,
    doctors.last_name,
    count(attending_doctor_id) admissions_number
from admissions
join doctors on attending_doctor_id = doctors.doctor_id
group by attending_doctor_id

-- For each doctor, display their id, full name, and the first and last admission date they attended.
select 
	d.doctor_id,
	concat(d.first_name, ' ', d.last_name) full_name,
	min(admission_date) first_addmission,
    max(admission_date) last_addmission
from admissions a
join doctors d on attending_doctor_id = d.doctor_id
group by attending_doctor_id

-- Display the total amount of patients for each province. Order by descending.
select 
	province_name,
    count(patient_id) patients_amount
from patients pa
join province_names pr on pa.province_id = pr.province_id
group by pa.province_id
order by patients_amount desc

-- For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
select
	concat(pa.first_name, ' ', pa.last_name) patient_full_name,
    diagnosis,
    concat(do.first_name, ' ', do.last_name) doctor_full_name
from admissions ad
join patients pa on pa.patient_id = ad.patient_id
join doctors do on do.doctor_id = attending_doctor_id

-- display the first name, last name and number of duplicate patients based on their first name and last name. 
-- TODO - do again
select 
	first_name,
    last_name,
    count(*) as duplicates_num
from patients
group by
	first_name,
    last_name
having count(*) > 1

-- Display patient's full name, height in the units feet rounded to 1 decimal, weight in the unit pounds rounded to 0 decimals,
-- birth_date, gender non abbreviated.
-- TODO - do again
select 
	concat(first_name, ' ', last_name) as full_name,
    round(height / 30.48, 1) as height_feet,
    round(weight * 2.205) as weight_feet,
    birth_date,
    case
    	when gender = 'M' then 'Male'
        ELSE 'Female'
    END AS gender
from patients

-- Show patient_id, first_name, last_name from patients whose does not have any records in the admissions table.
select 
	pa.patient_id,
    first_name,
    last_name
from patients pa
LEFT JOIN admissions ad ON pa.patient_id = ad.patient_id
where ad.patient_id is null

-- Show all of the patients grouped into weight groups. Show the total amount of patients in each weight group.
-- Order the list by the weight group decending.
select 
	count(weight),
    weight / 10 * 10 as weight_group
from patients
group by weight_group
order by weight_group desc