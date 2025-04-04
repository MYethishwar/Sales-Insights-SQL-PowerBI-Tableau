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

