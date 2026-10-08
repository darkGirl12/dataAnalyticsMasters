select e.last_name  from employees e where e.salary  > 15000

--to join strings
select e.last_name || ','|| e.first_name as "FullName" from employees e where e.first_name like 'K%'
--sorting
order by e.first_name 

select C.country_name, c.country_id  from countries c where c.country_id in ('PT', 'ES', 'CH', 'IL', 'UK') order by c.country_id 

--to count the number of rows or columns
select count(*) from employees e group by e.department_id 

select e.department_id, count(e.employee_id ), sum(e.salary) from employees e group by e.department_id order by e.department_id 

--natural join
select e.employee_id, e.first_name, e.last_name, d.department_name from employees e natural join departments d 