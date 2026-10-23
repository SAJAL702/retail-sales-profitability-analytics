USE retail_sales_analytics;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    COUNT(DISTINCT `Customer ID`) AS total_customers,

    SUM(`Order Date` IS NULL) AS missing_order_dates,
    SUM(`Ship Date` IS NULL) AS missing_ship_dates,
    SUM(`Sales` IS NULL) AS missing_sales,
    SUM(`Profit` IS NULL) AS missing_profit,
    SUM(`Quantity` IS NULL) AS missing_quantity,

    SUM(`Sales` < 0) AS negative_sales_rows,
    SUM(`Quantity` <= 0) AS nonpositive_quantity_rows
FROM superstore_clean;