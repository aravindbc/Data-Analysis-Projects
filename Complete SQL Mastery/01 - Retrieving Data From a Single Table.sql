
USE sql_store;

-- 1. Return all the products from the database. In the result set show name, unit price, new price (unit price * 1.1)
SELECT name, unit_price, unit_price * 1.1 AS new_price
FROM products;

-- 2. Get orders that placed this year  (current year)
SELECT * 
FROM orders
WHERE order_date >= '2019-01-01';

-- 3. From the order_items table, get the items for order #6 where the total price is greater than 30
SELECT *
FROM order_items
WHERE order_id = 6 AND unit_price * quantity > 30;

-- 4. Get the products where the quantity in stock is equal to 49, 38, 72
SELECT *
FROM products
WHERE quantity_in_stock IN (49, 38, 72);

-- 5. Get customers that are born between January 1st 1990 and January 1st 2000
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- 6. Get the customers whose addresses contain trail or avenue
SELECT *
FROM customers
WHERE address LIKE '%trail%' OR
			address LIKE '%avenue%';
            
-- 7. Get the customers whose phone number ends with 9
SELECT *
FROM customers
WHERE phone LIKE '%9';

-- 8. Get the customers whose first names are ELKA or AMBUR
SELECT *
FROM customers
WHERE first_name REGEXP 'elka|ambur';

-- 9. Get the customers whose last names end with EY or ON
SELECT *
FROM customers
WHERE last_name REGEXP 'ey$|on$';

-- 10. Get the customers whose last names start with MY or contains SE
SELECT *
FROM customers
WHERE last_name REGEXP '^my|se';

-- 11. Get the customers whose last names contains B followed by R or U
SELECT *
FROM customers
WHERE last_name REGEXP 'b[ru]';
-- or
SELECT *
FROM customers
WHERE last_name REGEXP 'br|bu';

-- 12. Get the orders that are not shipped yet
SELECT *
FROM orders
WHERE shipper_id IS NULL;

-- 13. Write query for this result set : items for order with id 2, and sort based on total price of each item
SELECT *, quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC;

-- 14. Get the top three loyal customers
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;