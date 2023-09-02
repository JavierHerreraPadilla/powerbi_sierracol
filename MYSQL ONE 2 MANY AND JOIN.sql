-- RELATIONSHIP BASIS
-- one to one, one to many, many to many

-- ONE TO MANY RELATIONSHIP 1:MANY
-- customer and order
create database shop;
use shop;
create table customers(
	id INT primary key auto_increment,
    fname varchar(20),
    lname varchar(20),
    email varchar(20)
);

create table orders (
	id INT primary key auto_increment,
    order_date datetime,
    price decimal(8,2),
    customer_id INT not null,
    foreign key (customer_id) references customers(id) -- genera la relacion con customers
);

insert into customers (fname, lname, email) 
values ('boy', 'george', 'george@gmail.com'),
		('george', 'michael', 'gm@gmail.com'),
        ('david', 'bowie', 'db@gmail.com'),
        ('blue', 'steele', 'bs@aol.com'),
        ('bette', 'davis', 'bette@aol.com')
;

insert into orders (order_date, price, customer_id) 
values ('2017-11-11', 3.50, 1),
 ('2014-12-12', 800.67, 2),
 ('2015-01-03', 12.50, 5)
;
insert into orders (order_date, price, customer_id) 
values ('1999-04-11',450.21, 1);
-- order made by boy george
select * from orders where customer_id = (select id from customers where fname="boy" and lname="george");

-- inner joins
select * from customers
join orders
on orders.customer_id = customers.id;
-- se puede hacer el inner join en el orden que sea
select * from orders
join customers
on customers.id = orders.customer_id
;

-- inner joins with group by
select fname, lname, SUM(price) as total from customers 
join orders on orders.customer_id = customers.id group by customers.fname, customers.lname order by total;

-- left join
select fname, lname, order_date, price from customers
left join orders on orders.customer_id = customers.id; -- every customer is reprresented, if they dont have orders it shows NULL

-- left join en orden diferente
select fname, lname, order_date, price from orders
left join customers 
on orders.customer_id = customers.id;

select count(*) as order_null_count from (select fname, lname, order_date, price from customers
left join orders 
on orders.customer_id = customers.id where price is null) as result;
-- IFNULL function
select fname, lname, IFNULL(sum(price), 0) as money_spent from customers
left join orders on orders.customer_id = customers.id 
group by fname, lname; 


-- right join 
select fname, lname, order_date, price from customers
right join orders on orders.customer_id = customers.id;

select fname, lname, order_date, price from orders
right join customers on orders.customer_id = customers.id;

-- on delete cascade if you want to delete the orders from the customer if the customer is deleted from customers

-- new schema
create table students (
	id int primary key auto_increment,
    fname varchar(50)
);

create table papers (
	id int primary key auto_increment,
    title varchar(50) not null,
    grade tinyint,
    student_id int not null,
    foreign key (student_id) references students(id) -- genera la relacion con customers
);

insert into students (fname)
values ("caleb"), ("samantha"), ("raj"), ("carlos"), ("lisa");

insert into papers (student_id, title, grade)
values (1, "first", 60),
(1, "second", 75),
(2, "russian", 94),
(2, "montaigne", 98),
(4, "borges", 89)
;

select fname, title, grade from students
join papers on students.id = papers.student_id order by grade desc;

select fname, title, grade from students
left join papers on students.id = papers.student_id;  

select fname, IFNULL(title, "MISSING") as title, IFNULL(grade, 0) as grade from students
left join papers on students.id = papers.student_id;  

select fname, IFNULL(avg(grade), 0) as avg_grade from students
left join papers on students.id = papers.student_id group by fname order by avg_grade desc; 

select fname, IFNULL(avg(grade), 0) as avg_grade,
	case
		when IFNULL(avg(grade), 0) >= 75 then "passing"
        else "failing"
    end as pass_status
 from students
left join papers 
on students.id = papers.student_id group by fname order by avg_grade desc; 


