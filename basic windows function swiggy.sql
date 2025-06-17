-- Rank every restaurant from most expensive to least expensive
select *, rank() over(order by cost desc) as Rank_ from restaurants;
--  Rank every restaurant from most visited to least visited
select name,city,cost,rating_count,rank()over(order by rating_count desc) as rank_ from restaurants;
--  Rank every restaurant from most expensive to least expensive as per their city
select name,city,cost, rank() over(partition by city order by cost) as rank_city from restaurants;
-- Dense-rank every restaurant from most expensive to least expensive as per their city
select name,city,cost,dense_rank() over(partition by city order by cost) as densE_ranks from restaurants;
-- Row-number every restaurant from most expensive to least expensive as per their city
select name,city,cost,row_number() over  (partition by city order by cost) as row_num from restaurants;
-- Row_num,rank,dense_rank of every restaurant from most expensive to least expensive as per their city
select name,city,cost ,rank() over(partition by city order by cost) as rank_,
dense_rank() over (partition by city order by cost) as dense_ran,
row_number() over (partition by city order by cost) as row_num from restaurants;
-- Rank every restaurant from most expensive to least expensive as per their city along with its city [Adilabad - 1, Adilabad - 2]
select name,city,cost ,concat(city,'-',rank() over(partition by city order by cost)) as rank_city  from restaurants;
select *, concat(city ,'-',row_number() over(partition by city order by cost desc)) as rank_ from restaurants;
-- Find top 5 restaurants of every city as per their revenue
select * from (
	select *, 
		cost*rating_count as 'revenue',
		row_number() over(partition by city order by rating_count*cost desc) as 'rank' 
	from restaurants
) t where t.rank <= 5;