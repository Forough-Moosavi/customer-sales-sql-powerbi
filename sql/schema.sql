-- ==========================================
-- DATABASE SCHEMA: create base tables
-- ==========================================

-- Drop tables if they already exist (for safe re-run)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- =========================
-- 1) customers table
-- =========================
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    first_name  TEXT,
    last_name   TEXT,
    full_name   TEXT,
    city        TEXT,
    segment     TEXT
);

-- =========================
-- 2) products table
-- =========================
CREATE TABLE products (
    product_id   INTEGER PRIMARY KEY,
    product_name TEXT,
    category     TEXT,
    unit_price   REAL
);

-- =========================
-- 3) orders table
-- =========================
CREATE TABLE orders (
    order_id      INTEGER PRIMARY KEY,
    customer_id   INTEGER,
    order_date    TEXT,
    sales_channel TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- =========================
-- 4) order_items table
-- =========================
CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id      INTEGER,
    product_id    INTEGER,
    quantity      INTEGER,
    unit_price    REAL,
    discount      REAL,
    line_amount   REAL,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
