-- 1. Show orders placed in current year with (date fucntions)
USE sql_store;
SELECT *
FROM orders
WHERE YEAR(order_date) = YEAR(NOW());

-- 2. Produce the results contain 2 columns customer(customers full name) and phone(if no phone number display unknown)
SELECT
	CONCAT(first_name, ' ', last_name) AS customer,
	COALESCE(phone, 'Unknown') AS phone
FROM customers;

/* 3. Produce the results contain 4 columns product id, name, number(number of times each product has been ordered), 
frequency (if a product has been ordred more than once then ‘many times’ other wise ‘once’) */
SELECT product_id, name,
	COUNT(*) AS orders,
	IF(COUNT(*) > 1, 'Many times', 'Once') AS frequecy
FROM products
JOIN order_items USING (product_id)
GROUP BY product_id, name;

/* Classify customer based on their points, so if a customer has more than 3000 points they are gold, 
2000 to 3000 inclusive of thse numbers they are silver and below 2000 they are bronze. 3 columns customers, points, category */
SELECT
	CONCAT(first_name, " ", last_name) AS customer,
	points,
	CASE
		WHEN points > 3000 THEN 'Gold'
		WHEN points >= 2000 THEN 'Silver'
		ELSE 'Bronze'
	END AS category
FROM customers;