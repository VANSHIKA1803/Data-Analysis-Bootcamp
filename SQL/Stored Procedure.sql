-- Stored Procedure

select * from employee_salary
where salary >= 50000;

create procedure large_salaries()
select * from employee_salary
where salary >= 50000
;

call large_salaries();


-- creating another procedure with 2 queries
delimiter $$
create procedure large_salaries2()
begin
	select * from employee_salary
	where salary >= 50000;
    select * from employee_salary
	where salary >= 10000;
end $$
delimiter ;

call large_salaries2();


-- Finding a particular cell from data
delimiter $$
create procedure large_salaries3(emp_id int)
begin
	select salary from employee_salary
	where employee_id = emp_id;
end $$
delimiter ;

call large_salaries3(1);












