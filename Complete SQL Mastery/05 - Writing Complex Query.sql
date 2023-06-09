-- 1. Find products that are more expensive than lettuce (id=3)
USE sql_store;
SELECT *
FROM products
WHERE unit_price > 
(SELECT unit_price
FROM products
WHERE product_id = 3);

-- 2. Find employees who earn more than average
USE sql_hr;
SELECT *
FROM employees
WHERE salary > 
(SELECT AVG(salary)
FROM employees);

-- 3. Find the products that have never been ordered
USE sql_store;
SELECT *
FROM products
WHERE product_id NOT IN 
(SELECT DISTINCT product_id
 FROM order_items);
 
 -- 4. Find clients without invoices
 USE sql_invoicing;
 SELECT *
FROM clients
WHERE client_id NOT IN
(SELECT DISTINCT client_id
 FROM invoices);
 
/* -- 5. Find the customers who have ordered lettuce (id 3). 
Three columns : customer_id , first_name , last_name. Two ways to  write query using subquery and using join. */
USE sql_store;
SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id IN 
(SELECT o.customer_id
 FROM order_items oi
 JOIN orders o USING (order_id)
 WHERE product_id = 3);
 -- or
 SELECT DISTINCT customer_id, first_name, last_name
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE oi.product_id = 3;

-- 6. Select the invoices that is larger than the largest invoice of client 3.
USE sql_invoicing;
SELECT *
FROM invoices
WHERE invoice_total > 
(SELECT MAX(invoice_total)
FROM invoices
WHERE client_id = 3);

-- 7. Select clients with at least two invoices
SELECT *
FROM clients
WHERE client_id IN 
(SELECT client_id
FROM invoices
GROUP BY client_id
HAVING COUNT(*) >= 2);

-- 8. Calculate the avg salary of every office and return the employees if salary is greater than avgerage
USE sql_hr;
SELECT *
FROM employees e
WHERE salary >
(SELECT AVG(salary)
FROM employees
WHERE office_id = e.office_id);

-- 9. Get invoices that are larger than the client's average invoice amount
USE sql_invoicing;
SELECT *
FROM invoices i
WHERE invoice_total >
(SELECT AVG(invoice_total)
FROM invoices
WHERE client_id = i.client_id);

-- 10. Find the products that have never been ordered
USE sql_store;
SELECT *
FROM products p
WHERE NOT EXISTS 
(SELECT product_id
FROM order_items
WHERE product_id = p.product_id);