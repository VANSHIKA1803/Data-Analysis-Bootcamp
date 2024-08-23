-- LIMIT and ALIASING

select * from employee_demographics 
limit 3;

select * from employee_demographics 
order by age desc
limit 3;


-- finding top 2 aged people after skipping one
select * from employee_demographics 
order by age desc
limit 1,2;


-- finding top aged person after skipping two person
select * from employee_demographics 
order by age desc
limit 2,1;


-- ALIASING

select gender, avg(age) as avg_age
from employee_demographics
group by gender
having avg(age) > 40;















