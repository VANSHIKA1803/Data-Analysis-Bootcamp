-- JOINS in SQL

-- INNER JOIN

select * from employee_demographics;

select * from employee_salary;

select * from employee_demographics as ed
inner join employee_salary as es
on ed.employee_id = es.employee_id;

-- OUTER JOIN
-- LEFT JOIN

select * from employee_demographics as ed
left join employee_salary as es
on ed.employee_id = es.employee_id;

-- RIGHT JOIN
select * from employee_demographics as ed
right join employee_salary as es
on ed.employee_id = es.employee_id;

-- FULL JOIN
select * from employee_demographics as ed
left join employee_salary as es
on ed.employee_id = es.employee_id
union
select * from employee_demographics as ed
right join employee_salary as es
on ed.employee_id = es.employee_id;


-- Other Important joins
-- SELF JOIN

select * from employee_demographics as ed
join employee_salary as es
on ed.employee_id = es.employee_id;

select * from employee_demographics as ed
join employee_salary as es
on ed.employee_id + 1 = es.employee_id;


select ed.employee_id as emp_santa,
ed.first_name as first_name_santa,
ed.last_name as last_name_santa,
es.employee_id as emp_id,
es.first_name as first_name_emp,
es.last_name as last_name_emp
from employee_demographics as ed
join employee_salary as es
on ed.employee_id + 1 = es.employee_id;

-- Joining Multiple Tables Together
select * from employee_demographics as ed
inner join employee_salary as es
on ed.employee_id = es.employee_id
inner join parks_departments as pd
on es.dept_id = pd.department_id;
















