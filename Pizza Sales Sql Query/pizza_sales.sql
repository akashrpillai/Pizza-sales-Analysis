USE PizzaSales;

-- Total No Of Records 
SELECT COUNT(DISTINCT pizza_id) AS Total_Records FROM pizzasales.pizza_sales;

-- All Data 
SELECT * FROM pizza_sales;

-- Total Sales of Pizza
SELECT SUM(total_price) AS Total_Sales FROM pizza_sales;

-- Average Order value
SELECT sum(total_price)/COUNT( DISTINCT order_id) AS Avg_order_value FROM pizza_sales;

-- Total Pizza's sold 
SELECT sum(quantity) AS Total_pizza_sold FROM pizza_sales;

-- Total Quantity Sold
SELECT COUNT( DISTINCT order_id) AS Total_Quantity_sold FROM pizza_sales;

-- Average Pizzas per order
SELECT round(sum(quantity)/COUNT( DISTINCT order_id),2) AS Avg_pizzas_per_order FROM pizza_sales;

-- Hourly Trend For Total Pizzas Sold
SELECT DATE_FORMAT(order_time, '%H') AS Order_Hour , SUM(quantity) AS Total_pizzas_sold 
FROM pizza_sales
GROUP BY DATE_FORMAT(order_time, '%H')
ORDER BY DATE_FORMAT(order_time, '%H');

-- Weekly Trend for the Total Orders
SELECT week(order_date,3) AS Week_Number,year(order_date) AS Year ,COUNT( DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY Week_Number,Year
ORDER BY Week_Number,Year;

-- % of Sales By Category 
SELECT pizza_category,sum(total_price) AS Total_sales_by_Category,
sum(total_price) * 100 / (SELECT sum(total_price) FROM pizza_sales WHERE month(order_date) = 1) AS Percent_Of_Total
FROM pizza_sales
WHERE month(order_date) = 1
GROUP BY pizza_category;

-- % of Sales By Size 
SELECT pizza_size, cast(sum(total_price) AS DECIMAL(10,2)) AS Total_sales_by_size,
round(sum(total_price) * 100 / (SELECT sum(total_price) FROM pizza_sales WHERE quarter(order_date) = 1),2) AS Percent_Of_Total
FROM pizza_sales
WHERE quarter(order_date) = 1
GROUP BY pizza_size
ORDER BY Percent_Of_Total DESC;

-- Total Pizzas Sold by category
SELECT pizza_category,sum(total_price) AS Total_sales_by_Category
FROM pizza_sales
GROUP BY pizza_category;

-- Top 5 best Sellers by Revnue , Total Quantity and Orders
-- REVENUE
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- QUANTITY
SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC
LIMIT 5;

-- ORDERS
SELECT pizza_name, COUNT( DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

-- Top 5 least Sellers by Revnue , Total Quantity and Orders
-- REVENUE
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

-- QUANTITY
SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC
LIMIT 5;

-- ORDERS
SELECT pizza_name, COUNT( DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;



