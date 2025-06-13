create database swiggy;
use swiggy;
select * from restaurants;
-- 1. Which restaurant of abohar is visied by least number of people?
select * from restaurants where city = 'abohar' and rating_count = (
						select min(rating_count) 
						from restaurants 
					where city = 'abohar');
-- 2. Which restaurant has generated maximum revenue all over india?
select max(rating_count * cost) from restaurants;
select * from restaurants where 
		rating_count * cost = (select max(rating_count * cost) from restaurants);
-- 3. How many restaurants are having rating more than the average rating?
select count(*) as "total_restaurants" from restaurants 
	where rating >= (select avg(rating) from restaurants);
    
-- 4. Which restaurant of Delhi has generated most revenue?

select * from restaurants where 
	rating_count * cost = (select max(rating_count * cost) from restaurants 
		where city = 'Delhi') and city = 'Delhi';
-- 5. Which restaurant chain has maximum number of restaurants?
SELECT name, COUNT(name) AS name_count
FROM restaurants
GROUP BY name order by name_count desc;
-- 6. Which restaurant chain has generated maximum revenue?
select name,rating_count,cost,max(rating_count*cost) as max_revenue from restaurants
group by name,rating_count,cost order by max_revenue desc;
-- 7. Which city has maximum number of restaurants?
select city,count(city) as max_restaurents from restaurants group by city order by count(city) desc;
-- 8. Which city has generated maximum revenue all over india?
select city , sum(rating_count * cost) as revenue from restaurants
group by city order by sum(rating_count*cost) desc limit 10;
-- 9. List 10 least expensive cuisines?
select cuisine ,avg(cost) as least_expensive from restaurants group by cuisine order by least_expensive asc limit 10;
-- 10 List 10 most expensive cuisines?
select cuisine ,avg(cost) as least_expensive from restaurants group by cuisine order by least_expensive desc limit 10;
-- 11. What is the city is having Biryani as most popular cuisine
select city,count(cuisine) as count_of_briyani from restaurants where cuisine="biryani" group by city  order by count_of_briyani desc;
-- 12. List top 10 unique restaurants with unique name only thorughout the dataset as per generate maximum revenue (Single restaurant with that name)
select distinct name ,avg(cost*rating_count) as max_revenue from  restaurants group by name  order by max_revenue desc limit 10;









        