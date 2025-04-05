use sales;
-- Count of total customers  - 38
SELECT COUNT(*) FROM customers;

-- Count of total markets  - 17
SELECT COUNT(*) FROM markets;

-- Count of total transactions   - 148395
SELECT COUNT(*) FROM transactions;

-- Count of total products  279
SELECT COUNT(*) FROM products;

SELECT * FROM markets ORDER BY zone;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM date;
SELECT * FROM transactions;

-- Average sales amount by markets
SELECT 
    markets.markets_name, ROUND(AVG(sales_amount), 0) AS average_sales
FROM
    transactions
        INNER JOIN
    markets ON markets.markets_code = transactions.market_code
GROUP BY markets.markets_name ORDER BY average_sales DESC;


-- Average Sales by year
SELECT 
    year, ROUND(AVG(sales_amount), 0) AS average_sales
FROM
    transactions
        INNER JOIN
    date ON transactions.order_date = date.date
GROUP BY year ORDER BY average_sales Desc;


-- Top customers based on sales amount
SELECT 
    custmer_name, SUM(sales_amount) AS total_sales_amount
FROM
    transactions
        INNER JOIN
    customers ON transactions.customer_code = customers.customer_code
GROUP BY custmer_name ORDER BY total_sales_amount DESC LIMIT 5;

-- AVERAGE Profict margin 
SELECT ROUND(AVG(profit_margin_percentage), 2) AS avg_profit_margin FROM transactions;

-- Top 5 best selling products by sales quantity 
SELECT product_code, sales_qty FROM transactions ORDER BY sales_qty DESC LIMIT 5;

-- Average sales per transaction
SELECT ROUND(AVG(sales_amount), 2) FROM transactions;

-- Profit margin by product 
SELECT 
    product_code, 
    ROUND(AVG(profit_margin_percentage) * 100, 2) AS avg_profit_margin_percent
FROM 
    transactions
GROUP BY product_code
ORDER BY avg_profit_margin_percent DESC
LIMIT 10;


-- Revenue by Product category
SELECT 
    p.product_type,
    ROUND(SUM(t.sales_amount), 0) AS total_revenue
FROM 
    transactions t
    JOIN products p ON p.product_code = t.product_code
GROUP BY p.product_type
ORDER BY total_revenue DESC;

select distinct(currency) from transactions;