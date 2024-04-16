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
