CREATE TABLE online_retail (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INTEGER,
    InvoiceDate TIMESTAMP,
    UnitPrice NUMERIC,
    CustomerID NUMERIC,
    Country VARCHAR(50),
    Sales NUMERIC(10,2),
    Month VARCHAR(7)
);

update online_retail
set Sales = round(sales,2);

-- VIEW SAMPLE DATA
select * from online_retail
limit 10 ;

-- WHERE FILTERING

-- 1.High-quantity transactions
select * from
online_retail
where quantity > 100
limit 10;

-- 2.High-value transactions
SELECT InvoiceNo, Description, Quantity, UnitPrice, Sales
FROM online_retail
WHERE Sales > 1000
LIMIT 10;

-- 3.Transactions from the United Kingdom
SELECT *
FROM online_retail
WHERE Country = 'United Kingdom'
LIMIT 10;

-- 4.Multiple conditions
SELECT InvoiceNo, Description, Quantity, Sales
FROM online_retail
WHERE Quantity > 100
AND Sales > 500
LIMIT 10;

-- ORDER BY SORTING

SELECT InvoiceNo, Description, Quantity, Sales
FROM online_retail
ORDER BY Sales ASC
LIMIT 10;

-- GROUP BY AGGREGATION

-- 1. Sales by country
select Country , sum(sales) as total_sales
from online_retail
group by country 
order by total_sales desc;

-- 2.Sales by product
select Description , sum(sales) as total_sales 
from online_retail
group by Description
order by total_sales desc
limit 10;

-- 3.Sales by month
select  month , sum(sales) as total_sales 
from online_retail
group by month
order by month;

-- AGGREGATE FUNCTIONS

-- 1.Average sale
SELECT AVG(Sales) AS average_sales
FROM online_retail;

-- 2.Number of transactions
SELECT COUNT(*) AS total_transactions
FROM online_retail;

-- 3.Number of unique products
SELECT COUNT(DISTINCT StockCode) AS unique_products
FROM online_retail;

-- HAVING FILTERING GROUPS

-- Sales by country 
SELECT Country, SUM(Sales) AS total_sales
FROM online_retail
GROUP BY Country
HAVING SUM(Sales) > 100000
ORDER BY total_sales DESC;

-- CASE WHEN

SELECT
    InvoiceNo,
    Sales,
    CASE
        WHEN Sales >= 100 THEN 'High'
        WHEN Sales >= 50 THEN 'Medium'
        ELSE 'Low'
    END AS Sales_Category
FROM online_retail
ORDER BY Sales DESC
LIMIT 20;

-- NULL HANDLING

SELECT COUNT(*) AS missing_customer_id
FROM online_retail
WHERE CustomerID IS NULL;

SELECT COUNT(*) AS known_customer_id
FROM online_retail
WHERE CustomerID IS NOT NULL;
