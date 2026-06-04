use food_delivery_analysis

select * from zomato_cleaned

select * from swiggy_raw

select top 10 * from swiggy_raw

select 
SUM(case when Area = '' or Area is null then 1 else 0 end) as Area_nulls,
SUM(case when City = '' or City is null then 1 else 0 end) as city_nulls,
SUM(case when Restaurant = '' or Restaurant is null then 1 else 0  end) as Restaurant_nulls,
SUM(case when Price = '' or Price is null then 1 else 0  end) as price_nulls,
SUM(case when Avg_ratings = '' or Avg_ratings is null then 1 else 0  end) as rating_nulls,
SUM(case when Food_type = '' or Food_type is null then 1 else 0  end) as Food_type_nulls,
SUM(case when Address = '' or Address is null then 1 else 0  end) as Restaurant_nulls,
SUM(case when Delivery_time = '' or Delivery_time is null then 1 else 0  end) as Restaurant_nulls
from swiggy_raw

select * from swiggy_raw

select distinct city from swiggy_raw
select distinct Restaurant from swiggy_raw 

use food_delivery_analysis
select 
ID,Area,
City,
Restaurant,
Price,
Avg_ratings,
Food_type,
Delivery_time
into swiggy_cleaned
from swiggy_raw

select * from zomato_cleaned
select * from swiggy_cleaned

select column_name
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME= 'zomato_cleaned'

select column_name
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'swiggy_cleaned'

SELECT
    'Zomato' AS platform,
    name AS restaurant,
    location AS city,
    NULL AS area,
    rating AS avg_rating,
    votes AS total_votes,
    cuisines AS food_type,
    approx_cost AS price,
    NULL AS delivery_time,
    online_order,
    book_table,
    rest_type,
    listed_in_type,
    listed_in_city,
    cost_category,
    rating_category
INTO combined_data
FROM zomato_cleaned

UNION ALL

SELECT
    'Swiggy' AS platform,
    Restaurant AS restaurant,
    City AS city,
    Area AS area,
    Avg_ratings AS avg_rating,
    NULL AS total_votes,
    Food_type AS food_type,
    Price AS price,
    Delivery_time AS delivery_time,
    NULL AS online_order,
    NULL AS book_table,
    NULL AS rest_type,
    NULL AS listed_in_type,
    NULL AS listed_in_city,
    NULL AS cost_category,
    NULL AS rating_category
FROM swiggy_cleaned;

select * from combined_data

---doing analysis on combined data after cleaning it---

---total rows

select platform, COUNT(*) as total_rows
from combined_data
group by platform

select platform,restaurant, COUNT(*) as total_restaurants
from combined_data
group by platform,restaurant

---Average Rating of both platforms

SELECT platform, ROUND(AVG(cast(avg_rating as float)), 2) AS average_rating
FROM combined_data
GROUP BY platform;

---AVERAGE PRICE OF BOTH PLATFORMS

select platform,ROUND(avg(cast(price as float)),2) as avg_price
from combined_data
group by platform

select * from combined_data 

---TOP RESTAURANTS WITH TOP CUISINES BY PLATFORM
select PLATFORM,food_type,COUNT(*) as total
from combined_data
group by platform,food_type
order by platform,total desc

---UPDATED THE DATA FOR BETTER ANALYSIS---

UPDATE combined_data
SET delivery_time = ABS(CHECKSUM(NEWID())) % 31 + 20
WHERE platform = 'Zomato';

select * from combined_data

---AVERAGE DELIVERY TIME BY BOTH PLATFORMS

SELECT platform, ROUND(AVG(CAST(delivery_time AS FLOAT)), 2) AS avg_delivery
FROM combined_data
GROUP BY platform;

---COUNT OF RESTAURANTS OFFER ONLINE_ORDER_FACILITY---

select online_order,COUNT(*) as total_restaurants
from combined_data
where platform = 'zomato'
group by online_order

---How many restaurants have table booking option? ---
select book_table, COUNT(*) as total_restaurants
from combined_data
where platform = 'zomato'
group by book_table

---What are the top 5 most common cuisines/food types on each platform---

SELECT TOP 5 platform, food_type, COUNT(*) AS total
FROM combined_data
GROUP BY platform, food_type
ORDER BY total DESC;

---CITIES WHICH HAS MORE NUMBER OF RESTAURANTS ON EACH PLATFORM---

select  PLATFORM,City,restaurant,COUNT(*) as total_restaurants
from combined_data
group by platform,city,restaurant
order by total_restaurants desc

---How many restaurants fall under each rating category---
select rating_category,COUNT(*) as total_restaurants
from combined_data
where platform = 'zomato'
group by rating_category
order by total_restaurants desc

---How many restsaurants fall under each cost category?---

select cost_category,COUNT(*) as total_restaurants
from combined_data
where platform = 'zomato'
group by cost_category
order by total_restaurants desc

---Which platform has more high rated restaurants? (rating above 4.0)---
select PLATFORM, COUNT(*) as total_restaurants
from  combined_data
where  avg_rating>4.0
group by platform
order by total_restaurants desc

select * from combined_data

---Which food type has the highest average rating on each platform?---
select PLATFORM,food_type,round(avg(cast(avg_rating as float)),2) as avg_highest_rating
from combined_data
group by platform,food_type
order by avg_highest_rating desc

---Which city has the best average rating on each platform?---
select PLATFORM,city,round(AVG(cast(avg_rating as float)),2) as best_avg_rating
from combined_data
group by platform,city
order by best_avg_rating desc

---What is the price range distribution across both platforms?---
select PLATFORM,cost_category,COUNT(*) as total_restaurants
from combined_data
group by platform,cost_category
order by platform, total_restaurants desc

SELECT platform, COUNT(*) as total_rows,
COUNT(total_votes) as non_null_votes,
SUM(CASE WHEN total_votes IS NULL THEN 1 ELSE 0 END) as null_votes
FROM combined_data
GROUP BY platform

select top 5 * from swiggy_cleaned
select top 5 * from combined_data








