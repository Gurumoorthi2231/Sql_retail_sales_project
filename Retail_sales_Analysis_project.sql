select * from retail_sales;

select * from retail_sales
where
 transactions_id is  null
 or
 sale_date is null
 or
 sale_time is null
 or
 customer_id is null
 or 
 gender is null
 or
 age is null
 or
 category is null
 or
 quantiy is null
 or
 price_per_unit is null
 or
 cogs is null
 or
 total_sale is null;

delete from retail_sales
where
 transactions_id is  null
 or
 sale_date is null
 or
 sale_time is null
 or
 customer_id is null
 or 
 gender is null
 or
 age is null
 or
 category is null
 or
 quantiy is null
 or
 price_per_unit is null
 or
 cogs is null
 or
 total_sale is null;
 
 #data Exploration
 
 #How many sales we have?
 select count(*) as total_sales from retail_sales;
 
 #how many unique customers we have?
 select count(distinct customer_id)as customers from retail_sales;
 
 #How many unique category we have?
 select distinct category as category from retail_sales;
 
 #Data Analysis & Business key problems & Answers
 #Q.1 Write a SQL Query to retrieve all columns for sales made on '2022-11-05'
 #Q.2 Write a SQL Query to retrieve all transactions where the category is 'clothing'and the quantity sold is more than 10 in the month of nov-2022
 
#Q.3 Write a SQL Query to calculate the total (total_sale) for each category.
#Q.4 Write a SQL Query to find average age of customers who purchased the item from the 'Beauty' Category.
#Q.5 Write a SQL Query to find all transactions where the total_sale is greater than 1000.
#Q.6 Write a SQL Query to find the total number of transactions (transaction_id) made by each gender in category.
#Q.7 Write a SQL Query to calculate the average sale for each month.find out best selling month in year.
#Q.8 Write a SQL Query to find top 5 customers based on the highest total sales.
#Q.9 Write a SQL Query to find the number of unique customers who purchased items for each category.
#Q.10 Write a SQL Query to create each shift and number of orders (Example Morning <=12, Afternoon between 12 & 17,Evening > 17)
 
  #Q.1 Write a SQL Query to retrieve all columns for sales made on '2022-11-05'
  Select * from retail_sales where sale_date = "2022-11-05";
  
  #Q.2 Write a SQL Query to retrieve all transactions where the category is 
  #'clothing'and the quantity sold is more than 4 in the month of nov-2022
  
  select * from retail_sales
  where category="clothing"
  and year(sale_date)=2022
  and month(sale_date)=11
  and quantiy>=4;
  
  #Q.3 Write a SQL Query to calculate the total (total_sale) for each category.
  
  select 
  category,
  sum(total_sale) as total_sale,
  count(*) as total_orders
  from retail_sales
  group by category;
  
  #Q.4 Write a SQL Query to find average age of customers who purchased the item from the 'Beauty' Category.
  
  select 
  round(avg(age),2) as avg_age from retail_sales 
  where category="Beauty";
  
  #Q.5 Write a SQL Query to find all transactions where the total_sale is greater than 1000.
  
  select * from retail_sales 
  where total_sale >1000;
  
  #Q.6 Write a SQL Query to find the total number of transactions (transaction_id) made by each gender in category.
  
  select 
  gender,category,
  count(*) as transaction
  from retail_sales
  group by gender,category
  order by 1;
  
  #Q.7 Write a SQL Query to calculate the average sale for each month.find out best selling month in year.
  
  select 
  year(sale_date) as year,
  month(sale_date) as month,
  round(avg(total_sale),2) as avg_sale
  from retail_sales
  group by year,month 
  order by year;
  
  #Q.8 Write a SQL Query to find top 5 customers based on the highest total sales.
  
 select 
 customer_id,
 sum(total_sale) as total_sale
 from retail_sales
 group by 1
 order by 2 desc
 limit 5;
 
 #Q.9 Write a SQL Query to find the number of unique customers who purchased items for each category.
 
select category,
count(distinct customer_id) as cus_unique from retail_sales
group by 1;

#Q.10 Write a SQL Query to create each shift and number of orders 
#(Example Morning <=12, Afternoon between 12 & 17,Evening > 17)	

select 
    case
       when hour(sale_time)<=12 then 'Morning'
       when hour(sale_time) between 12 and 17 then 'Afternoon'
       else 'Evening'
	End as shift,
    count(*) as total_orders
from retail_sales
group by shift;
  
##End of Project
 
 
 