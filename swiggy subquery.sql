-- 1. Find the restaurant with the highest rating in Bangalore.
select distinct name,rating from restaurants where rating=(select max(rating) from restaurants where city='bangalore')and city='bangalore';
-- 2.List the names of restaurants whose cost is higher than the average cost across all restaurants. 
select name, city,cost from restaurants where cost > (select avg(cost) from restaurants) order by cost desc;
-- 3 Show the restaurant(s) with the maximum revenue (rating_count × cost).
select name,rating_count*cost as revenue from restaurants where rating_count*cost=(select max(rating_count*cost) from restaurants);
-- 4.List the restaurants in Chennai that have a rating higher than the highest rating in Mumbai.
select distinct name,rating from restaurants where rating=(select max(rating)from restaurants where city ='mumbai' ) 
and rating>(select max(rating) from restaurants where city='chennai')  
 order by name;
 -- 5 Find restaurants that offer the same cuisine as the most expensive restaurant.
SELECT name, cuisine, rating, cost
FROM restaurants
WHERE cuisine = (
    SELECT cuisine
    FROM restaurants
    WHERE cost = (SELECT MAX(cost) FROM restaurants)
    LIMIT 1
)
AND rating = (
    SELECT MAX(rating)
    FROM restaurants
    WHERE cuisine = (
        SELECT cuisine
        FROM restaurants
        WHERE cost = (SELECT MAX(cost) FROM restaurants)
        LIMIT 1
    )
);
-- 6. Display restaurants whose cost is in the top 5 highest costs across all cities
select name,cost,city from restaurants where cost in (select max(cost)from restaurants group by city) order by cost desc limit 5;

-- 7.Find the restaurant(s) with the second highest cost
select name,cost,city from restaurants where cost=(select max(cost) from restaurants)limit 1,1;

-- 8. Show all restaurants that serve the same cuisine as the most common cuisine.
SELECT name, cuisine, cost 
FROM restaurants 
WHERE cuisine = (
    SELECT cuisine
    FROM restaurants 
    GROUP BY cuisine 
    ORDER BY COUNT(*) DESC 
    LIMIT 1
);
-- 9.List all restaurants in Delhi whose revenue is above the average revenue in Delhi.
select name,rating_count*cost as revenue from restaurants where city='delhi'and (rating_count*cost) > (select avg(rating_count*cost)from restaurants where city="delhi")

