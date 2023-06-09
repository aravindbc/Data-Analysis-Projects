
/* 1. Join order_items table with products table. For each order return product_id, name, quantity and unit_price. 
Use alias to simplify the code. */
USE sql_store;
SELECT oi.product_id, name, oi.quantity, oi.unit_price
FROM order_items oi
JOIN products p 
	ON oi.product_id = p.product_id;
    
/* 2. Join payments table with payment_methods table and clients table. 
Return results that shows details such as clients name and payment method. */
USE sql_invoicing;
SELECT p.date, p.invoice_id, p.amount, c.name, pm.name
FROM payments p
JOIN clients c
    ON p.client_id = c.client_id
JOIN payment_methods pm
    ON p.payment_method = pm.payment_method_id;


/* 3. Outer Join products table with order_items table to produce results that shows how many times each product is ordered. 
The result should contain 3 columns product_id, name and quantity from order items table. */
USE sql_store;
SELECT p.product_id, name, quantity
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id;
    
-- 4. Produce results that contains order_date, order_id, first_name, shipper, status
SELECT order_date, order_id, first_name AS customer, sh.name AS shipper, os.name AS status
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
JOIN order_statuses os
	ON o.status = os.order_status_id;
    
/* 5. Produce result that shows, on what date who has paid how much using what payment method. 
Result should contain date, client, amount, payment method */
USE sql_invoicing;
SELECT p.date, c.name AS client, p.amount, pm.name AS payment_method
FROM payments p
JOIN clients c USING (client_id)
JOIN payment_methods pm
   ON p.payment_method = pm.payment_method_id;
   
/* 6. Do a cross join between shippers and products using implicit syntax and explicit syntax. 
The result should countain 2 columns product and shipper. */
USE sql_store;
SELECT p.name AS products, s.name AS shipper
FROM products p, shippers s
ORDER BY s.name;

SELECT p.name AS products, s.name AS shipper
FROM products p
CROSS JOIN shippers s
ORDER BY s.name;

/* 7. Produce result that contain 4 columns, customer_id, first_name, points,
 type(If customer have less than 2000 points their type is bronze, 
 if its between 2000 to 3000 they are silver, if above 3000 they are gold). Also sort the result by the first name. */
 SELECT customer_id ,first_name ,points ,'Bronze' AS type
FROM customers
WHERE points < 2000
UNION
SELECT customer_id ,first_name ,points ,'Silver' AS type
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT customer_id ,first_name ,points ,'Gold' AS type
FROM customers
WHERE points > 3000
ORDER BY first_name;