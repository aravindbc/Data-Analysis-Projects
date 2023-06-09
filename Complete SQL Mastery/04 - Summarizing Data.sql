/* 1. Produce result from invoices table that contains 3 rows, first_half_of_2019, second_half_of_2019, total_of_2019 and 4 columns, 
date_range, total_sales, total_payments, what_we_expect (difference between total sales and total payments). */
USE sql_invoicing;
SELECT
	'First half of 2019' AS date_range,
	SUM(invoice_total) AS total_sales,
	SUM(payment_total) AS total_payments,
	SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date
	BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT
	'Second half of 2019' AS date_range,
	SUM(invoice_total) AS total_sales,
	SUM(payment_total) AS total_payments,
	SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date
	BETWEEN '2019-07-01' AND '2019-12-31'
UNION
SELECT
	'Total' AS date_range,
	SUM(invoice_total) AS total_sales,
	SUM(payment_total) AS total_payments,
	SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date
	BETWEEN '2019-01-01' AND '2019-12-31';
    
-- 2. Write a query against payments table to generate the report that contains 3 columns, date, payment_method, total_payments
SELECT date, pm.name AS payment_method,	SUM(amount) AS total_payments
FROM payments p
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
GROUP BY date, payment_method
ORDER BY date;

-- 3. Get the customers located in virginia who have spent more than $100
USE sql_store;
SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.quantity * oi.unit_price) AS total_sales
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE state = 'VA'
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING total_sales > 100;

/* 4. Write query agains payments table. 2 Columns payment method, total. 
So produce total for each payment method as well as the total amount received */
USE sql_invoicing;
SELECT
	pm.name AS payment_method,
	SUM(amount) AS total
FROM payments p
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
GROUP BY pm.name WITH ROLLUP;

