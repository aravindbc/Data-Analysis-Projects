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