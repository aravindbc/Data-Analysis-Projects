### Overview
The "Supermarket Sales Analysis" project uses SQL to analyze sales comprehensively, formulating queries to answer business questions and provide insights into product popularity, customer behavior, and revenue.

### Technologies Used
- SQL
- MySQL
- MySQL Workbench

### Queries
```
-- 1. What is the total revenue generated from the sales data in the table?
SELECT SUM(Total) AS total_revenue
FROM sales;

-- 2. Which branch (City) has the highest total sales revenue?
SELECT Branch, City, SUM(Total) AS total_revenue
FROM sales
GROUP BY Branch, City
ORDER BY total_revenue DESC
LIMIT 1;

-- 3. How many sales were made to members and how many to normal customers?
SELECT Customer_type, COUNT(*) AS num_sales
FROM sales
GROUP BY Customer_type;

-- 4. Which product line generated the highest gross income? How much was it?
SELECT Product_line, SUM(gross_income) AS total_gross_income
FROM sales
GROUP BY Product_line
ORDER BY total_gross_income DESC
LIMIT 1;

-- 5. What is the average unit price of products sold in each branch?
SELECT Branch, City, AVG(Unit_price) AS avg_unit_price
FROM sales
GROUP BY Branch, City;

-- 6. Which payment method is the most popular among customers?
SELECT Payment, COUNT(*) AS num_payments
FROM sales
GROUP BY Payment
ORDER BY num_payments DESC
LIMIT 1;

-- 7. What is the average gross margin percentage for each product line?
SELECT Product_line, AVG(gross_margin_percentage) AS avg_margin_percentage
FROM sales
GROUP BY Product_line;

-- 8. Which day of the week had the highest sales volume?
SELECT IFNULL(DATE_FORMAT(Date, '%W'), 'Unknown') AS day_of_week, COUNT(*) AS num_sales
FROM sales
GROUP BY day_of_week
ORDER BY num_sales DESC
LIMIT 1;

-- 9. What is the total quantity sold for each product line?
SELECT Product_line, SUM(Quantity) AS total_quantity_sold
FROM sales
GROUP BY Product_line;

-- 10. For each gender, what is the total tax amount collected?
SELECT Gender, SUM(COALESCE(`Tax_5%`, 0)) AS total_tax_amount
FROM sales
GROUP BY Gender;
