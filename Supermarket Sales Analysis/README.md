## Supermarket Sales Analysis
The "Supermarket Sales Analysis in SQL" project focuses on leveraging SQL for comprehensive sales analysis. The project involves formulating queries to answer business questions, offering insights into product popularity, customer behavior, and overall revenue generated.

#### Tools Used*
- SQL (MySQL): Data analysis through querying.

#### SQL Queries
The project addresses several key business questions using SQL queries on the supermarket sales dataset:
- **Total Revenue**: Calculates the total revenue generated from the sales data.
- **Top Revenue Branch**: Identifies the branch (city) with the highest total sales revenue.
- **Customer Type Analysis**: Breaks down the sales count between members and normal customers.
- **Top Gross Income Product Line**: Identifies the product line generating the highest gross income.
- **Average Unit Price by Branch**: Calculates the average unit price of products sold in each branch.
- **Preferred Payment Method**: Determines the most popular payment method among customers.
- **Average Gross Margin Percentage**: Calculates the average gross margin percentage for each product line.
- **Busiest Day of the Week**: Identifies the day of the week with the highest sales volume.
- **Total Quantity Sold by Product Line**: Calculates the total quantity sold for each product line.
- **Tax Collection by Gender**: Calculates the total tax amount collected for each gender.

- -- What is the total revenue generated from the sales data in the table?
SELECT SUM(Total) AS total_revenue
FROM sales_table;

-- Which branch (City) has the highest total sales revenue?
SELECT Branch, City, SUM(Total) AS total_revenue
FROM sales_table
GROUP BY Branch, City
ORDER BY total_revenue DESC
LIMIT 1;

-- How many sales were made to members and how many to normal customers?
SELECT Customer_type, COUNT(*) AS num_sales
FROM sales_table
GROUP BY Customer_type;

-- Which product line generated the highest gross income? How much was it?
SELECT Product_line, SUM(gross_income) AS total_gross_income
FROM sales_table
GROUP BY Product_line
ORDER BY total_gross_income DESC
LIMIT 1;

-- What is the average unit price of products sold in each branch?
SELECT Branch, City, AVG(Unit_price) AS avg_unit_price
FROM sales_table
GROUP BY Branch, City;

-- Which payment method is the most popular among customers?
SELECT Payment, COUNT(*) AS num_payments
FROM sales_table
GROUP BY Payment
ORDER BY num_payments DESC
LIMIT 1;

-- What is the average gross margin percentage for each product line?
SELECT Product_line, AVG(gross_margin_percentage) AS avg_margin_percentage
FROM sales_table
GROUP BY Product_line;

-- Which day of the week had the highest sales volume?
SELECT IFNULL(DATE_FORMAT(Date, '%W'), 'Unknown') AS day_of_week, COUNT(*) AS num_sales
FROM sales
GROUP BY day_of_week
ORDER BY num_sales DESC
LIMIT 1;

-- What is the total quantity sold for each product line?
SELECT Product_line, SUM(Quantity) AS total_quantity_sold
FROM sales_table
GROUP BY Product_line;

-- For each gender, what is the total tax amount collected?
SELECT Gender, SUM(COALESCE(`Tax_5%`, 0)) AS total_tax_amount
FROM sales
GROUP BY Gender;

#### Conclusion
This project's SQL data analysis can used to enhances decision-making by providing valuable insights into sales trends, customer behavior, and product performance.
