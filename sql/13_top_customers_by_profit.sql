SELECT
    `Customer ID`,
    `Customer Name`,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit
FROM superstore_clean
WHERE `Customer ID` IS NOT NULL
GROUP BY
    `Customer ID`,
    `Customer Name`
ORDER BY total_profit DESC
LIMIT 10;