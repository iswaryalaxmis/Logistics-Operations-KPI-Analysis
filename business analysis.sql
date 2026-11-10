
-- 1. On-time delivery percentage

SELECT
    ROUND(
        100.0 * SUM(
            CASE
                WHEN delivery_performance = 'On Time'
                THEN 1 ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS on_time_delivery_percentage
FROM logistics_orders
WHERE delivery_status = 'Delivered';


-- 2. Late deliveries by carrier

SELECT
    carrier,
    COUNT(*) AS delivered_orders,
    SUM(
        CASE
            WHEN delivery_performance = 'Late'
            THEN 1 ELSE 0
        END
    ) AS late_orders
FROM logistics_orders
WHERE delivery_status = 'Delivered'
GROUP BY carrier
ORDER BY late_orders DESC;


-- 3. Freight cost by region

SELECT
    region,
    ROUND(SUM(freight_cost_eur), 2) AS total_freight_cost
FROM logistics_orders
GROUP BY region
ORDER BY total_freight_cost DESC;


-- 4. Average delivery time by carrier

SELECT
    carrier,
    ROUND(AVG(delivery_days), 2) AS average_delivery_days
FROM logistics_orders
WHERE delivery_status = 'Delivered'
GROUP BY carrier
ORDER BY average_delivery_days;
