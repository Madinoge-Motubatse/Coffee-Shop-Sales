----EXPLORE DATA TO CHECK CATEGORIAL COLUMNS

SELECT DISTINCT store_location
FROM COFFEE_SHOP;

SELECT DISTINCT product_category
FROM COFFEE_SHOP;

-----Checking starting and ending date of report

SELECT MIN(transaction_date) AS first_opening_day
FROM COFFEE_SHOP;

SELECT MAX(transaction_date) AS last_opening_day
FROM COFFEE_SHOP;

SELECT* FROM COFFEE_SHOP;

--------------------------------
SELECT transaction_date,
DAYNAME(transaction_date) AS day_name,
CASE

WHEN day_name IN ('Saturday','Sunday') THEN 'Weekend'
ELSE 'Weekday'
END AS  day_clasification,
MONTHNAME(transaction_date) AS month_name,

transaction_time,

CASE
  WHEN transaction_time BETWEEN '06:00:00'AND '11:59:59' THEN 'Morning'
  WHEN transaction_time BETWEEN '12:00:00'AND '16:59:59' THEN 'Afternoon'
  WHEN transaction_time >= '17:00:00' THEN 'Evening'
  END AS time_bucket,
  
HOUR(transaction_time) AS hour_of_day,

-----Categorial data
store_location,
product_category,
product_detail,
product_type,

----ID's

COUNT(DISTINCT TRANSACTION_ID) AS number_of_sales,
SUM(transaction_qty*unit_price) as Total_Revenue
FROM COFFEE_SHOP
GROUP BY ALL;
