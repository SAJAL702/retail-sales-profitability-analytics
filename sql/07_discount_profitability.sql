USE retail_sales_analytics;

SELECT
    `Discount` AS discount_rate,
    COUNT(*) AS order_lines,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    ROUND(AVG(`Profit`), 2) AS avg_profit_per_line,
    ROUND(
        SUM(`Profit`) / NULLIF(SUM(`Sales`), 0) * 100,
        2
    ) AS profit_margin_pct
FROM superstore_clean
GROUP BY `Discount`
ORDER BY discount_rate;