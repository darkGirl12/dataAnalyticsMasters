select d.* from dependents d where d.employee_id in
(select  e.employee_id from  employees e where e.first_name = 'Diana');

--example 2
--Note that you should use different aliases in the inner and outer queries because they work like two different queries
--because they are not correlated
select from employees em 
extract 
(select min(e.hire_date) from employees e);

--example 3: correlated
select d.department_name  from departments d where  not exists
(select * from employees e where e.department_id = d.department_id);

--example 4
select d.department_name from departments d where not exists 
(select e.first_name, e.last_name, count(dep.dependent_id) from employees e join dependents dep on e.employee_id = dep.employee_id 
where e.department_id = d.department_id 
group by e.employee_id 
having count (dep.dependent_id) > 2);

select e2.employee_id, e2.first_name, e2.last_name, e2.salary from employees e2 where e2.salary < all
(select min(e.salary) * 1.05 from employees e where e.department_id = e2.department_id);