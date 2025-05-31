create database myntra
use myntra
select * from datam
select ï»¿product_name as product_name from datam
select distinct ï»¿product_name as product_name from datam
-- showing specific columns
select brand_name, from datam
select ï»¿product_name as product_name,product_tag,marked_price,discounted_price from datam 
-- showing specific column in specific order
select ï»¿product_name as product_name,brand_name,rating_count from datam order by rating_count,brand_name 
-- create new column with mathemtical functions | Making Discounted Amount

select ï»¿product_name as product_name,marked_price,discounted_price,
marked_price - discounted_price as 'discount_amount'as total_price from datam;
-- Finding UNIQUE value
select distinct ï»¿product_name,brand_name from datam
-- Finding total products
select count(ï»¿product_name)as product_name from datam
select count(*) from datam
-- Finding the max value;
select max(discounted_price) as max_price from datam
select max(discount_percent)as max_discount from datam
select max(rating_count) as max_count from datam
select max(rating) as max_rating from datam

-- Finding the min value
select min(discounted_price) as min_price from datam
select min(discount_percent)as min_discount from datam
select min(rating_count) as minrating_count from datam
select min(rating) as min_rating from datam
select min(discount_amount) as min_disamount from datam
-- Finding the average value
select avg(marked_price) as average_marketprice from datam
select avg(discounted_price) as average_discountedprice from datam
select avg(rating_count) as average_ratingcount from datam
-- where clause
-- find most,least expensive, average disocunted and marked price of adidas products
select max(discounted_price)as most_disprice,min(discounted_price) as least_dprice,
avg(discounted_price) as avg_dprice,avg(marked_price)as avg_mprice from datam where brand_name="adidas";

-- finding the average value of brand puma
 select sum(discounted_price) as total_price,avg(discounted_price) as average_value, max(discounted_price) as max_pumadiscountprice,
 min(discounted_price) as min_discounprice from datam where brand_name="puma";
 -- Creating new columns of total revenue genereated by each product
 select sum(discounted_price * rating_count) as 'Revenue',
		count(product_tag) as 'Products',
        sum(discounted_price * rating_count)/count(product_tag) as 'Revenue per Product'
        from datam;
	-- Total Revenue Generate, Products Sold in tshirt
    select sum(discounted_price * rating_count) as Revenue,
    sum(rating_count) as products_sold from datam where brand_tag="tshirt";
    -- Finding number of products in Nike
select count(product_tag) as total_product from datam where brand_name="nike";
-- Finding the number of categories nike serves
select count(*) as Total_products from datam where brand_name="nike";
-- Finding the name of categories nike serves
select distinct(ï»¿product_name) as total_products from datam where brand_name="nike";

-- Finding the number of brands serves on myntra
select  distinct count(brand_tag) as Total_brands from datam;
select count(brand_name) as Total_brands from datam;

-- round | Product with best rating | rating * rating
select ï»¿product_name as product_name, round(rating * rating_count,3) as round_ratinf from datam;

-- Adding Distinct with Where | Unique Products served by Adidas

select distinct(ï»¿product_name)as product_name from datam where brand_name="adidas";
-- Products with Multiple Where Clause with AND
select (ï»¿product_name)as product_name from datam where rating_count=4 and  brand_name="nike";
-- name of the brands selling shirts with price more than 5000
select distinct(brand_name) as Total_brand from datam where product_tag="shirts" and discounted_price > 5000;

-- different categories "Blackberrys" serves in under 5000rs
select (product_tag) as Total_categories from datam where brand_name="Blackberrys" and discounted_price<5000;

-- nike tshirts between 2000-3000
Select * from datam where brand_name='NIKE' AND product_tag='tshirts' and discounted_price between 2000 and 30000;

-- tshirts between 2000-3000 from either nike or adidas
select * from datam where  brand_name="nike" or brand_name= "adidas" and product_tag="tshirts" and discounted_price between 2000 and 30000;

-- multiple filters
select distinct * from datam 
where brand_tag = 'adidas' and (discounted_price between 3000 and  8000) 
				and rating > 4 and rating_count > 10;
-- Using OR
select distinct * from datam
where (brand_tag = 'adidas' or brand_tag = 'puma') and 
			(discounted_price between 5000 and  8000) ;
-- using not
select distinct * from datam where not (brand_tag="adidas");

-- Using NOT IN
select distinct* from datam where brand_tag not in ("adidas" and "puma");
select distinct* from datam where brand_tag not in ("adidas" , "puma") and (discounted_price between 5000 and 8000)







 


 









