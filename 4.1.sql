select product_name, units_in_stock
from products p 
where units_on_order < (select MIN(avg_quant)
from (
select AVG(quantity) as avg_quant
from order_details od 
group by product_id 
));

select customer_id, SUM(freight) as freight_sum
from orders 
where freight >= (select AVG(freight)
from orders 
where shipped_date >= '1996-07-15')
group by customer_id 
order by freight_sum;

select customer_id, ship_country, unit_price * quantity * (1 + discount) as order_price 
from orders
join order_details od using(order_id)
where order_date >= '1997-09-01' and (ship_country = 'Argentina' OR ship_country = 'Bolivia' OR ship_country = 'Brazil' OR ship_country = 'Chile' OR ship_country = 'Colombia' OR ship_country = 'Ecuador' OR ship_country = 'Guyana' OR ship_country = 'Paraguay' OR ship_country = 'Peru' OR ship_country = 'Suriname' OR ship_country = 'Uruguay' OR ship_country = 'Venezuela')
order by order_price desc
limit 3;

select customer_id, ship_country, unit_price * quantity * (1 + discount) as order_price 
from orders
join order_details od using(order_id)
where order_date >= '1997-09-01' and ship_country = any (select ship_country 
from orders where ship_country = 'Argentina' OR ship_country = 'Bolivia' OR ship_country = 'Brazil' OR ship_country = 'Chile' OR ship_country = 'Colombia' OR ship_country = 'Ecuador' OR ship_country = 'Guyana' OR ship_country = 'Paraguay' OR ship_country = 'Peru' OR ship_country = 'Suriname' OR ship_country = 'Uruguay' OR ship_country = 'Venezuela')
order by order_price desc
limit 3;

select distinct product_name
from products p 
where exists(select product_id
from order_details od
where product_id = p.product_id 
group by product_id
having count(*) = 10)
