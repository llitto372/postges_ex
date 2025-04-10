CREATE TABLE teacher 
(
	teacher_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar,
	title varchar
);

alter table teacher 
ADD COLUMN middle_name varchar;

alter table teacher
drop column middle_name;

alter table teacher
rename birthday to birth_date;

alter table teacher
alter column phone set data type varchar(32);

create table exam 
(
	exam_id serial,
	exam_name varchar(54),
	exame_date date
);

insert into exam (exam_name, exame_date)
values
('math', '2025-06-23'),
('russian', '2025-06-21'),
('geography', '2025-05-31');

select * from exam;

truncate table exam restart identity;