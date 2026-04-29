USE SQL_PROJECT_1;

-- Select olny 10 rows in result.
SELECT * FROM retail_sales LIMIT 10;

-- Select all from table order by sale_date
SELECT * FROM retail_sales ORDER BY sale_date ;

-- Data Cleaning
SELECT * FROM retail_sales
WHERE 
transactions_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR gender IS NULL OR category IS NULL OR quantity IS NULL OR cogs IS NULL OR total_sale IS NULL;

DELETE FROM retail_sales
WHERE 
transactions_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR gender IS NULL OR category IS NULL OR quantity IS NULL OR cogs IS NULL OR total_sale IS NULL;


-- Data Exploration

-- How many sales we have?
SELECT COUNT(*) as total_sale FROM retail_sales;

-- How many uniuque customers we have ?
SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales;

-- How many category are there?
SELECT DISTINCT category FROM retail_sales;

-- Retrieve all transactions where the category is Clothing.
select sum(total_sale)as Total_transactions from retail_sales where category ="Clothing";

-- Find the total sales for each category.
select category,sum(total_sale)as Total_sale from retail_sales group by category;

-- List all customers who purchased Beauty products in December 2022.
select customer_id from retail_sales where category like '%Beauty%' and year(sale_date)like '2022%'and month(sale_date)like '%11%'
order by customer_id;

-- Show the top 5 highest sales transactions.
select distinct total_sale from retail_sales order by total_sale desc limit 5;

-- Count how many transactions were made by male vs female customers.
select gender,count(total_sale) from retail_sales group by gender;

-- Average age of customers who purchased items from the 'Beauty' category.
SELECT ROUND(AVG(age), 2) as avg_age FROM retail_sales WHERE category = 'Beauty';

-- Calculate the average age of customers buying Electronics.
SELECT ROUND(AVG(age), 2) as avg_age_buying_elctronics FROM retail_sales WHERE category = 'Electronics';

-- Find the month with the highest total sales.
select month(sale_date)as Month_ ,year(sale_date)as Year_,sum(total_sale)AS Sale from retail_sales group by month(sale_date),
year(sale_date) ORDER BY Sale desc; 

-- Identify customers who made more than 3 purchases.
select customer_id ,count(customer_id)as More_than_3_purchases from retail_sales group by customer_id having count(customer_id)>3
order by count(customer_id) desc ;

-- Show the profit margin (total_sale – cogs) for each transaction.
select * ,(total_sale - (cogs * quantity)) AS profit_margin FROM retail_sales;

-- Group sales by age group (e.g., 18–25, 26–40, 41–60, 61+) and show total revenue.
  SELECT CASE 
             WHEN age BETWEEN 18 AND 25 THEN 'Age 18–25'
             WHEN age BETWEEN 26 AND 40 THEN 'Age 26–40'
             WHEN age BETWEEN 41 AND 60 THEN 'Age 41–60'
		     ELSE 'Age 61+' 
		 END AS Age_group,SUM(total_sale) AS Total_revenue
FROM retail_sales GROUP BY Age_group order by Age_group;

-- Rank customers by total spending and show the top 10.
SELECT customer_id,SUM(total_sale) AS total_spending,RANK() OVER (ORDER BY SUM(total_sale) DESC)AS spending_rank
FROM retail_sales GROUP BY customer_id ORDER BY spending_rank LIMIT 10;

-- Find the most popular product category for each age group.
SELECT age_group,category,COUNT(*) AS transactions_count FROM 
									    (SELECT CASE 
                                                  WHEN age BETWEEN 18 AND 25 THEN 'Age 18–25'
			                                      WHEN age BETWEEN 26 AND 40 THEN 'Age 26–40'
												  WHEN age BETWEEN 41 AND 60 THEN 'Age 41–60'
                                                  ELSE 'Age 61+' 
                                                END AS age_group,category FROM retail_sales) AS grouped
GROUP BY age_group, category ORDER BY age_group, transactions_count DESC;


-- Compare seasonal sales trends (Q1 vs Q4).
SELECT CASE 
         WHEN MONTH(sale_date) BETWEEN 1 AND 3 THEN 'Q1'
         WHEN MONTH(sale_date) BETWEEN 10 AND 12 THEN 'Q4'
       END AS quarter,
       SUM(total_sale) AS total_revenue
FROM retail_sales WHERE MONTH(sale_date) BETWEEN 1 AND 3 OR MONTH(sale_date) BETWEEN 10 AND 12 GROUP BY quarter;

select*from retail_sales ;
/*
create table seasonal_sales_trends as
SELECT CASE 
         WHEN MONTH(sale_date) BETWEEN 1 AND 3 THEN 'Q1'
         WHEN MONTH(sale_date) BETWEEN 10 AND 12 THEN 'Q4'
       END AS quarter,
       SUM(total_sale) AS total_revenue
FROM retail_sales WHERE MONTH(sale_date) BETWEEN 1 AND 3 OR MONTH(sale_date) BETWEEN 10 AND 12 GROUP BY quarter;
*/


