USE retail_sales_analytics;

SELECT
    `Ship Mode`,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    SUM(`Quantity`) AS units_sold,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / NULLIF(SUM(`Sales`), 0) * 100,
        2
    ) AS profit_margin_pct,
    ROUND(
        AVG(DATEDIFF(`Ship Date`, `Order Date`)),
        2
    ) AS avg_days_to_ship
FROM superstore_clean
WHERE `Order Date` IS NOT NULL
  AND `Ship Date` IS NOT NULL
GROUP BY `Ship Mode`
ORDER BY total_orders DESC;