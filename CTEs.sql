-- Common Table Expression

select avg(avg_sal) from(
	select gender, avg(salary) as avg_sal, max(salary) as max_sal, min(salary) as min_sal, count(salary) as count_sal
    from employee_demographics as ed
    join employee_salary as es
    on ed.employee_id = es.employee_id
    group by gender) as example_subquery;
    
    
-- Solving this query with cte for more readability
with cte_example as 
(
select gender, avg(salary) as avg_sal, max(salary) as max_sal, min(salary) as min_sal, count(salary) as count_sal
    from employee_demographics as ed
    join employee_salary as es
    on ed.employee_id = es.employee_id
    group by gender
)
select avg(avg_sal) from cte_example;


-- Multiple cte function
with cte_example as 
(
select employee_id, gender, birth_date
    from employee_demographics
    where birth_date > '1985-01-01'
),
cte_example2 as 
(
select employee_id, salary
    from employee_salary
    where salary > 50000
)
select * from cte_example
join cte_example2
on cte_example.employee_id = cte_example2.employee_id;

