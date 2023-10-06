CREATE DATABASE PROJECT1;
USE PROJECT1;

SELECT * FROM bank;


-- 1. Which professions are the most popular among customers over 45 years old?
SELECT job, COUNT(*) AS count
FROM bank
WHERE age > 45
GROUP BY job
ORDER BY count DESC;
/* This query selects the job titles of customers over 45 years old, counts how many customers are in each profession, 
and then orders the results by the count in descending order to find the most popular professions among customers over 45.*/


-- 2. For how many people with loans did the marketing campaign succeed?
SELECT COUNT(*) AS count
FROM bank
WHERE loan = 'yes' AND deposit = 'yes';
/* This query counts the number of people who have loans (loan = 'yes') and also subscribed to the 
marketing campaign (deposit = 'yes'), indicating a successful marketing campaign for people with loans.*/


-- 3. Does the success depend on the balance, deposit, or loan?
-- To determine if success depends on balance, deposit, or loan, you can calculate the success rate for different scenarios:

-- a. Success rate for different balance levels:
SELECT AVG(CASE WHEN balance > 0 THEN 1 ELSE 0 END) AS balance_success_rate,
       AVG(CASE WHEN balance <= 0 THEN 1 ELSE 0 END) AS no_balance_success_rate
FROM bank;
-- This query calculates the success rate for customers with a positive balance and those with no balance.

-- b. Success rate for different deposit scenarios:
SELECT deposit, AVG(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS success_rate
FROM bank
GROUP BY deposit;
-- This query calculates the success rate for customers based on whether they subscribed to the deposit ('yes' or 'no').

-- c. Success rate for customers with and without loans:
SELECT loan, AVG(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS success_rate
FROM bank
GROUP BY loan;
-- This query calculates the success rate for customers with and without loans.



