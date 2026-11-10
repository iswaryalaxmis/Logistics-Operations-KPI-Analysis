
-- 1. Total number of orders
SELECT COUNT(*) AS total_orders
FROM logistics_orders;


-- 2. Orders by region
SELECT
    region,
    COUNT(*) AS total_orders
FROM logistics_orders
GROUP BY region
ORDER BY total_orders DESC;


-- 3. Orders with high value
SELECT
    order_id,
    region,
    order_value_eur
FROM logistics_orders
WHERE order_value_eur > 1000
ORDER BY order_value_eur DESC;


-- 4. Average freight cost by carrier
SELECT
    carrier,
    ROUND(AVG(freight_cost_eur), 2) AS avg_freight_cost
FROM logistics_orders
GROUP BY carrier
ORDER BY avg_freight_cost DESC;
