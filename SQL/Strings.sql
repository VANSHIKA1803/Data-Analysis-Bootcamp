-- String Function in SQL

-- For getting length of string
select length('Skyfall');

select first_name, length(first_name)
from employee_demographics
order by 2;

-- Changing into UpperCase and LowerCase
select upper('sky');
select lower('SKY');

select first_name, upper(first_name)
from employee_demographics;


-- Trimming spaces from Left and Right side of String
select ('           sky           ');
select trim('           sky           ');        -- Trimmed spaces from both sides

select ltrim('           sky           ');       -- Trimmed spaces from left side
select rtrim('           sky           ');       -- Trimmed spaces from right side


-- Substring from String
select first_name, left(first_name, 4)
from employee_demographics;

select first_name,
left(first_name, 4), 
right(first_name, 4)
from employee_demographics;


select first_name,
substring(first_name, 3,2)
from employee_demographics;


select first_name,
left(first_name, 4), 
right(first_name, 4),
substring(first_name, 3,2),
birth_date,
substring(birth_date, 6,2) as birth_month
from employee_demographics;


-- Replace 
select first_name, replace(first_name, 'a', 'z')
from employee_demographics;

-- Locate
select locate('e', 'Deepak');

select first_name, locate('An',first_name)
from employee_demographics;

-- Concatenation
select first_name, last_name,
concat(first_name,'  ', last_name) as full_name
from employee_demographics;
