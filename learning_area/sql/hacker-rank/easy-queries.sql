-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA. 
-- LINK: https://www.hackerrank.com/challenges/revising-the-select-query/problem?isFullScreen=true

select * 
from city
where countrycode = 'USA' and population > 100000

-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA. 
-- LINK: https://www.hackerrank.com/challenges/revising-the-select-query-2/problem?isFullScreen=true
select name from city where population > 120000 and countrycode = 'USA';


-- Query all columns (attributes) for every row in the CITY table.
-- LINK: https://www.hackerrank.com/challenges/select-all-sql/problem?isFullScreen=true
select *
from city

-- Query all columns for a city in CITY with the ID 1661.
-- LINK: https://www.hackerrank.com/challenges/select-by-id/problem?isFullScreen=true
select *
from city
where id=1661

-- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN. 
-- LINK: https://www.hackerrank.com/challenges/japanese-cities-attributes/problem?isFullScreen=true
select * 
from city
where countrycode = 'JPN'

-- Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN. 
-- LINK: https://www.hackerrank.com/challenges/japanese-cities-name/problem?isFullScreen=true
select name
from city
where countrycode = 'JPN'

-- Query a list of CITY and STATE from the STATION table. 
-- LINK: https://www.hackerrank.com/challenges/weather-observation-station-1/problem?isFullScreen=true
select city, state
from station

-- Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer. 
-- LINK: https://www.hackerrank.com/challenges/weather-observation-station-3/problem?isFullScreen=true
select distinct city
from station
where id % 2 = 0

-- Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table. 
-- LINK: https://www.hackerrank.com/challenges/weather-observation-station-4/problem?isFullScreen=true
select count(city) - count(distinct city)
from station

-- Query the Name of any student in STUDENTS who scored higher than Marks. Order your output by the last three characters of each name. 
-- If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
-- LINK: https://www.hackerrank.com/challenges/more-than-75-marks/problem?isFullScreen=true
-- todo
select name
from students
where marks > 75
order by 
    right(name, 3),
    id

-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
-- LINK: https://www.hackerrank.com/challenges/name-of-employees/problem?isFullScreen=true
select name
from employee
order by name

-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than per month 
-- who have been employees for less than months. Sort your result by ascending employee_id.
-- LINK: https://www.hackerrank.com/challenges/salary-of-employees/problem?isFullScreen=true
select name
from employee
where salary > 2000 and months < 10
order by employee_id

-- Query the difference between the maximum and minimum populations in CITY.
-- LINK: https://www.hackerrank.com/challenges/population-density-difference/problem?isFullScreen=true
select max(population) - min(population)
from city

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, [...]
-- Write a query calculating the amount of error and round it up to the next integer.
-- LINK: https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true
-- todo
select 
    ceil(avg(salary) - avg(replace(salary, '0', '')))
from employees

-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
-- LINK: https://www.hackerrank.com/challenges/weather-observation-station-6/problem?isFullScreen=true
-- todo
select distinct city
from station
where left(city, 1) in ('A', 'E', 'I', 'O', 'U')


-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
-- LINK: https://www.hackerrank.com/challenges/weather-observation-station-7/problem?isFullScreen=true
select distinct city
from station
where right(city, 1) in ('a', 'e', 'i', 'o', 'u')

-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
-- LINK: https://www.hackerrank.com/challenges/weather-observation-station-9/problem?isFullScreen=true
select distinct city
from station
where left(city, 1) not in ('A', 'E', 'I', 'O', 'U')

-- Query the following two values from the STATION table: [..]
-- LINK: https://www.hackerrank.com/challenges/weather-observation-station-2/problem?isFullScreen=true
select 
    round(sum(LAT_N),2),
    round(sum(LONG_W),2)
from station

-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than ...
-- LINK: https://www.hackerrank.com/challenges/weather-observation-station-13/problem?isFullScreen=true
select 
    round(sum(LAT_N),4)
from station
where LAT_N < 137.2345 and LAT_N > 38.7880

-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than ...
-- LINK: https://www.hackerrank.com/challenges/weather-observation-station-14/problem?isFullScreen=true
select 
    round(max(LAT_N),4)
from station
where LAT_N < 137.2345 

-- Query a count of the number of cities in CITY having a Population larger than 100k. 
-- LINK: https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem?isFullScreen=true
select count(id)
from city
where population > 100000

-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths 
-- LINK: https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true
-- todo
(select 
    city,
    length(city) as len
from station
order by 
    len,
    city
limit 1)
union 
(select 
    city,
    length(city) as len
from station
order by 
    len desc,
    city
limit 1)

-- Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.778. Round your answer to 4 decimal places.
-- LINK: https://www.hackerrank.com/challenges/weather-observation-station-17/problem?isFullScreen=true
select round(LONG_W, 4)
from station
where LAT_N > 38.778
order by LAT_N
limit 1

-- Query the Manhattan Distance between points p1 and p2 and round it to a scale of 4 decimal places.
-- LINK: https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true
-- todo
select 
    round(abs(min(LAT_N) - max(LAT_N)) + abs(min(LONG_W) - max(LONG_W)), 4)
from station

-- 
-- LINK:

-- 
-- LINK:

-- 
-- LINK:

-- 
-- LINK: