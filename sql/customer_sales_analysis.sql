-- ==========================================
-- 1) SALES FACT TABLE (4-table JOIN)
-- ==========================================

-- Drop view if it already exists (safe re-run)
DROP VIEW IF EXISTS sales_fact;

-- Create main fact view
CREATE VIEW sales_fact AS
SELECT
    o.order_id,
    o.order_date,
    o.sales_channel,
    c.customer_id,
    c.full_name,
    c.city,
    c.segment,
    p.product_id,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    oi.discount,
    oi.line_amount,
    -- recompute revenue just to be explicit
    oi.quantity * oi.unit_price * (1 - oi.discount) AS line_revenue
FROM orders      AS o
JOIN customers   AS c  ON o.customer_id = c.customer_id
JOIN order_items AS oi ON o.order_id    = oi.order_id
JOIN products    AS p  ON oi.product_id = p.product_id;

-- Quick test
SELECT * FROM sales_fact
LIMIT 10;



-- ==========================================
-- 2) KPI 1: Monthly revenue (درآمد ماهانه)
-- ==========================================

SELECT
    strftime('%Y-%m', order_date) AS year_month,   -- سال-ماه
    SUM(line_revenue) AS monthly_revenue
FROM sales_fact
GROUP BY year_month
ORDER BY year_month;


-- ==========================================
-- 3) KPI 2: Top 10 customers by revenue
--    (برترین ۱۰ مشتری از نظر درآمد)
-- ==========================================

SELECT
    customer_id,
    full_name,
    city,
    segment,
    SUM(line_revenue) AS total_revenue,
    COUNT(DISTINCT order_id) AS num_orders
FROM sales_fact
GROUP BY customer_id, full_name, city, segment
ORDER BY total_revenue DESC
LIMIT 10;


-- ==========================================
-- 4) KPI 3: Revenue by product category
--    (درآمد به تفکیک دسته محصول)
-- ==========================================

SELECT
    category,
    SUM(line_revenue) AS revenue_by_category,
    COUNT(DISTINCT product_id) AS num_products,
    COUNT(DISTINCT order_id) AS num_orders
FROM sales_fact
GROUP BY category
ORDER BY revenue_by_category DESC;


-- ==========================================
-- 5) KPI 4: Revenue by city and segment
--    (درآمد به تفکیک شهر و نوع مشتری)
-- ==========================================

SELECT
    city,
    segment,
    SUM(line_revenue) AS revenue_city_segment,
    COUNT(DISTINCT customer_id) AS num_customers
FROM sales_fact
GROUP BY city, segment
ORDER BY revenue_city_segment DESC;


-- ==========================================
-- 6) KPI 5: New vs Returning customers
--    (مشتری جدید در برابر مشتری بازگشتی)
-- ==========================================

WITH first_purchase AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM sales_fact
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN s.order_date = f.first_order_date THEN 'New Customer'
        ELSE 'Returning Customer'
    END AS customer_type,
    COUNT(DISTINCT s.order_id) AS num_orders,
    COUNT(DISTINCT s.customer_id) AS num_customers,
    SUM(s.line_revenue) AS total_revenue
FROM sales_fact AS s
JOIN first_purchase AS f
    ON s.customer_id = f.customer_id
GROUP BY customer_type;
