
-- 1. CASE WHEN: Categorise delivery performance

SELECT
    order_id,
    carrier,
    delay_days,
    CASE
        WHEN delay_days <= 0 THEN 'On Time'
        WHEN delay_days > 0 THEN 'Late'
        ELSE 'Not Delivered'
    END AS delivery_category
FROM logistics_orders;


-- 2. CTE: Calculate carrier performance

WITH carrier_metrics AS (
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
)

SELECT
    carrier,
    delivered_orders,
    late_orders,
    ROUND(
        100.0 * late_orders /
        NULLIF(delivered_orders, 0),
        2
    ) AS late_delivery_percentage
FROM carrier_metrics
ORDER BY late_delivery_percentage DESC;


-- 3. Window function: Rank carriers by average delivery time

SELECT
    carrier,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days,
    RANK() OVER (
        ORDER BY AVG(delivery_days)
    ) AS delivery_rank
FROM logistics_orders
WHERE delivery_status = 'Delivered'
GROUP BY carrier;
