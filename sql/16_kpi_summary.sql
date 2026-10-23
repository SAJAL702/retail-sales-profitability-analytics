USE retail_sales_analytics;

SELECT
    COUNT(DISTINCT `Order ID`) AS total_orders,
    COUNT(DISTINCT `Customer ID`) AS total_customers,
    SUM(`Quantity`) AS total_units_sold,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(
        SUM(`Profit`) / NULLIF(SUM(`Sales`), 0) * 100,
        2
    ) AS profit_margin_pct,
    ROUND(
        SUM(`Sales`) / NULLIF(COUNT(DISTINCT `Order ID`), 0),
        2
    ) AS average_sales_per_order
FROM superstore_clean;