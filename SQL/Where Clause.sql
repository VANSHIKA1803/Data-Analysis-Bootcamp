-- WHERE CLAUSE

select * from employee_salary;


-- Find employee name leslie
select * from employee_demographics
where first_name = 'Leslie';



-- Find employees having salary greater than 50000
select * from employee_salary
where salary > 50000;



-- Find all male employees
select * from employee_demographics
where gender = 'Male';
-- alternate 
select * from employee_demographics
where gender != 'Female';



-- Logical Operators AND OR NOT
select * from employee_demographics
where birth_date > '1985-01-01' and gender = 'Male';

select * from employee_demographics
where (first_name = 'Leslie' and age = 44) or age > 50;


-- Like Statemets
select * from employee_demographics
where first_name like '%jer%';

select * from employee_demographics
where first_name like 'a___';

select * from employee_demographics
where first_name like 'a____';

select * from employee_demographics
where first_name like 'a___%';

select * from employee_demographics
where birth_date like '1989%';