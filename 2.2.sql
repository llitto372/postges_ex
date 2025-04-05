SELECT *
FROM orders
WHERE ship_country IN ('France', 'Austria', 'Spain');

SELECT *
FROM orders
ORDER BY required_date DESC;

SELECT * 
FROM orders
ORDER BY shipped_date ASC;

SELECT MIN(units_in_stock)
FROM products
WHERE units_on_order > 30;

SELECT MAX(units_in_stock)
FROM products 
WHERE units_on_order > 30;

SELECT AVG(shipped_date - order_date)
FROM orders
WHERE ship_country = 'USA';

SELECT SUM(unit_price * units_in_stock)
FROM products
WHERE discontinued = 1
