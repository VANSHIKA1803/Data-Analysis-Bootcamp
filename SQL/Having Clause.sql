-- HAVING CLAUSE 
-- (Same as where clause but having is used when we use the group by clause and perform some aggregate function)

select gender, avg(age) from employee_demographics
group by gender
having avg(age) > 40;


select occupation, avg(salary) from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 75000;
  