USE retail_sales_analytics;

SELECT
    DATE_FORMAT(`Order Date`, '%Y-%m') AS order_month,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / NULLIF(SUM(`Sales`), 0) * 100,
        2
    ) AS profit_margin_pct
FROM superstore_clean
WHERE `Order Date` IS NOT NULL
GROUP BY DATE_FORMAT(`Order Date`, '%Y-%m')
ORDER BY order_month;