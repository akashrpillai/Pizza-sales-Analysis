CREATE DATABASE IF NOT EXISTS PizzaSales;
USE PizzaSales;

CREATE TABLE IF NOT EXISTS pizza_sales (
    pizza_id INT PRIMARY KEY,  
    order_id INT,
    pizza_name_id VARCHAR(50),
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price FLOAT,
    total_price FLOAT,
    pizza_size VARCHAR(50),
    pizza_category VARCHAR(50),
    pizza_ingredients VARCHAR(300),
    pizza_name VARCHAR(100)
);
SELECT * FROM pizza_sales;
