select distinct count(brand_tag) as total_brand from datam;

select count(*) as total_tshirts from datam where product_tag="tshirts";

select count(distinct(product_link)) as total_products from datam where product_tag="tshirts" and discounted_price<2000; 

select  distinct count(brand_name) as total_tshirts from datam where product_tag="tshirts";

select distinct count(product_tag) as total_handm from datam where brand_name="H&M";

select *   from datam where brand_name="nike" and product_tag="tshirts" order by rating_count desc  limit 5;

select *   from datam where brand_name="Guess" and product_tag="tshirts" order by rating_count  ;

select sum(rating_count) from datam where brand_name="levis";

select sum(rating_count) from datam where product_tag="tshirts";

select brand_name ,sum(rating_count) from datam group by brand_name order by sum(rating_count) desc limit 5;

select product_tag, sum(rating_count) from datam group by product_tag;

select product_tag,sum(rating_count*discounted_price) as total_revenue from datam where product_tag in ("tshirts","shirts") group by product_tag;

select* from datam