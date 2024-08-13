-- GROUP BY CLAUSE

select * from employee_demographics;

select gender from employee_demographics
group by gender;

-- Counting number of males and females
select gender, count(gender) from employee_demographics
group by gender;

-- Finding average age of males and females
select gender, avg(age) from employee_demographics
group by gender;


-- We can group two column also at same time
select occupation from employee_salary
group by occupation;

select occupation,salary from employee_salary
group by occupation, salary;

-- Finding Max age for male and female
select gender, avg(age), max(age) from employee_demographics
group by gender;

-- Finding Min age for male and female
select gender, avg(age), min(age) from employee_demographics
group by gender;



-- ORDER BY CLAUSE (ASC DESC)
select * from employee_demographics
order by gender;

select * from employee_demographics
order by first_name desc;

select * from employee_demographics
order by gender, age;










