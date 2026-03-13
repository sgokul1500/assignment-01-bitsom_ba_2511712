-- ======================================
-- Q1: Total sales revenue by category per month
-- ======================================

SELECT
d.year,
d.month_name,
p.category,
SUM(f.total_sales) AS total_revenue
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY d.year,d.month,d.month_name,p.category
ORDER BY d.year,d.month,total_revenue DESC;


-- ======================================
-- Q2: Top 2 performing stores by revenue
-- ======================================

SELECT
s.store_name,
SUM(f.total_sales) AS total_revenue
FROM fact_sales f
JOIN dim_store s ON f.store_id = s.store_id
GROUP BY s.store_name
ORDER BY total_revenue DESC
LIMIT 2;


-- ======================================
-- Q3: Month-over-month sales trend
-- ======================================

SELECT
d.year,
d.month,
d.month_name,
SUM(f.total_sales) AS monthly_sales
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year,d.month,d.month_name
ORDER BY d.year,d.month;