-- 1. Create a view for end_user
create view basic_info as  (
select name,city,rating,rating_count,cuisine,cost from restaurants );
select * from basic_info;

-- 2. Create a view of sweet dishes
create view sweet_rest as (
select name,city,rating,rating_count,cuisine,cost from restaurants
where cuisine in("sweets","desserts","bakery","ice cream","waffle","ice cream cakes"));
select * from sweet_rest;
select count(*) from sweet_rest;
select distinct cuisine from restaurants;

-- 3.Create a view of top 100 restaurants
create view top_100 as (
select name,city,rating,rating_count,cuisine,cost from restaurants order by rating desc limit 100);
select * from top_100;

-- 4.Create a view of restaurant atleast 100 people visited
create view people_visit as (
select name,city,cuisine,cost,rating,rating_count from restaurants order by rating_count desc limit 100);
select * from people_visit;

-- -- 5. Create a view of top 1000 most expensive restaurants
create view top_1000 as (
select name,city,cuisine,cost,rating,rating_count from restaurants order by cost desc limit 1000);
select * from top_1000;

-- 6. Create a view that shows all restaurants in "Delhi" with a rating above 4.
drop view if exists delhi;
create or replace view delhi as (
select name,city,cuisine,cost,rating,rating_count from restaurants
where city='delhi' and rating > 4
order by rating desc );
select * from delhi;

-- 7. Create a view that lists restaurants along with total revenue (cost * rating_count).
create  view revenue as (
select name,city,cost,rating_count*cost as revenue from  restaurants);
select * from revenue;

-- 8. Create a view to show average rating by city.
-- with create or replace view we can change the condition and logic as mmany timme we want and if we execute it we will be geeting a uppdated output

create or replace view city_rating as (
select city,round(avg(rating),2) as average_rating from restaurants
group by city
order by average_rating desc);

select * from city_rating;

-- 9. Create a view showing the top 5 highest-rated restaurants in each city using window functions.
create or replace view top_5 as (
select * from(select name,city,cost,rating_count, rating_count*cost as revenue, row_number() over(partition by city order by rating_count*cost desc) as rank_ from restaurants) t
where t.rank_<6);

select * from top_5;

-- 10. Create a view to classify restaurants by rating:Rating ≥ 4.5 → "Excellent",4 ≤ Rating < 4.5 → "Good"
-- 3 ≤ Rating < 4 → "Average"Otherwise → "Poor"

create or replace view rating_system as(
select name,city,cost,rating,rating_count,
case
when rating >=4.5 then "Excellent"
when rating >=4 and rating<4.5 then "Good"
when rating>3 and rating<4 then "Average"
else "Poor"
end as rating_status
from restaurants);

select * from rating_system
















