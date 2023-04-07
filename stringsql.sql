#String funs415258588888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888868554555455tion
select length("java");

select concat("Rohit", "Khomane");

#check index
select instr("java", "a" );

#return substring(start, length)
select substring("hello",3,4);

select substring("programming", 3,4);

select substring("programming", -3,2);

select length(concat("rohit","Khomane"));

select ascii("t");

select format(1.581, "Percent");

select upper("java");

select lower("program");

select repeat("java", 4);

use testcoursedb;
select * from employees;

update employees
set email= concat(email, @gamil.com);

select department_id, group_contact(first_name, "") as EmployeeNames
from employees
group by department_id;

select find_in_set("Delhi","Delhi,Mumbai,Chennai");
