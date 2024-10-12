-- New Companies
-- LINK: https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true
-- #TODO
select 
    c.company_code,
    founder,
    count(distinct lm.lead_manager_code) as n_lm,
    count(distinct sm.senior_manager_code) as n_sm,
    count(distinct m.manager_code) as n_m,
    count(distinct e.employee_code) as n_e
from company c
join lead_manager lm on c.company_code = lm.company_code
join senior_manager sm 
    on lm.lead_manager_code = sm.lead_manager_code and c.company_code = sm.company_code
join manager m 
    on sm.senior_manager_code = m.senior_manager_code and m.lead_manager_code = lm.lead_manager_code
    and c.company_code = m.company_code
join employee e
    on e.manager_code = m.manager_code and e.senior_manager_code = sm.senior_manager_code 
    and e.lead_manager_code = lm.lead_manager_code and e.company_code = c.company_code
group by c.company_code, founder


-- 
-- LINK: 