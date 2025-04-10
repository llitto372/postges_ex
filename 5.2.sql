drop table exam
create table exam
(
	exam_id serial NOT NULL,
	exam_name varchar,
	exam_date date,

	constraint PK_exam_exam_id PRIMARY KEY (exam_id)
);

alter table exam 
drop constraint PK_exam_exam_id;

alter table exam 
add constraint PK_exam_exam_id PRIMARY KEY (exam_id);

create table person 
(
person_id int,
first_name varchar,
last_name varchar,

constraint PK_person_person_id PRIMARY KEY (person_id)
);

create table passport 
(
passport_id int,
serial int NOT NULL,
reg varchar,
person_id int,

constraint PK_passport_passport_id PRIMARY KEY (passport_id),
constraint FK_passport_person FOREIGN KEY (person_id) REFERENCES person(person_id)
);

alter table book
ADD COLUMN weight int CHECK (weight > 0 and weight < 100);

insert into book (title, isbn, weight)
values ('my war', 1488, 101)
returning *;

create table student 
(
student_id serial,
full_name varchar,
stud_year int DEFAULT 1
);

insert into student (full_name)
values ('Adolf')
returning *;

alter table student
alter column stud_year drop default;

alter table products 
add constraint CHK_products_unit_price CHECK (unit_price > 0);

select MAX(product_id)
from products;

select * 
from products

create sequence count_id start with 77;

alter table products 
alter column product_id set default nextval('count_id');

insert into products (product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, discontinued)
VALUES ('Mocha', 12, 2, '2 kg', 30, 50, 1)
returning product_id;