-- create table temporary_firstname_lastname (
-- nr_id int not null IDENTITY CONSTRAINT pk_tymczasowa PRIMARY KEY,
-- imię varchar(20),
-- nazwisko varchar(20),
-- ulica varchar(24),
-- numer char(8),
-- miasto varchar(24),
-- kod char(6)
-- )


-- 14. Add three new records to the table temporary_firstname_lastname for the following individuals:
--      - Jerzy Kowalik
--      - Zuzanna Jarecka from Poznań
--      - Marek Gwoźnicki, residing in Warsaw 00-100, at 12 Lemberta Street.

insert into tymczasowa_kl_bo values ('Jerzy', 'Kowalik', null, null, null, null)
insert into tymczasowa_kl_bo values ('Zuzanna', 'Jarecka', null, null, 'Poznań', null)
insert into tymczasowa_kl_bo values ('Marek', 'Gwoźnicki', 'Lamberta', 12, 'Warszawa', '00-100')

-- 15. Add first names, last names, and cities to the table temporary_firstname_lastname for all customers whose 
-- last name has the letter "o" as the second character.

insert into tymczasowa_kl_bo(imię, nazwisko, ulica, numer, miasto, kod)
select imie, nazwisko, ulica, numer, miasto, kod 
from klienci
where nazwisko like '_o%'

-- 16. Delete all data from the table cars_firstname_lastname (delete the data, not the table). 

delete from samochody_kl_bo

-- 17. Delete all customers living in cities whose names start with "W" (table customers_firstname_lastname). 

delete from klienci_kl_bo
where miasto like 'W%'

-- 18. Increase the salary by 10% for all employees who do not receive a salary allowance. 