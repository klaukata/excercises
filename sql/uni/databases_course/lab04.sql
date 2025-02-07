-- 1. Select the first name, last name, and department for all employees. Sort the data by department and then by last name.
select imie, nazwisko, dzial
from pracownicy
order by dzial, nazwisko

-- 2. Select job positions from the employees table (the query should return only distinct rows).
select distinct stanowisko
from pracownicy

-- 3. Select first name, last name, job position, and department for sales representatives.
select imie, nazwisko, stanowisko, dzial
from pracownicy
where stanowisko='Sprzedawca'

-- 4. Select first name, last name, job position, and department for sales representatives or employees from the technical department.
select imie, nazwisko, stanowisko, dzial
from pracownicy
where stanowisko in ('Sprzedawca', 'Techniczny')

-- 5. Display first name, last name, job position, and department for employees who only work as a manager in the customer service 
-- department or the technical department.
select imie, nazwisko, stanowisko, dzial
from pracownicy
where stanowisko = 'Kierownik' and dzial in ('Obsługa klienta', 'Techniczny')

-- 6. Select brand, type, production year, and engine capacity for cars with an engine capacity of 1400 or 1600 cm³ (use the IN predicate).
select marka, typ, rok_prod, poj_silnika
from samochody
where poj_silnika in (1400, 1600)

-- 7. Select brand, type, production year, and engine capacity for cars with an engine capacity between 1100 and 1800 cm³ (use the BETWEEN predicate).
select marka, typ, rok_prod, poj_silnika
from samochody
where poj_silnika between 1100 and 1800

-- 8. Select first name, last name, city, street, and credit card number for customers who own a credit card.

-- Select the first and last names of customers whose last names do not start with 'K' or 'D'.

-- Select the first and last names of customers whose last names have 'O' as the second letter.

-- Select last names of employees, and the names of cities and streets where they rented cars. Sort the results in descending order by last name.

-- Select first name, last name, salary, and bonus. Additionally, insert a calculated column named "Total Pay", which is the sum of salary 
-- and bonus for each employee.
-- Hint: Use the COALESCE function to ensure a proper amount is displayed even for employees who do not receive a bonus.

-- Select first name, last name, department, job position, and employment date for each employee hired after January 1, 1998.

-- Provide first name, last name, department, job position, and employment date for employees who have been working for less than 6 years.
-- The employment date field should contain only the year of employment and should be labeled "Employment Year".

-- Provide first name, last name, department, job position, and employment date for each employee.
-- Note: The employment date should be split into three columns: Year, Month, Day (Column headers should be "Year", "Month", "Day")

-- Select last names of customers, rental number, rental date, return date, and rental duration in days.
-- Rental date and return date should be formatted as DD/MM/YYYY.
-- The number of days should be increased by 1 in calculations (e.g., if a customer rented and returned the car on the same day).

-- Provide the total salary, average salary, minimum salary, and maximum salary for all employees.
-- The result should be displayed in the following format:

-- Provide the number of job positions for employees. The column header should be "Number of Positions".

-- Provide the total salary, average salary, minimum salary, and maximum salary for employees working in each job position.
-- The result should be displayed in the following format:

-- Display the last names of employees who rented cars with a total individual value exceeding 400 PLN.