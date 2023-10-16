### Overview
This project focuses on analyzing the United Nations' World Happiness Report. This report combines happiness data with quality of life metrics to rank national happiness. The aim is to uncover insights from this dataset.

### Technologies Used
- SQL
- MySQL
- MySQL Workbench

### Queries
```
-- 1. What are the top 10 countries for each metric?
-- Top 10 countries by Happiness Score: 
SELECT Year, Country, Happiness_Score
FROM combined_datasets
ORDER BY Happiness_Score DESC
LIMIT 10;


-- 2. What are the most generous countries with the best social support?
SELECT Year, Country, Generosity, Family
FROM combined_datasets
ORDER BY Generosity DESC, Family DESC
LIMIT 10;


-- 3. Does the perception of generosity depend on GDP per capita?
SELECT Year, Country, Generosity, `Economy(GDP)`  -- Use backticks if column name contains parentheses
FROM combined_datasets;


-- 4. What are the average happiness scores by region?
SELECT Year, Region, AVG(Happiness_Score) AS Avg_Happiness_Score
FROM combined_datasets
GROUP BY Year, Region;


-- 5. What are the countries with the highest healthy life expectancy and GDP per capita? Is there any connection?
SELECT Year, Country, `Health(Life_Expectancy)` , `Economy(GDP)`
FROM combined_datasets
ORDER BY `Health(Life_Expectancy)` DESC, `Economy(GDP)` DESC
LIMIT 10;
