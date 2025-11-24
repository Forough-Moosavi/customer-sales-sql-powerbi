-- ==========================================
-- View: sales_fact (4-table JOIN)
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
