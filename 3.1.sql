select company_name, e.first_name, e.last_name
from customers c
join orders o  on c.customer_id = o.customer_id
join employees e on o.employee_id = e.employee_id
where c.city = 'London' and o.ship_via = 1;

select product_name, units_in_stock, s.contact_name, s.phone
from products p 
join suppliers s on p.supplier_id = s.supplier_id
join categories c on p.category_id = c.category_id
where (c.category_id = 1 or c.category_id = 8) and discontinued != 1 and units_in_stock < 20;

select contact_name, order_id
from customers c 
left join orders o on c.customer_id = o.customer_id
where order_id is null;

select contact_name, order_id
from orders o
right join customers c on o.customer_id = c.customer_id
where order_id is NULL