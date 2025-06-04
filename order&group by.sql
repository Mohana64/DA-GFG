use myntra;
select*from mdata;
-- Finding the names of unique brands
select distinct brand_name from mdata;
-- Finding the number of unique brands
select  count(distinct brand_name) as total_brandname from mdata;
-- Finding the number of products in each brands
select brand_tag,count( product_tag) as number_ofproducts from mdata group by brand_tag;
-- Finding the top 5 brand who has the most number of products | different product in their inventory
select brand_tag,count( product_tag) as number_ofproducts from mdata group by brand_tag
order by count( product_tag) desc limit 5;
-- Finding the top 5 brand who sold the most number of products
select brand_tag,sum(rating_count) as total_itemsold from mdata group by brand_tag
order by sum(rating_count) desc limit 5;
-- Finding the top 5 most expensive brands
select brand_name,round(avg(discounted_price))as top_expensivebrand from mdata
group by brand_name  order by round(avg(discounted_price)) desc limit 5;
-- Finding the top 5 least expensive brands
select brand_name, round(avg(discounted_price)) as least_expensive from mdata 
group by brand_name order by least_expensive limit 5;
-- Finding the top 10 best-selling product categories
select product_name, (sum(rating_count))as highselling_product from mdata
group by product_name order by highselling_product desc limit 10;
-- Finding the top 10 brands who gives maximum discount
select brand_name,avg(discount_percent)as max_discount from mdata
group by brand_name order by max_discount desc limit 10;
-- Finding the top 5 most expensive product categories
select product_tag,round(avg(discounted_price)) as price from mdata
group by product_tag order by price desc limit 5;
-- Which category of any specific brand is sold the most?
select product_name, brand_name, (sum(rating_count))as highselling_product from mdata
group by product_name,brand_name order by highselling_product desc limit 10;