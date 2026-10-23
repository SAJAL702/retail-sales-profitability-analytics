USE retail_sales_analytics;

WITH customer_summary AS (
    SELECT
        `Customer ID`,
        `Customer Name`,
        COUNT(DISTINCT `Order ID`) AS total_orders,
        SUM(`Sales`) AS total_sales,
        SUM(`Profit`) AS total_profit
    FROM superstore_clean
    WHERE `Customer ID` IS NOT NULL
    GROUP BY `Customer ID`, `Customer Name`
)
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS total_customers,
    ROUND(AVG(total_orders), 2) AS avg_orders_per_customer,
    ROUND(AVG(total_sales), 2) AS avg_sales_per_customer,
    ROUND(AVG(total_profit), 2) AS avg_profit_per_customer,
    ROUND(SUM(total_sales), 2) AS total_sales,
    ROUND(SUM(total_profit), 2) AS total_profit
FROM customer_summary
GROUP BY customer_type
ORDER BY total_customers DESC;