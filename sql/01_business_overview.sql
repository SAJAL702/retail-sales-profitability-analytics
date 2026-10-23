USE retail_sales_analytics;

SELECT
    COUNT(*) AS total_order_lines,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    COUNT(DISTINCT `Customer ID`) AS total_customers,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(AVG(`Sales`), 2) AS avg_sales_per_order_line,
    ROUND(AVG(`Profit`), 2) AS avg_profit_per_order_line
FROM superstore_clean;