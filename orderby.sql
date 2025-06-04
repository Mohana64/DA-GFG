create database myntra;
use myntra;
select*from mdata;
-- Finding the most expensive product on myntra
select marked_price from mdata order by marked_price desc limit 1;
-- Finding the least expensive product on myntra
select marked_price from mdata order by marked_price limit 1;
-- Finding the top 5 most expensive product on myntra
select marked_price from mdata order by marked_price desc limit 5;
-- Top 5 products based on best rating | rating*rating count
select rating,rating_count,(rating * rating_count) as top_rating from mdata order by(rating * rating_count) desc limit 5;
-- Finding the second most expensive product
select marked_price from mdata order by marked_price desc limit 2;
-- Finding the second least expensive product
select marked_price from mdata order by marked_price limit 2;
-- Finding the 10th most expensive product
select marked_price from mdata order by marked_price desc limit 10;
-- Finding the worst rated product by nike
select product_name,rating as worst_rated from mdata where brand_name="nike" order by rating;
-- Finding the worst rated product by nike & rating is not zero
select product_name,(rating * rating_count) as worst_rated from mdata
 where brand_name="nike" and  rating <>0 order by (rating * rating_count) limit 1;
-- Finding the top 10 best rated tshirt from nike or adidas | rating*rating count
select product_name,(rating*rating_count) as top_rated from mdata
 where product_tag="tshirts" and brand_name="nike" or "adidas" 
order by (rating*rating_count)desc limit 10;
--  Worst rated 10 products based on the rating of 100 people atleast
select product_name, rating,(rating*rating_count) as worst_rated from mdata where rating_count >=100 
order by (rating*rating_count) limit 10;
-- 10 worst rated tshirt based on the rating of 100 people atleast
select product_name,rating,(rating*rating_count) as worst_rated from mdata
where product_tag="tshirts" and rating_count >=100 order by (rating*rating_count) limit 10;
-- Sort the products in alphaetical descending order based on their product_name and show the last 10 of them
select product_name from mdata order by product_name desc limit 10;
-- Finding the top 10 best rated tshirt from nike or adidas | rating*rating count
select product_name,(rating*rating_count) as total_rated from mdata
 where product_tag="tshirts" and brand_name="nike" or "adidas"
 order by (rating*rating_count) desc limit 10;
 -- Finding the list of tshirts from nike and adidas prices between 1000 and 1200 | Sort them based on ascending order of brand_name & price
 select product_name, brand_name,discounted_price from mdata
 where product_tag="tshirts" and brand_tag="nike" or "adidas" and discounted_price between 1000 and 1200
 order by brand_name , discounted_price ;
 





