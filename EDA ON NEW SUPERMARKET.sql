use supermarket_record;



SELECT * FROM new_supermarket;
-- 1. Display the first 5 rows from the dataset.
SELECT * FROM new_supermarket LIMIT 5;

-- 2. Display the last 5 rows from the dataset.
SELECT * FROM new_supermarket ORDER BY 'Invoice ID' desc limit 5;

-- 3. Display random 5 rows from the dataset.
SELECT * FROM new_supermarket ORDER BY rand() limit 5;

-- 4. Display count, min, max, avg, and std values for a column(gross income) in the dataset.
SELECT COUNT(`gross income`),
		MIN(`gross income`),
	    MAX(`gross income`),
        AVG(`gross income`),
        STD(`gross income`) FROM new_supermarket;
        
-- 5. Find the number of missing values.
SELECT COUNT(*) FROM new_supermarket WHERE city IS NULL;

-- 6. Count the number of occurrences of each city.
SELECT city,COUNT(city) FROM new_supermarket GROUP BY city;

-- 7. Find the most frequently used payment method.
SELECT payment,COUNT(*) FROM new_supermarket GROUP BY payment ORDER BY count(*) desc;

-- 8. Does The Cost of Goods Sold Affect The Ratings That The Customers Provide?
SELECT Rating,cogs FROM new_supermarket;

-- 9. Find the most profitable branch as per gross income.
SELECT city, branch, round(sum(`gross income`),2) AS Gross_Income 
FROM new_supermarket GROUP BY city, branch ORDER BY Gross_Income desc;

-- 10. Find the most used payment method city-wise.
select city, 
SUM(CASE WHEN payment="cash" THEN 1 ELSE 0 END) AS "cash",
SUM(CASE WHEN payment="Ewallet" THEN 1 ELSE 0 END) AS "Ewalllet",
SUM(CASE WHEN payment="Credit card" THEN 1 ELSE 0 END) AS "Credit Card"
 FROM new_supermarket GROUP BY city;

-- 11. Find the product line purchased in the highest quantity.
SELECT `product line`, sum(Quantity) AS Total_quantity FROM new_supermarket
GROUP BY `product line` ORDER BY Total_quantity desc ;


-- 12. Display the daily sales by day of the week.
UPDATE new_supermarket 
SET DATE = str_to_date(Date,'%m/%d/%Y');

SELECT dayname(date), dayofweek(date), sum(Total)
FROM new_supermarket GROUP BY dayname(Date), dayofweek(date) ;

-- 13. Find the month with the highest sales.
SELECT monthname(date) AS Month_Name, month(date)as month , round(sum(total),2) AS Total_sales 
FROM new_supermarket GROUP BY Month_Name, month ORDER BY Total_sales desc;

-- 14. Find the time at which sales are highest.
SELECT  hour(time) AS hour ,round(sum(total),2) AS Total 
FROM new_supermarket GROUP BY  hour ORDER BY total desc ;

-- 15. Which gender spends more on average?
SELECT gender , round(sum(`gross income`),2) AS spending FROM new_supermarket GROUP BY gender;