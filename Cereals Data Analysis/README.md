### Overview
This project explores cereal nutrition, analyzing a dataset from seven manufacturers to gain insights into nutrient and elemental content, potentially reshaping your cereal choices and perceptions.

### Technologies Used
- SQL
- MySQL
- MySQL Workbench

### Queries
```
-- 1. What is the average content of each nutrient and element per manufacturer?
SELECT mfr,
       AVG(calories) AS avg_calories,
       AVG(protein) AS avg_protein,
       AVG(fat) AS avg_fat,
       AVG(sodium) AS avg_sodium,
       AVG(fiber) AS avg_fiber,
       AVG(carbo) AS avg_carbohydrates,
       AVG(sugars) AS avg_sugars,
       AVG(potass) AS avg_potassium
FROM cereal
GROUP BY mfr;

-- 2. What is the number of calories per ounce for each product?
SELECT name, calories / weight AS calories_per_ounce
FROM cereal;

-- 3. What is the average rating per manufacturer?
SELECT mfr,
       AVG(rating) AS avg_rating,
       AVG(calories) AS avg_calories,
       AVG(protein) AS avg_protein,
       AVG(fat) AS avg_fat,
       AVG(carbo) AS avg_carbohydrates
FROM cereal
GROUP BY mfr;

-- 4. Which manufacturer possesses the best shelf location?
-- Assuming "best" means the highest average shelf value.
SELECT mfr, AVG(shelf) AS avg_shelf
FROM cereal
GROUP BY mfr
ORDER BY avg_shelf DESC
LIMIT 1;

-- 5. What is the nutritional value of each cereal?
-- Let's assume nutritional value is the sum of protein, fat, and carbohydrates.
SELECT name, (protein + fat + carbo) AS nutritional_value
FROM cereal;
