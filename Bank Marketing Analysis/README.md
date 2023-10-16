### Overview
This project is dedicated to evaluating the performance of bank marketing strategies.

### Technologies Used
- SQL
- MySQL
- MySQL Workbench

### Queries
```
-- 1. Which professions are the most popular among customers over 45 years old?
SELECT job, COUNT(*) AS count
FROM bank
WHERE age > 45
GROUP BY job
ORDER BY count DESC;

-- 2. For how many people with loans did the marketing campaign succeed?
SELECT COUNT(*) AS count
FROM bank
WHERE loan = 'yes' AND deposit = 'yes';

-- 3. Does the success depend on the balance, deposit, or loan?
-- a. Success rate for different balance levels:
SELECT AVG(CASE WHEN balance > 0 THEN 1 ELSE 0 END) AS balance_success_rate,
       AVG(CASE WHEN balance <= 0 THEN 1 ELSE 0 END) AS no_balance_success_rate
FROM bank;

-- b. Success rate for different deposit scenarios:
SELECT deposit, AVG(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS success_rate
FROM bank
GROUP BY deposit;

-- c. Success rate for customers with and without loans:
SELECT loan, AVG(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS success_rate
FROM bank
GROUP BY loan;
