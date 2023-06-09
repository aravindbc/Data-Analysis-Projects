-- 1. Insert three rows in the products table
INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES ('Product1', 10, 1.95),
       ('Product2', 11, 1.95),
       ('Product3', 12, 1.95);
       
/* 2. Create a copy of invoices table and name it invoices_archive, instead of the client_id show client_name in that table.
 So join the table with clients table and use that query as subquery to create the table. 
 And only select the invoices that do have a payment date. */
 USE sql_invoicing;
 CREATE TABLE invoices_archive AS
SELECT i.invoice_id, i.number, c.name AS client, i.invoice_total, i.payment_total, i.invoice_date, i.payment_date,i.due_date
FROM invoices i
JOIN clients c USING (client_id)
WHERE payment_date IS NOT NULL;

-- 3. Write a sql statement to give any customers born before 1990 50 extra points.
USE sql_store;
UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01';

/* 4. Find orders of customers if they have placed an order, update the comments column in orders table to ‘gold customer’ 
if they have more than 3000 points. */
UPDATE orders
SET comments = 'Gold customer'
WHERE customer_id IN
	(SELECT customer_id
	FROM customers
	WHERE points > 3000);