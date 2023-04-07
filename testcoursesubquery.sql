
# namesof employee whoose salary is greater than average salary of all employee

use testcoursedb;
select first_name, last_name
from employees
where salary>(select avg(salary)
			 from employees);		
             
# names of employee whose salary is equal to the min of job_id
use testcoursedb;
select * from employees;
select * from jobs;
select e.*
from employees e join jobs j
on e.job_id=j.job_id and j.MIN_SALARY>10000;

select e.*
from employees e join jobs j
on e.job_id=j.job_title and j.MIN_SALARY>10000;

#1. Write a query to find the addresses 
#(location_id, street_address, city, state_province, country_name) of all the departments.

select location_id,street_address,city,state_province,country_name
from locations  natural join countries ;


#2.Write a query to find the names (first_name, last name), 
#department ID and name of all the employees.

select first_name,last_name
from employees e join departments d
on e.department_id=d.department_id;
select  first_name, last_name, department_id
from employees 
join departments using (department_id);



#3. Find the names (first_name, last_name), job, department number,
# and department name of the employees who work in London.

select e.first_name,e.last_name ,e.job_id,e.department_id,d.department_name 
from employees e  join departments d join locations l
on e.department_id= d.department_id and  d.location_id=l.location_id  and l.city="london";

#4. Write a query to find the employee id, name (last_name) 
#along with their manager_id, manager name (last_name).

select  e1.employee_id  'Employee_id',e1.last_name  'Employee',e2.employee_id ,'Manager_id',e2.last_name 'Manager'
from employees e1 join employees e2
on e1.manager_id=e2.employee_id ;

#5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'.

select e1.first_name,e1.last_name,e2.hire_date
from employees e1 join employees e2
on e1.hire_date > e2.hire_date and e2.last_name="jones"; 



#6. Write a query to get the department name and number of employees in the department.

SELECT department_name AS 'Department Name', 
COUNT(*) AS 'No of Employees' 
FROM departments 
INNER JOIN employees 
ON employees.department_id = departments.department_id 
GROUP BY departments.department_id, department_name 
ORDER BY department_name;


#7. Find the employee ID, job title, number of days 
#between ending date and starting date for all jobs in department 90 from job history.

select jh.employee_id,j.job_title,jh.end_date -jh.start_date as 'NumberOfDays'
from job_history jh natural join jobs j 
where jh.department_id=90;

#8. Write a query to display the department ID, department name and manager first name.

select d.department_id,d.department_name,e.first_name
from departments d  join employees e
on (d.manager_id = e.employee_id);


#9. Write a query to display the department name, manager name, and city.

select d.department_name ,e.first_name,l.city
from departments d join employees e 
on d.manager_id=e.employee_id
join locations l using( location_id);

#10. Write a query to display the job title and average salary of employees.
select job_title,avg(salary)
from employees  natural join jobs
group by job_title;


#11. Display job title, employee name, and the difference between 
#salary of the employee and minimum salary for the job.
select e.first_name, j.job_title,salary-min_salary as 'difference'
from employees e natural join jobs j;


#12. Write a query to display the job history that 
#were done by any employee who is currently drawing more than 10000 of salary
select jh.*
from job_history jh join employees e
on jh.employee_id=e.employee_id
where salary>10000;

#Write a query to find the names (first_name, last_name) and salary of
 #the employees who earn a salary that is higher than the salary of all 
 #the Shipping Clerk (JOB_ID = 'SH_CLERK'). 
#Sort the results of the salary of the lowest to highest.

SELECT first_name, last_name, salary 
FROM employees 
WHERE salary > (SELECT MAX(salary) FROM employees WHERE job_id = 'SH_CLERK')
ORDER BY salary ASC;

select distinct salary
from employees e1
where 4=( select count(distinct(salary))
		from employees e2
        where e1.salary=e2.salary);
        
select distinct salary
from employees 
order by salary desc
limit 3;

select min(salary) from
(select distinct(salary) from employees
order by salary desc
limit 3) as thirdhighest;