
USE food_delivery_analytics;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE,
    gender VARCHAR(10),
    age INT
);
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    cuisine VARCHAR(50),
    city VARCHAR(50),
    rating DECIMAL(2,1)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_date DATETIME,
    order_amount DECIMAL(10,2),
    payment_method VARCHAR(30),
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
CREATE TABLE delivery_agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(100),
    city VARCHAR(50),
    joining_date DATE
);
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    agent_id INT,
    delivery_time_minutes INT,
    delivery_status VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (agent_id) REFERENCES delivery_agents(agent_id)
);
INSERT INTO customers VALUES
(1, 'Aman Verma', 'Delhi', '2024-01-10', 'Male', 25),
(2, 'Riya Sharma', 'Mumbai', '2024-02-12', 'Female', 28),
(3, 'Karan Mehta', 'Bangalore', '2024-03-15', 'Male', 31),
(4, 'Neha Singh', 'Delhi', '2024-01-20', 'Female', 24),
(5, 'Arjun Patel', 'Pune', '2024-04-11', 'Male', 30),
(6, 'Simran Kaur', 'Chandigarh', '2024-02-18', 'Female', 27),
(7, 'Rahul Gupta', 'Jaipur', '2024-03-05', 'Male', 35),
(8, 'Priya Nair', 'Hyderabad', '2024-01-25', 'Female', 29),
(9, 'Vikas Sharma', 'Mumbai', '2024-04-02', 'Male', 32),
(10, 'Sneha Joshi', 'Delhi', '2024-05-01', 'Female', 26);
INSERT INTO restaurants VALUES
(101, 'Spicy Hub', 'Indian', 'Delhi', 4.5),
(102, 'Pizza Heaven', 'Italian', 'Mumbai', 4.2),
(103, 'Burger Point', 'Fast Food', 'Bangalore', 4.0),
(104, 'Royal Biryani', 'Mughlai', 'Hyderabad', 4.7),
(105, 'Tandoori Treat', 'Indian', 'Delhi', 4.4),
(106, 'Pasta Palace', 'Italian', 'Pune', 4.1),
(107, 'Sushi World', 'Japanese', 'Mumbai', 4.6),
(108, 'Cafe Mocha', 'Cafe', 'Jaipur', 4.3),
(109, 'Wrap Factory', 'Fast Food', 'Bangalore', 4.2),
(110, 'South Spice', 'South Indian', 'Chandigarh', 4.5);
INSERT INTO orders VALUES
(1001, 1, 101, '2025-01-10 19:30:00', 550, 'UPI', 'Delivered'),
(1002, 2, 102, '2025-01-11 20:00:00', 780, 'Card', 'Cancelled'),
(1003, 3, 103, '2025-01-12 18:15:00', 320, 'Cash', 'Delivered'),
(1004, 4, 105, '2025-01-13 21:10:00', 890, 'UPI', 'Delivered'),
(1005, 5, 106, '2025-01-14 13:00:00', 450, 'Card', 'Delivered'),
(1006, 6, 110, '2025-01-15 14:20:00', 600, 'Cash', 'Delivered'),
(1007, 7, 108, '2025-01-15 19:00:00', 300, 'UPI', 'Delivered'),
(1008, 8, 104, '2025-01-16 20:40:00', 950, 'Card', 'Delivered'),
(1009, 9, 107, '2025-01-17 18:30:00', 1200, 'UPI', 'Delivered'),
(1010, 10, 101, '2025-01-18 21:00:00', 500, 'Cash', 'Cancelled'),
(1011, 1, 105, '2025-01-19 13:20:00', 700, 'UPI', 'Delivered'),
(1012, 2, 102, '2025-01-20 20:30:00', 650, 'Card', 'Delivered'),
(1013, 3, 103, '2025-01-21 19:10:00', 400, 'Cash', 'Delivered'),
(1014, 4, 104, '2025-01-22 21:50:00', 1100, 'UPI', 'Delivered'),
(1015, 5, 106, '2025-01-23 12:45:00', 480, 'Card', 'Delivered');
INSERT INTO delivery_agents VALUES
(201, 'Rahul Singh', 'Delhi', '2023-04-01'),
(202, 'Vikas Kumar', 'Mumbai', '2023-05-10'),
(203, 'Ajay Sharma', 'Bangalore', '2023-06-15'),
(204, 'Deepak Yadav', 'Delhi', '2023-07-20'),
(205, 'Manish Verma', 'Hyderabad', '2023-08-12');
INSERT INTO deliveries VALUES
(301, 1001, 201, 28, 'Delivered'),
(302, 1002, 202, 0, 'Cancelled'),
(303, 1003, 203, 22, 'Delivered'),
(304, 1004, 204, 35, 'Delivered'),
(305, 1005, 205, 25, 'Delivered'),
(306, 1006, 201, 30, 'Delivered'),
(307, 1007, 202, 20, 'Delivered'),
(308, 1008, 203, 40, 'Delivered'),
(309, 1009, 204, 32, 'Delivered'),
(310, 1010, 205, 0, 'Cancelled'),
(311, 1011, 201, 27, 'Delivered'),
(312, 1012, 202, 24, 'Delivered'),
(313, 1013, 203, 26, 'Delivered'),
(314, 1014, 204, 38, 'Delivered'),
(315, 1015, 205, 21, 'Delivered');
SELECT * FROM customers;
SELECT * FROM restaurants;
SELECT * FROM orders;
SELECT * FROM delivery_agents;
SELECT * FROM deliveries;
SELECT *
FROM orders
WHERE order_amount IS NULL;
SELECT COUNT(*) AS total_orders
FROM orders;
SELECT SUM(order_amount) AS total_revenue
FROM orders
WHERE order_status = 'Delivered';
SELECT ROUND(AVG(order_amount),2) AS avg_order_value
FROM orders;
SELECT payment_method,
       COUNT(*) AS total_orders
FROM orders
GROUP BY payment_method
ORDER BY total_orders DESC;
SELECT c.customer_name,
       SUM(o.order_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;
SELECT r.restaurant_name,
       SUM(o.order_amount) AS revenue
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE o.order_status = 'Delivered'
GROUP BY r.restaurant_name
ORDER BY revenue DESC;
SELECT r.city,
       SUM(o.order_amount) AS city_revenue
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE o.order_status = 'Delivered'
GROUP BY r.city
ORDER BY city_revenue DESC;
SELECT DATE_FORMAT(order_date,'%Y-%m') AS month,
       SUM(order_amount) AS revenue
FROM orders
WHERE order_status = 'Delivered'
GROUP BY month
ORDER BY month;
SELECT da.agent_name,
       ROUND(AVG(d.delivery_time_minutes),2) AS avg_delivery_time
FROM delivery_agents da
JOIN deliveries d
ON da.agent_id = d.agent_id
WHERE d.delivery_status = 'Delivered'
GROUP BY da.agent_name
ORDER BY avg_delivery_time;
SELECT 
ROUND(
    SUM(CASE 
            WHEN order_status = 'Cancelled' 
            THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
2) AS cancellation_rate_percentage
FROM orders;