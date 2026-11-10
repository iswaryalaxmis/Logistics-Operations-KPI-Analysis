SHOW DATABASES;

CREATE DATABASE logistics_project;

USE logistics_project;

CREATE TABLE logistics_orders (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date DATE,
    region VARCHAR(50),
    warehouse_id VARCHAR(20),
    carrier VARCHAR(50),
    product_category VARCHAR(100),
    quantity INT,
    order_value_eur DECIMAL(10,2),
    freight_cost_eur DECIMAL(10,2),
    estimated_delivery_date DATE,
    actual_delivery_date DATE,
    delivery_status VARCHAR(30),
    customer_rating INT,
    delivery_days INT,
    delay_days INT,
    delivery_performance VARCHAR(30)
);

SELECT *
FROM logistics_orders
LIMIT 10;

SELECT COUNT(*) AS total_records
FROM logistics_orders;

DESCRIBE logistics_orders;

SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM logistics_orders
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT
    SUM(order_id IS NULL) AS missing_order_ids,
    SUM(region IS NULL) AS missing_regions,
    SUM(carrier IS NULL) AS missing_carriers,
    SUM(actual_delivery_date IS NULL) AS missing_delivery_dates
FROM logistics_orders;

SELECT
    delivery_status,
    COUNT(*) AS total_orders
FROM logistics_orders
GROUP BY delivery_status;


SELECT
    carrier,
    COUNT(*) AS total_delivered_orders,
    SUM(
        CASE
            WHEN delivery_performance = 'Late'
            THEN 1
            ELSE 0
        END
    ) AS late_orders
FROM logistics_orders
WHERE delivery_status = 'Delivered'
GROUP BY carrier
ORDER BY late_orders DESC;

USE logistics_project;

SELECT COUNT(*) AS imported_records
FROM logistics_orders;