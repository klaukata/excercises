-- 21. Provide the employee number, first name, last name, and the number of years worked by each employee.
-- Note: For the years worked, the column header should be "Years Worked", and the data field should display the text 
-- "Employed for X years", where X is the number of years worked by the employee.
select 
	nr_pracownika, 
	imie, 
	nazwisko, 
	concat(
		'Jest zatrudniony od ',
		DATEDIFF(year, data_zatr, getdate()),
		' lat.'
	) as 'liczba lat'
from pracownicy

-- 22. Provide the employee number, first name, last name, and employment date in the format dd-mm-yyyy.
select 
	nr_pracownika, 
	imie, 
	nazwisko, 
	convert(varchar, data_zatr, 105) as 'data zatrudnienia'
from pracownicy

-- 23. Provide the employee numbers and the number of rentals made by each of them.
select 
	nr_pracow_wyp,
	count(*) as 'ilosc wypozyczen'
from wypozyczenia
group by nr_pracow_wyp

-- 24. Provide the employee numbers, last names, first names, and the number of rentals made by each of them.
select 
	nr_pracownika,
	nazwisko,
	imie,
	count(*) as 'ilosc wypozyczen'
from wypozyczenia w
inner join pracownicy p on nr_pracow_wyp = p.nr_pracownika
group by nr_pracownika, nazwisko, imie

-- 26. Provide cars (number, brand, type, color, engine capacity, and number of rentals) that have never been rented.
select 
	s.nr_samochodu,
	marka,
	typ,
	kolor,
	poj_silnika,
	count(nr_wypożyczenia) as 'ilosc wypozyczen'
from samochody s
left outer join wypozyczenia w on s.nr_samochodu = w.nr_samochodu
where w.nr_wypożyczenia is null
group by s.nr_samochodu,
	marka,
	typ,
	kolor,
	poj_silnika

-- 27. Provide the first and last names of customers and employees whose last names end with 'ski'.
-- The query result may contain duplicate rows (e.g., a customer and employee might share the same name).
-- Sort the data by last name.
select 
	imie, 
	nazwisko
from klienci
where nazwisko like '%ski'
union all
select
	imie,
	nazwisko
from pracownicy
where nazwisko like '%ski'
order by nazwisko

-- 28. Select the data for employees (first name, last name, department, position, and salary) who earn more than the average salary in the company.
-- Hint: Use a subquery.
select 
	imie,
	nazwisko,
	stanowisko,
	dzial,
	pensja
from pracownicy
where pensja > (select avg(pensja) from pracownicy)

-- Provide cars (number, brand, and type) that have never been rented by any customer.


-- Select data for employees (first name, last name, job position, department, and salary) for employees who earn more than the average salary in each department.


-- Select data for employees (first name, last name, job position, department, and salary) for employees whose salary is higher than the lowest average salary in each department.


-- Create a view that contains first name, last name, company name, NIP (Tax Identification Number), and city for customers who own a company.
-- After creating the view, display all the data from the view.


-- Insert one sample record into the cars table in the Car Rental database.


-- Delete information about all cars in the Car Rental database whose brand names start with the letter 'F'.


-- For all employees who do not receive a salary bonus, increase their salary by 10%.


-- Using Transact-SQL commands DECLARE and PRINT, provide the number of Mercedes cars available in the rental.
-- The response should have the form:
-- "There are X Mercedes cars in the rental," where X is the number of Mercedes, returned by the query.


-- Using Transact-SQL commands, create a query that checks the salary levels in the rental.
-- If the average salary in the company is less than 1600, print the message: "Salaries are too low!".
-- If the average salary is higher, print: "Salaries are okay."
-- Hint: Use the IF...ELSE block.


-- Using Transact-SQL commands, create a query that provides the number of cars rented by the customer with ID = 6.

--     If the customer rented one car (or more), print the message:
--     "The customer with the given ID rented X cars," where X is the number of cars rented.
--     If the customer did not rent any cars, the message should be:
--     "The customer with the given ID rented nothing!"
--     Hint: Use the IF EXISTS expression.


-- Using Transact-SQL commands, create a query that displays first name, last name, job position, and salary for each employee.
-- Note: In the salary field, instead of the amount in numbers, display text:

--     Low salary (if the salary is less than 1500),
--     Medium salary (for salaries between 1500 and 2000 inclusive),
--     High salary (for salaries greater than 2000).
--     Hint: Use the CASE expression.
    