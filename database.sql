USE sales_order_analytics;


-- 1. DATABASE STRUCTURE

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

DESCRIBE orders;


-- Order Items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

DESCRIBE order_items;


-- Payments table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(30) NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

SHOW TABLES;

-- 2. CUSTOMER DATA

INSERT INTO customers
(customer_id, name, email, city, signup_date)
VALUES
(1, 'Rahul Sharma', 'rahul.sharma@gmail.com', 'Mumbai', '2025-01-15'),
(2, 'Priya Patel', 'priya.patel@gmail.com', 'Pune', '2025-02-20'),
(3, 'Aman Verma', 'aman.verma@gmail.com', 'Delhi', '2025-03-10'),
(4, 'Sneha Das', 'sneha.das@gmail.com', 'Bhubaneswar', '2025-04-05'),
(5, 'Arjun Mehta', 'arjun.mehta@gmail.com', 'Bangalore', '2025-05-18'),
(6, 'Neha Singh', 'neha.singh@gmail.com', 'Hyderabad', '2025-06-22'),
(7, 'Rohan Gupta', 'rohan.gupta@gmail.com', 'Kolkata', '2025-07-12'),
(8, 'Ananya Roy', 'ananya.roy@gmail.com', 'Chennai', '2025-08-30'),
(9, 'Vikash Kumar', 'vikash.kumar@gmail.com', 'Jaipur', '2025-09-14'),
(10, 'Kavya Nair', 'kavya.nair@gmail.com', 'Kochi', '2025-10-25');


SELECT *
FROM customers;


-- 3. PRODUCT DATA

INSERT INTO products
(product_id, product_name, category, price, stock)
VALUES
(101, 'Laptop', 'Electronics', 55000.00, 25),
(102, 'Wireless Mouse', 'Electronics', 1200.00, 80),
(103, 'Mechanical Keyboard', 'Electronics', 3500.00, 45),
(104, 'Office Chair', 'Furniture', 8500.00, 30),
(105, 'Desk Lamp', 'Furniture', 1800.00, 60),
(106, 'Backpack', 'Accessories', 2200.00, 50),
(107, 'Headphones', 'Electronics', 2500.00, 70),
(108, 'Smart Watch', 'Electronics', 6500.00, 35),
(109, 'Water Bottle', 'Accessories', 800.00, 100),
(110, 'Notebook', 'Stationery', 300.00, 150);


SELECT *
FROM products;


-- 4. ORDER DATA

INSERT INTO orders
(order_id, customer_id, order_date, status, total_amount)
VALUES
(1001, 1, '2026-01-05', 'COMPLETED', 56200.00),
(1002, 2, '2026-01-12', 'COMPLETED', 3500.00),
(1003, 3, '2026-01-20', 'COMPLETED', 8500.00),
(1004, 4, '2026-01-25', 'CANCELLED', 2200.00),
(1005, 5, '2026-02-03', 'COMPLETED', 6500.00),
(1006, 1, '2026-02-15', 'COMPLETED', 3700.00),
(1007, 6, '2026-02-22', 'PENDING', 55000.00),
(1008, 7, '2026-03-02', 'COMPLETED', 3000.00),
(1009, 8, '2026-03-10', 'COMPLETED', 10300.00),
(1010, 9, '2026-03-18', 'COMPLETED', 2500.00),
(1011, 10, '2026-03-25', 'COMPLETED', 1800.00),
(1012, 2, '2026-04-04', 'COMPLETED', 57700.00),
(1013, 3, '2026-04-15', 'COMPLETED', 2800.00),
(1014, 5, '2026-04-22', 'CANCELLED', 8500.00),
(1015, 1, '2026-05-05', 'COMPLETED', 8700.00);


SELECT *
FROM orders;


-- ============================================================
-- 5. ORDER ITEM DATA
-- ============================================================

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1001, 101, 1, 55000.00),
(2, 1001, 102, 1, 1200.00),
(3, 1002, 103, 1, 3500.00),
(4, 1003, 104, 1, 8500.00),
(5, 1004, 106, 1, 2200.00),
(6, 1005, 108, 1, 6500.00),
(7, 1006, 103, 1, 3500.00),
(8, 1006, 105, 1, 1800.00),
(9, 1007, 101, 1, 55000.00),
(10, 1008, 107, 1, 2500.00),
(11, 1008, 109, 1, 500.00),
(12, 1009, 104, 1, 8500.00),
(13, 1009, 106, 1, 1800.00),
(14, 1010, 107, 1, 2500.00),
(15, 1011, 105, 1, 1800.00),
(16, 1012, 101, 1, 55000.00),
(17, 1012, 102, 1, 1200.00),
(18, 1012, 103, 1, 1500.00),
(19, 1013, 109, 2, 800.00),
(20, 1013, 102, 1, 1200.00),
(21, 1014, 104, 1, 8500.00),
(22, 1015, 104, 1, 8500.00);


SELECT *
FROM order_items;


-- 6. PAYMENT DATA

INSERT INTO payments
(payment_id, order_id, payment_date, amount, payment_status)
VALUES
(5001, 1001, '2026-01-05', 56200.00, 'PAID'),
(5002, 1002, '2026-01-12', 3500.00, 'PAID'),
(5003, 1003, '2026-01-20', 8500.00, 'PAID'),
(5004, 1004, '2026-01-25', 2200.00, 'REFUNDED'),
(5005, 1005, '2026-02-03', 6500.00, 'PAID'),
(5006, 1006, '2026-02-15', 3700.00, 'PAID'),
(5007, 1007, '2026-02-22', 55000.00, 'PENDING'),
(5008, 1008, '2026-03-02', 3000.00, 'PAID'),
(5009, 1009, '2026-03-10', 10300.00, 'PAID'),
(5010, 1010, '2026-03-18', 2500.00, 'PAID'),
(5011, 1011, '2026-03-25', 1800.00, 'PAID'),
(5012, 1012, '2026-04-04', 57700.00, 'PAID'),
(5013, 1013, '2026-04-15', 2800.00, 'PAID'),
(5014, 1014, '2026-04-22', 8500.00, 'REFUNDED'),
(5015, 1015, '2026-05-05', 8700.00, 'PAID');


SELECT *
FROM payments;


-- 7. ADDITIONAL TRANSACTION

-- New customer
INSERT INTO customers
(customer_id, name, email, city, signup_date)
VALUES
(11, 'Meera Kapoor', 'meera.kapoor@gmail.com', 'Mumbai', '2025-11-15');


-- New completed order
INSERT INTO orders
(order_id, customer_id, order_date, status, total_amount)
VALUES
(1016, 11, '2026-05-20', 'COMPLETED', 6500.00);


-- Order item for order 1016
INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(23, 1016, 108, 1, 6500.00);


-- Payment for order 1016
INSERT INTO payments
(payment_id, order_id, payment_date, amount, payment_status)
VALUES
(5016, 1016, '2026-05-20', 6500.00, 'PAID');


-- Verify new transaction
SELECT *
FROM customers
WHERE customer_id = 11;

SELECT *
FROM orders
WHERE order_id = 1016;

SELECT *
FROM order_items
WHERE order_id = 1016;

SELECT *
FROM payments
WHERE order_id = 1016;

-- 8. CRUD OPERATIONS

-- CREATE / INSERT
INSERT INTO customers
(customer_id, name, email, city, signup_date)
VALUES
(100, 'Reyansh Sharma', 'rey01@gmail.com', 'Delhi', '2026-05-20');

SELECT *
FROM customers
WHERE customer_id = 100;


-- UPDATE
UPDATE customers
SET city = 'Pune'
WHERE customer_id = 11;

SELECT *
FROM customers
WHERE customer_id = 11;


-- DELETE
DELETE FROM customers
WHERE customer_id = 100;

SELECT *
FROM customers
WHERE customer_id = 100;


-- 9. SQL VIEW


DROP VIEW IF EXISTS vw_customer_completed_revenue;

CREATE VIEW vw_customer_completed_revenue AS
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS completed_orders,
    SUM(o.total_amount) AS total_revenue,
    ROUND(AVG(o.total_amount), 2) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY
    c.customer_id,
    c.name;


SELECT *
FROM vw_customer_completed_revenue
ORDER BY total_revenue DESC;


-- 10. QUERY OPTIMIZATION - EXPLAIN BEFORE INDEX

EXPLAIN
SELECT *
FROM orders
WHERE status = 'COMPLETED';


-- 11. INDEXING

CREATE INDEX idx_orders_status_date
ON orders(status, order_date);


SHOW INDEX FROM orders;


-- 12. EXPLAIN AFTER INDEX


EXPLAIN
SELECT *
FROM orders
WHERE status = 'COMPLETED';


-- 13. EXPLAIN FOR MONTHLY REVENUE QUERY

EXPLAIN
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS monthly_revenue
FROM orders
WHERE status = 'COMPLETED'
GROUP BY
    YEAR(order_date),
    MONTH(order_date);