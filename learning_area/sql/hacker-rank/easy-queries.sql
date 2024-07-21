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

-- 
-- LINK: 

-- 
-- LINK: 

-- 
-- LINK: 