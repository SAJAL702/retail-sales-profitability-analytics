USE retail_sales_analytics;

SELECT
    `Category`,
    `Sub-Category`,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    SUM(`Quantity`) AS units_sold,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / NULLIF(SUM(`Sales`), 0) * 100,
        2
    ) AS profit_margin_pct
FROM superstore_clean
GROUP BY
    `Category`,
    `Sub-Category`
ORDER BY total_profit DESC;