create database bikeshowroom;

use bikeshowroom;

select * from customer;
select * from feedback_rating;
select * from model;
select * from payment_mode;
select * from rating_id;

create table model(
model_id int not null,
model_name varchar(50) not null,
cost float not null);

select * from model;
insert into model(model_id,model_name,cost)
values(1, 'yamahamt', 168000),
	  (2, 'yamahar15', 194000),
      (3, 'hero_splender_plus', 74000),
      (4, 'royal_enfield_hunter',172000),
      (5, 'royal_enfiled_classic', 221000),
      (6, 'Honda_activa', 80000),
      (7, 'TVS_raider', 100000),
      (8, 'TVS_Apache', 125000),
      (9, 'Royal_Enfield_Bullet', 166000),
      (10, 'Bajaj_pulsor', 147000);
      
create table customer(
      cust_id int not null primary key,
      first_name varchar(30) not null,
      last_name varchar(30) not null,
      mobile_no bigint not null,
      gender varchar(30) not null);
      
select * from customer;      
insert into customer(cust_id,first_name,last_name,mobile_no,gender)
		values(11, "Gaurav", "Hulge", 0987654321, "male"),
			  (12, "Apurva", "Hulge", 9087654321, "female"),
              (13, "Kiran", "Hulge", 1234567890, "male"),
              (14, "Pawan", "Tagad", 2134567890, "male"),
              (15, "Nutan", "Tagad", 3214567890, "female");
              
create table purchase(
	  purchase_id int not null primary key,
      cust_id int,
      model_id int,
      booking_amount float not null,
      payment_id int,
      purchase_date date not null,
      rating_id int);

insert into purchase(purchase_id,cust_id,model_id,booking_amount,payment_id,purchase_date, rating_id)
		values(21, 11, 1, 54321, 31, "2023-01-10", 41),
			  (22, 12, 2, 54321, 32, "2023-01-11", 42),
              (23, 13, 7, 67890, 33, "2023-01-10", 43),
              (24, 14, 6, 71890, 31, "2023-01-12", 44),
              (25, 15, 5, 67890, 32, "2023-01-11", 45);
              
create table payment_mode(
	  payment_id int not null primary key,
      payment_type varchar(30) not null);
      
insert into payment_mode( payment_id, payment_type)
		values(31, "online"),
			  (32, "cash"),
              (33, "cheque");
              
create table feedback_rating(
		rating_id int not null,
        rating varchar(30) not null);
        
insert into feedback_rating(rating_id, rating)
		values(41, "excellent"),
			  (42, "good"),
              (43, "average"),
              (44, "bad"),
              (45, "complaint");


#1.	Add the column of email in customer
alter table customer add column(email varchar(25));
select * from customer;

#2.	Show the number of bikes sold of a particular model
select model_name,count(*) as NumberofBikes
from model
group by model_name;

#3.	Show the total cost of each model name
select model_name,sum(cost ) as Total_cost
from model
group by model_name;

#4.	Show the number of rating of each model for each rating type in decreasing order



#5.	Increase the cost of each bike by 10%
update model set cost= cost +(0.1*cost);
select * from model;

#6.	Show the purchases whose booking amount is greater than 20,000
select purchase_id from purchase where booking_amount > 20000;

#7..	Show the customer whose mobile no is not given
select  * from customer where mobile_no is null;

#8	Show the average cost of all the model name
select model_name ,avg(cost) as average_cost from model group by model_name;

alter table customer 
add column model_id int;

alter table model 
add column cust_id int;	

alter table model 
add column payment_id int;	

#jons


#show the name of customer who have purchase model id 2 
SELECT c.first_name, c.last_name
FROM customer c JOIN purchase p
ON c.cust_id = p.cust_id and p.model=2;



#show the number of customer who have purchased same model

select c.first_name, m.model_id, m.model_name
from customer c join purchase p join model m
on c.cust_id=p.cust_id and p.model_id= m.model_id
order by m.model_name;

#show the neames of the model model id who has the max rating
#show the name of the customers who have paid in online mode
#show the total amount paid by each payment mode
#show the models whoose bookingamount is greater than the booking amount of suyog
#show the no of models purchase by male and females
