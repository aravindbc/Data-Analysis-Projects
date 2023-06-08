-- 1. How does the funding ecosystem change with time?
SELECT YEAR(Dates) AS Years, COUNT(*) AS Count, SUM(Amount_USD) AS Total_Investment
FROM startup
GROUP BY Years
ORDER BY Years ASC;

-- 2. Do cities play a major role in funding?
SELECT Location, COUNT(*) AS Count, SUM(Amount_USD) AS Total_Investment 
FROM startup
GROUP BY Location
ORDER BY Total_Investment DESC;

-- 3. Which industries are favored by investors for funding?
SELECT Industry, COUNT(*) AS Count, SUM(Amount_USD) AS Total_Investment 
FROM startup
GROUP BY Industry
ORDER BY Total_Investment DESC;

-- 4. Who are the important investors in the Indian Ecosystem?
SELECT Investors, COUNT(*) AS Count, SUM(Amount_USD) AS Total_Investment 
FROM startup
GROUP BY Investors
ORDER BY Total_Investment DESC;

-- 5. How much funds does startups generally get in India?
SELECT ROUND(AVG(Amount_USD),2) AS Average_Investment_million
FROM startup;