-- @@@ == do it again



-- 1. Recyclable and Low Fat Products - https://leetcode.com/problems/recyclable-and-low-fat-products/?envType=study-plan-v2&envId=top-sql-50
select product_id from products
    where low_fats = "Y" and recyclable = "Y";

-- 2. Find Customer Referee - https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan-v2&envId=top-sql-50
-- @@@
select name 
    from Customer
    where not referee_id = 2 or referee_id is null
    order by name desc;

-- 3.  Big Countries - https://leetcode.com/problems/big-countries/description/?envType=study-plan-v2&envId=top-sql-50
select name, population, area 
    from world
    where area >= 3000000 or population >= 25000000
    order by name;

-- 4. Article Views I -  https://leetcode.com/problems/article-views-i/description/?envType=study-plan-v2&envId=top-sql-50
select distinct author_id as id
    from Views
    where author_id = viewer_id
    order by id;

-- 5. Invalid Tweets - https://leetcode.com/problems/invalid-tweets/description/?envType=study-plan-v2&envId=top-sql-50
select tweet_id
    from tweets
    where length(content) > 15;

-- Basic Joins
-- 1. Replace Employee ID With The Unique Identifier - https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description/?envType=study-plan-v2&envId=top-sql-50
-- @@@
select EmployeeUNI.unique_id, name
    from Employees
    left join EmployeeUNI on Employees.id = EmployeeUNI.id;

-- 2. Product Sales Analysis I - https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50
select p.product_name, year, price
    from sales
    left join product as p on sales.product_id = p.product_id
    order by p.product_name