-- Show the category_name and description from the categories table sorted by category_name.
SELECT 
	category_name,
    description
FROM categories
order by category_name

-- Show all the contact_name, address, city of all customers which are not from 'Germany', 'Mexico', 'Spain'
select 
	contact_name,
    address,
    city
from customers
where country not in ('Germany', 'Mexico', 'Spain')

-- Show order_date, shipped_date, customer_id, Freight of all orders placed on 2018 Feb 26
select 
	order_date,
    shipped_date,
    customer_id,
    freight
from orders
where order_date = '2018-02-26'

-- Show the employee_id, order_id, customer_id, required_date, shipped_date from all orders shipped later than the required date
select
	employee_id,
    order_id,
    customer_id,
    required_date,
    shipped_date
from orders
where shipped_date > required_date

-- Show all the even numbered Order_id from the orders table
select order_id
from orders
where order_id % 2 = 0

-- Show the city, company_name, contact_name of all customers from cities which contains the letter 'L' in the city name, sorted by contact_name
-- TODO
select 
	city,
    company_name,
    contact_name
from customers
where city like '%l%'
order by contact_name

-- Show the company_name, contact_name, fax number of all customers that has a fax number. (not null)
select 
	company_name,
    contact_name,
    fax
from customers
where fax not null

-- Show the first_name, last_name. hire_date of the most recently hired employee.
-- TODO
select 
	first_name,
    last_name,
    max(hire_date)
from employees

-- Show the ProductName, CompanyName, CategoryName from the products, suppliers, and categories table
select product_name, s.company_name, c.category_name
from products as p
join suppliers s on s.supplier_id = p.supplier_id
join categories c on c.category_id = p.category_id

-- Show the category_name and the average product unit price for each category rounded to 2 decimal places.
select category_name, Round(avg(unit_price), 2) as rounded_unit_price
from products p
join categories c on p.category_id = c.category_id
group by category_name