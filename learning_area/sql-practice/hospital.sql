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

--Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1.
select 
	patient_id,
    weight,
    height,
	case
    	when (weight / power(height * .01, 2)) >= 30 then 1
        else 0
    end as isObese
from patients

-- Show patient_id, first_name, last_name, and attending doctor's specialty. Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'
select 
	p.patient_id,
    p.first_name,
    p.last_name,
    d.specialty
from admissions a
join patients p on a.patient_id = p.patient_id
join doctors d on attending_doctor_id = d.doctor_id
where diagnosis = 'Epilepsy' and d.first_name = 'Lisa'

-- All patients who have gone through admissions, can see their medical documents on our site. Those patients are given a temporary password after their first admission. Show the patient_id and temp_password. 
-- sol1
select 
	p.patient_id,
	concat(p.patient_id, len(last_name), year(birth_date)) as temp_password
from patients p
left join admissions a on p.patient_id = a.patient_id
where a.patient_id not null
group by p.patient_id
-- sol2
select 
	distinct p.patient_id,
    concat(p.patient_id, len(last_name), year(birth_date)) as temp_password
from patients p
join admissions a on p.patient_id = a.patient_id

-- Each admission costs $50 for patients without insurance, and $10 for patients with insurance. All patients with an even patient_id have insurance. 
select
	case
      when patient_id % 2 = 0 THEN 'Yes'
      ELSE 'No'
    END as has_insurance,
    sum(case
      when patient_id % 2 = 0 THEN 10
      ELSE 50
    END) as cost_after_insurance
from admissions
group by has_insurance

-- Show the provinces that has more patients identified as 'M' than 'F'. Must only show full province_name
-- TODO - do again
select province_name
from patients pa
join province_names pr on pa.province_id = pr.province_id
group by province_name
having sum(gender = 'M') > sum(gender = 'F')

-- We are looking for a specific patient. Pull all columns for the patient who matches the following criteria:
-- - First_name contains an 'r' after the first two letters.
-- - Identifies their gender as 'F'
-- - Born in February, May, or December
-- - Their weight would be between 60kg and 80kg
-- - Their patient_id is an odd number
-- - They are from the city 'Kingston'
select *
from patients
where 
	first_name like '__r%' AND
    gender = 'F' AND
    month(birth_date) IN (2, 5, 12) AND
    weight between 60 AND 80 AND
    patient_id % 2 != 0 AND
    city = 'Kingston'

-- Show the percent of patients that have 'M' as their gender. Round the answer to the nearest hundreth number and in percent form.
select 
	concat(
      ROUND(
      	SUM(gender = 'M') / CAST(count(gender) AS float) * 100,
      2),
      '%'
    ) AS males_percent
from patients

-- For each day display the total amount of admissions on that day. Display the amount changed from the previous date.
-- TODO - do again
select 
	admission_date,
    count(admission_date) as admission_amout_per_day,
    count(admission_date) 
		- lag(count(admission_date), 1, null) over (order by admission_date) 
		as admission_amout_change
from admissions
group by admission_date

-- Sort the province names in ascending order in such a way that the province 'Ontario' is always on top.
-- TODO - do again
select province_name
from province_names
order by
	case
    	when province_name = 'Ontario' then 0
        else 1
    end,
    province_name

-- We need a breakdown for the total amount of admissions each doctor has started each year. Show the doctor_id, doctor_full_name, specialty, year, total_admissions for that year.
select 
	d.doctor_id,
    concat(d.first_name, ' ', d.last_name) as doctor_name,
    d.specialty,
    year(a.admission_date) as selected_year,
    count(year(a.admission_date)) as admissions_number
from admissions a
join doctors d on a.attending_doctor_id = d.doctor_id
group by 
	doctor_id,
    year(a.admission_date)