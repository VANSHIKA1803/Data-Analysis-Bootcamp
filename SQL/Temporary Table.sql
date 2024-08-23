-- Temporary Table

create temporary table temp(
first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

insert into temp values('Deepak', 'Tiwari','Avenger - End Game');

select * from temp;


-- Creating a sub table of employee_salary table using temporary table function
create temporary table salary_over_50k(
select * from employee_salary
where salary >= 50000);

select * from salary_over_50k;



