USE retail_sales_analytics;

SELECT
    `Product Name`,
    `Category`,
    `Sub-Category`,
    SUM(`Quantity`) AS units_sold,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM superstore_clean
GROUP BY
    `Product Name`,
    `Category`,
    `Sub-Category`
ORDER BY total_profit DESC
LIMIT 10;