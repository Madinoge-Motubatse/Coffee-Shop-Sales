---- These queries help explore categorical columns by listing unique values.  Key word DISTINCT removes duplicates from the result set

SELECT DISTINCT store_location
FROM COFFEE_SHOP;

SELECT DISTINCT product_category
FROM COFFEE_SHOP;

-----This syntax checks starting and ending date of report. It defines the date range of your report or dataset

SELECT MIN(transaction_date) AS first_opening_day
FROM COFFEE_SHOP;

SELECT MAX(transaction_date) AS last_opening_day
FROM COFFEE_SHOP;
------- This gives the view of all data. It displays the entire dataset (all columns and rows). This help with understanding of data structure
SELECT* FROM COFFEE_SHOP;

-------------------This analyses transactions with derived columns.  It will extract the weekday name and write it as Tuesday. New columns are created with new labels. Transaction times are categorised into Morning, Afternoon, or Evening based on the time of sale. This syntax also groups by categorial column to analyse product and store location. The results are grouped by non-aggregated column
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
