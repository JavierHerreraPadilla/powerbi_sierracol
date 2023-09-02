use book_shop;
-- CONSTRAINS AND ALTER TABLE
CREATE TABLE contacts(
	name varchar(100) not null,
    phone varchar(15) not null unique
);
select * from contacts;
insert into contacts (name, phone) values ('Javier', '3053995918');
insert into contacts (name, phone) values ('timmy', '3053995918'); -- same phone returns error

-- CHECK constrains se puede poner cualquier condicion despues del check
create table parties(
	name varchar(50),
    age int check (age > 18) 
);

insert into parties (name, age) values ("Javier", 33);
insert into parties (name, age) values ("Javier", 15);

create table palindromos(
	word varchar(100) check(reverse(word) = word)
);
insert into palindromos (word) values ("racecar");
insert into palindromos (word) values ("ever");

-- custom error messege 
create table partiers2 (
	name varchar(50),
    age int,
    constraint name_lenth_5 check (char_length(name)>=5), -- named constrain 
    constraint age_over_18 check (age>18) -- named constrain 
);
insert into partiers2 (name, age) values ("Jav", 19); 
select * from partiers2;

-- multiple columns check
create table companies (
	id int primary key auto_increment,
    name varchar(50) not null,
    phone varchar(15) not null unique,
    address varchar(255) not null,
    constraint name_adress UNIQUE (name, address) -- name alone is not unique, address alone is not unique, but both combined need to be unique
);

insert into companies (name, phone, address) values ("Javier Co", "3053995918", "cra 96b");
insert into companies (name, phone, address) values ("Javier Co", "30539959120", "cra 96b");
select * from companies;

-- ALTER TABLE
-- add column
alter table companies add column city varchar(25);
alter table companies add column employee_count tinyint not null; -- pone de default 0 since cant be null, se le puede poner un default a las filas que ya existen 
 
-- drop columns
alter table companies drop column city;

-- renaming table and columns
    -- rename table companies to suppliers;
alter table companies RENAME COLUMN name to company;

-- modify change the parameters of the column 
alter table companies modify company varchar(100) default "unknown";

-- alter constraints
alter table companies add constraint name_lenght check (char_length(company)>3);
insert into companies(company, phone, address, employee_count) values ("ab", "6462622", "125 memeory lane", 2);
alter table companies drop constraint name_lenght;










