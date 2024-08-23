-- Window Function

-- Here we are simply finding the average salary of each gender
select gender , avg(salary) as avg_salary
from employee_demographics as ed
join employee_salary as es
on ed.employee_id = es.employee_id
group by gender;

-- But here we are finding average salary of each gender with first name and last name but if we try to do this thing with group by then it wont happen and will give an error
select ed.first_name, ed.last_name, gender , avg(salary) over(partition by gender)
from employee_demographics as ed
join employee_salary as es
on ed.employee_id = es.employee_id;


-- Finding the sum of salary according to gender
select ed.first_name, ed.last_name, gender , sum(salary) over(partition by gender)
from employee_demographics as ed
join employee_salary as es
on ed.employee_id = es.employee_id;


-- Rolling total - will give the result in rolling way like by the sum will increase according by the adding of more salary
select ed.first_name, ed.last_name, gender , sum(salary) over(partition by gender order by ed.employee_id) as Rolling_Total
from employee_demographics as ed
join employee_salary as es
on ed.employee_id = es.employee_id;


-- Finding the total number of rows
select ed.employee_id, ed.first_name, ed.last_name, gender ,salary, 
row_number() over(partition by gender order by salary desc)
from employee_demographics as ed
join employee_salary as es
on ed.employee_id = es.employee_id;


-- Creating Rank according to salary
select ed.employee_id, ed.first_name, ed.last_name, gender ,salary, 
row_number() over(partition by gender order by salary desc),
rank() over(partition by gender order by salary desc) as rank_num
from employee_demographics as ed
join employee_salary as es
on ed.employee_id = es.employee_id;


-- Dense Rank - will continue the number after any number of repeatation of same rank
select ed.employee_id, ed.first_name, ed.last_name, gender ,salary, 
row_number() over(partition by gender order by salary desc),
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as dense_rank_num
from employee_demographics as ed
join employee_salary as es
on ed.employee_id = es.employee_id;














































