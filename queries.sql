-- E-Commerce SQL Queries
-- Created by Muskan Harsh

-- 1. All customers
SELECT * FROM customers;

-- 2. Top 5 products by price
SELECT * FROM products
ORDER BY price DESC
LIMIT 5;

-- 3. All orders with customer names
SELECT o.order_id, c.first_name, c.last_name, o.order_date
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id;

-- 4. Total spending per customer
SELECT c.first_name, c.last_name,
SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

-- 5. Top selling products
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC;
