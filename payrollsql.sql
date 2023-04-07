create database payroll;

use payroll;
desc department;

select * from department;

create table employee(
	empid int primary key,
    empname varchar(45),
    empdate date,
    empsal numeric(10,2));
    
desc employee;

insert into employee
values(1,"Gaurav","2023-01-10", 50000, 11);

insert into employee(empname,empsal, deptid, empdate, empid)
values("kavita", 60000,12, "2023-01-11", 2);

insert into employee() values(3, "shuruti", "2018-04-04", 26000, 13),
						   (4, "Lalit", "2020-05-03", 17000, 14),
						   (5, "Neha", "2020-05-01", 15000, 14);
                           
insert into employee values(60,"sakdhi", "2018-03=04", 25000, 3),
						   (7,"Laulya", "2010-03-03", 67000, 14),
                           (8, "Neesha", "2012-04--01", 55000, 14);

select * from employee;
                           
update employee 
set empsal=80000 WHERE empid=1;
                           
update employee 
set empname="sawan" WHERE empid=1;

update employee
set empsal= 65000 where empsal=60000;

delete from employee
where empname like 's%';

select empid, empname, empsal from employee where empsal > 15000 and empsal<=50000;

select empid, empname, empsal from employee where empsal between 15000 and 50000;

select empid, empname, empsal from employee where empsal not between 15000 and 50000;

select empid, empname, empsal from employee where empid=7 or empid= 8;

select * from employee where empdate is null;

select * from employee where empdate is not null;


#order by
select * from employee order by empsal desc;

select * from employee order by empsal asc;

#limit

select * from employee order by empsal desc, empid;

select * from employee order by empsal desc limit 3;

select distinct(deptid) from employee; 

select count(*) from employee;
select count(empid) from employee;
select count(empdate) from employee;
select count(distinct(empid)) from employee;

select avg(empsal) as 'Average salary',
		max(empsal) as 'maximum salary',
        min(empsal) as 'minimum salary',
        sum(empsal) as 'total salary' from employee;
        
#group by clause
select deptid as department, sum(empsal) as 'total salary expenses' 
from employee 
group by deptid;

