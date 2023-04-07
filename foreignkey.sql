use product;

create table supplier(
sid int,
firstname varchar(30) not null,
lastname varchar(30),
phoneno bigint not null,
email varchar(50),
primary key(sid) 
);

desc supplier;

desc item;

alter table item
add column sid int;

delete from supplier
where sid=105;

use studentdb;
select * from student;

select * from course;

alter table student
add foreign key (cid) references course(cid);

alter table coursefaculty
add column cid int;

alter table coursefaculty
add foreign key (cid) references course(cid);

alter table coursefaculty
add column facultyId int;

alter table coursefaculty
add foreign key(facultyId) references coursefaculty(facultyId);

alter table coursefaculty
drop foreign key coursefaculty_ibfk_2;

alter table coursefaculty
add constraint fk_faculty
foreign key (facultyId) references faculty(facultyid);

delete from course
where cid=105;

alter table student
add constraint fk_course1
foreign key (cid) references course(cid)
on delete set null;
 
use employeemanagement; 
alter table employee
add foreign key (deptid) references department(deptid);