insert into customers(customer_id, contact_name, city, country, company_name)
values 
('AAAAA', 'Alfred Mann', NULL, 'USA', 'fake_company'),
('BBBBB', 'Alfred Mann', NULL, 'Austria','fake_company');

select contact_name, city, country
from customers c 
order by contact_name, 
	case when city is null then country
	else city
	end;

select product_name, unit_price, 
	case when unit_price >= 100 then 'too expensive'
	when unit_price >= 50 and unit_price < 100 then 'average'
	else 'low price'
	end as price_tag
from products p;

select c.customer_id, 
	case when order_id is null then 'no orders'
	else 'have orders'
	end as order_status
from customers c
join orders o on c.customer_id = o.customer_id 
where order_id is null;

select last_name, first_name, coalesce (nullif(title, 'Sales Representative'), 'Sales Stuff') as title
from employees;
