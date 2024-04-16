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
    