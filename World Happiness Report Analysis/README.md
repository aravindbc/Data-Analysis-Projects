# World Happiness Report
This is a SQL based project about a report that created by a nonprofit called Sustainable Development Solutions Network, 
created by the United Nations, which publishes a yearly World Happiness Report, that contains rankings of 
national happiness based on respondent answers merged with quality of life metrics, such as education, crime rate, 
healthcare, etc.

#### Toosl Used
- SQL (MySQL)
- Kaggle dataset “World Happiness Report “

#### Here are some questions we may answer:
- What are the top 10 countries for each metric?
- What are the most generous countries with the best social support?
- Does the perception of generosity depend on GDP per capita?
- What are the average happiness scores by region?
- What are the countries with the highest healthy life expectancy and GDP per capita? Is there any connection?

#### Steps
1. Clean and transform the data
2. Import the csv files to MySQL Workbench
3. Write queries to get answers for the questions

#### SQL Queries
```
-- What are the top 10 countries for each year?
SELECT Country, Happiness_Rank, Happiness_Score
FROM 2015_report
ORDER BY Happiness_Rank
LIMIT 10;

-- What are the most generous countries with the best social support?
SELECT Country, Generosity, Family
FROM 2015_report
ORDER BY Generosity DESC, Family DESC
LIMIT 10;

-- Does the perception of generosity depend on GDP per capita?
SELECT Country, Generosity, GDP
FROM 2015_report
ORDER BY GDP DESC, Generosity DESC
LIMIT 10;

-- What are the average happiness scores by region?
SELECT Region, AVG(Happiness_Score) AS Avg_Happiness_Score
FROM 2015_report
GROUP BY Region
ORDER BY Avg_Happiness_Score DESC;

-- What are the countries with the highest healthy life expectancy and GDP per capita? Is there any connection?
SELECT Country, Life_Expectancy, GDP
FROM 2015_report
ORDER BY Life_Expectancy DESC, GDP DESC
LIMIT 10;
```
