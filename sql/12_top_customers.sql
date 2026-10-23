USE retail_sales_analytics;

SELECT
    `Customer ID`,
    `Customer Name`,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / NULLIF(SUM(`Sales`), 0) * 100,
        2
    ) AS profit_margin_pct
FROM superstore_clean
WHERE `Customer ID` IS NOT NULL
GROUP BY
    `Customer ID`,
    `Customer Name`
ORDER BY total_sales DESC
LIMIT 10;