create view orders_customers_employees as
select order_date, required_date, shipped_date, ship_postal_code, company_name, contact_name, phone, last_name, first_name, title 
from orders o 
join customers c on o.customer_id = c.customer_id
join employees e on o.employee_id = e.employee_id;

create or replace view orders_customers_employees as 
select order_date, required_date, shipped_date, ship_postal_code, company_name, contact_name, phone, last_name, first_name, title 
from orders o 
join customers c on o.customer_id = c.customer_id
join employees e on o.employee_id = e.employee_id
where order_date > '1997-01-01';

create view orders_employees_customers as
select order_date, required_date, shipped_date, ship_postal_code, ship_country, company_name, contact_name, phone, last_name, first_name, title
from orders o
join employees e on o.employee_id = e.employee_id
join customers c on o.customer_id = c.customer_id;

alter view orders_employees_customers rename to oec_old;

create or replace view orders_employees_customers as 
select order_date, required_date, shipped_date, ship_postal_code, company_name, contact_name, phone, last_name, first_name, title, ship_country, c.postal_code, reports_to
from orders o 
join customers c on o.customer_id = c.customer_id
join employees e on o.employee_id = e.employee_id
where order_date > '1997-01-01';

select * 
from orders_employees_customers oec 
order by ship_country ;

drop view oec_old;

create view active_products as
select *
from products
where discontinued = 0 
with local check option;

insert into active_products 
<<<<<<< HEAD
values (1123,	'PUSSY',	8,	1,	'10 boxes x 30 bags',	18.0,	39,	0,	10,	1);
=======
values (1123,	'ZHOPA',	8,	1,	'10 boxes x 30 bags',	18.0,	39,	0,	10,	1);
>>>>>>> 84c9510a5a1f6cfd58327ee1c6a24c0fa91c8777
