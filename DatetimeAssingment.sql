#wrote the quwry to dsiplay first day of the month

select subdate( adddate(curdate(), interval 1 day), interval day(curdate()) day);

#write the query to display last day of the month
select subdate( adddate(curdate(), interval 1 month), interval day(curdate()) day);

#write the query to display last day of the year	

select extract(year from curdate());

select makedate(extract(year from curdate()),1);

use testcoursedb;

select d.DEPARTMENT_NAME, e.FIRST_NAME, e.SALARY
from employees;


