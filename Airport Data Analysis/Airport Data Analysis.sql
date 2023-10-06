CREATE DATABASE PROJECT4;
USE PROJECT4;

SELECT * FROM airports;
SELECT * FROM population;


-- 1. What is the population of the countries where the top 5 airports are located?
SELECT A.Airport, A.Country, P.Population_2020
FROM Airports A
JOIN Population P ON A.Country = P.Country
WHERE A.Rank <= 5;


-- 2. How many airports are located in countries where the urban population is greater than 50% of the total population?
SELECT COUNT(*) AS Num_Airports
FROM Airports A
JOIN Population P ON A.Country = P.Country
WHERE P.Urban_Pop > 50;


-- 3. What is the total net change in population for countries where airports are located in Asia?
SELECT SUM(P.Net_Change) AS Total_Net_Population_Change
FROM Airports A
JOIN Population P ON A.Country = P.Country
WHERE A.Country IN ('China', 'India', 'Indonesia', 'Pakistan');


-- 4. For each airport, what percentage of the country's population does it serve?
SELECT A.Airport, A.Country, A.Passengers, P.Population_2020, 
    (A.Passengers / P.Population_2020) * 100 AS Percentage_Served
FROM Airports A
JOIN Population P ON A.Country = P.Country;


-- 5. List the airports along with their passenger counts and the corresponding country's population in 2020.
SELECT A.Airport, A.Passengers, P.Population_2020
FROM Airports A
JOIN Population P ON A.Country = P.Country;
