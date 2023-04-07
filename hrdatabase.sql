create database hrdatabase;

use hrdatabase;

select * from employees;
select * from countries;
select * from departments;
select * from jobs;
select * from locations;
select * from regions;

create table employees(
	Employee_id int not null primary key,
    First_name varchar(20) not null,
    Last_name varchar(25) not null,
    Email varchar(25) not null,
    Phone_no varchar(20) not null,
    Hire_date date not null,
    Job_id varchar(10),
    Salary int not null,
    Commission_pct int not null,
    Manager_id int not null,
    Department_id int not null);

create table locations(
	Location_id int not null primary key,
    Street_address varchar(25) not null,
    postal_code varchar(12) not null,
    City varchar(30) not null,
    State_province varchar(12)not null,
    Country_id varchar(2) not null);

create table departments(
	Department_id int not null,
    Department_name varchar(30),
    Manager_id int not null,
    location_id int not null);
    
create table jobs(
	job_id int not null primary key,
    job_name varchar(30) not null,
    Min_salary int not null,
    Max_salary int not null);
    
create table countries(
	Country_id int not null,
    Country_name varchar(40),
    Region_id int not null);
    
create table regions(
	Region_id int not null,
    Region_Name varchar(25) not null);

alter table employees
add foreign key (Department_id) references departments(Department_id);

alter table employees
add foreign key (Job_id) references jobs (Job_id);

alter table departments
add foreign key (Location_id) references locations(Location_id);

alter table locations
add foreign key (country_id) references countries(Country_id);

alter table countries
add foreign key (Region_id) references countries(regions);

#Write a query to find the names (first_name, last_name) and the salaries of the employees who have a higher salary than the employee whose last_name='Bull'.    

select First_name,Lastname
from employees
where Course_id in(select Course_id
				   from jobs where salary>( select Last_name 
										   from employees
                                           where Last_name);
                   
#Write a query to find the names (first_name, last_name) of all employees who works in the IT department.

select First_name,Last_name
from employees
where Department_id in (select Department_name
						from departments
						where Department_name="IT");
                        
select First_name,Last_name
from employees 
where Job_id in (select Job_name
				from jobs
                where Job_name="manager");
 
 #Write a query to find the names (first_name, last_name),
 #the salary of the employees whose salary is greater than the average salary.

select First_name,Last_name
from employees
where Job_id in( select Max_salary
				from jobs
                where Max_salary>(select avg(Max_salary)
									from jobs));
                                    
#Write a query to find the names (first_name, last_name), the salary of the employees 
#who earn more than the average salary and who works in any of the IT departments.

select First_name, Last_name
from employee
where salary>(salary avg(salary)
				from employees)
                where
                                    
#Write a query to find the names (first_name, last_name), 
#the salary of the employees who earn the same salary as the minimum salary for all departments.



SELECT first_name, last_name, salary 
FROM employees 
WHERE salary > (SELECT MAX(salary) FROM employees WHERE job_id = 'SH_CLERK')
ORDER BY salary ASC;