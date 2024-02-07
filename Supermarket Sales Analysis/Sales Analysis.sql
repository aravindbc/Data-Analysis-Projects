
-- 1. Total Revenue Calculation: Calculated the total revenue generated from the sales data in the table.
SELECT SUM(Total) AS total_revenue
FROM sales;

-- 2. Top-Selling Branch Identification: Identified the branch (city) with the highest total sales revenue.
SELECT Branch, City, SUM(Total) AS total_revenue
FROM sales
GROUP BY Branch, City
ORDER BY total_revenue DESC
LIMIT 1;

-- 3. Customer Segmentation by Type: Determined the number of sales made to members and normal customers.
SELECT Customer_type, COUNT(*) AS num_sales
FROM sales
GROUP BY Customer_type;

-- 4. Top Gross Income Generating Product Line: Identified the product line that generated the highest gross income and its total.
SELECT Product_line, SUM(gross_income) AS total_gross_income
FROM sales
GROUP BY Product_line
ORDER BY total_gross_income DESC
LIMIT 1;

-- 5. Average Unit Price by Branch: Calculated the average unit price of products sold in each branch.
SELECT Branch, City, AVG(Unit_price) AS avg_unit_price
FROM sales
GROUP BY Branch, City;

-- 6. Most Popular Payment Method: Identified the most popular payment method among customers.
SELECT Payment, COUNT(*) AS num_payments
FROM sales
GROUP BY Payment
ORDER BY num_payments DESC
LIMIT 1;

-- 7. Average Gross Margin Percentage by Product Line: Calculated the average gross margin percentage for each product line.
SELECT Product_line, AVG(gross_margin_percentage) AS avg_margin_percentage
FROM sales
GROUP BY Product_line;

-- 8. Day with Highest Sales Volume: Determined the day of the week with the highest sales volume.
SELECT IFNULL(DAYNAME(Date), 'Unknown') AS day_of_week, COUNT(*) AS num_sales
FROM sales
GROUP BY DAYNAME(Date), Date
ORDER BY num_sales DESC
LIMIT 1;

-- 9. Total Quantity Sold by Product Line: Calculated the total quantity sold for each product line.
SELECT Product_line, SUM(Quantity) AS total_quantity_sold
FROM sales
GROUP BY Product_line;

-- 10. Total Tax Amount Collected by Gender: Calculated the total tax amount collected for each gender.
SELECT Gender, SUM(COALESCE(`Tax_5%`, 0)) AS total_tax_amount
FROM sales
GROUP BY Gender;
