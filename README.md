# E-Commerce SQL Sales Analysis

A MySQL project analyzing e-commerce sales performance, customer
purchasing behavior, product performance, order and payment status, and
data quality.

## Project Overview

This project uses a relational e-commerce database to answer practical
business questions with SQL. It covers database setup, KPI analysis,
customer behavior, transaction reconciliation, and basic database
optimization.

## Tools and Technologies

-   **MySQL** --- relational database and SQL analysis
-   **SQL** --- joins, aggregations, CTEs, window functions, date
    calculations, views, indexes, and `EXPLAIN`
-   **Power BI / DAX** --- supporting dashboard and KPI visualization,
    if included in the published project files

## Database Structure

Database: `sales_order_analytics`

  -----------------------------------------------------------------------
  Table                               Purpose
  ----------------------------------- -----------------------------------
  `customers`                         Customer details and signup dates

  `products`                          Product names, categories, prices,
                                      and stock

  `orders`                            Order dates, statuses, and recorded
                                      totals

  `order_items`                       Products, quantities, and unit
                                      prices within each order

  **`payments`                        Payment amounts, dates, and payment
                                      statuses**
  -----------------------------------------------------------------------

The sample data includes 11 customers, 10 products, and 16 orders, along
with order-item and payment records.

## Business Questions

-   How many orders were placed, completed, cancelled, or left pending?
-   What are completed-order revenue and average completed order value?
-   How does completed revenue change month over month?
-   Which products and categories generate the most item-level revenue
    or units sold?
-   Which customers contribute the most completed-order revenue?
-   Which customers are repeat buyers, and how long do they take to make
    a second completed purchase?
-   Do payment statuses and amounts match their corresponding orders?
-   Which orders have differences between recorded order totals and
    calculated item totals?
-   How can views, indexes, and `EXPLAIN` help inspect query execution
    plans?

## SQL Concepts Demonstrated

-   `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`, and `HAVING`
-   Aggregate functions: `COUNT`, `SUM`, `AVG`, and `ROUND`
-   `INNER JOIN` and `LEFT JOIN`
-   Conditional logic with `CASE`
-   Common table expressions (CTEs)
-   Window functions: `RANK()`, `ROW_NUMBER()`, and `LAG()`
-   Date functions: `YEAR()`, `MONTH()`, `DATE_FORMAT()`, and
    `DATEDIFF()`
-   CRUD operations: `INSERT`, `UPDATE`, and `DELETE`
-   SQL views, indexes, and `EXPLAIN`
-   Revenue, payment, and data-quality reconciliation

## Key Results

Based on the project's recorded order data:

-   **Total orders:** 16
-   **Completed orders:** 13
-   **Cancelled orders:** 2
-   **Pending orders:** 1
-   **Completed-order revenue:** ₹171,700
-   **Average completed order value:** ₹13,207.69
-   **Cancellation rate:** 12.50%
-   **Pending order value:** ₹55,000
-   **Cancelled order value:** ₹10,700

The data-quality checks identified a **₹1,400 net difference** between
recorded order totals and calculated order-item totals. This discrepancy
requires investigation rather than silently adjusting either value.

## Suggested Repository Structure

``` text
ecommerce-sql-sales-analysis/
├── README.md
├── database.sql
├── business-analysis.sql
└── dashboard/
    └── dashboard-screenshot.png
```

-   `database.sql` --- table setup, sample records, additional
    transaction, CRUD examples, view, index, and `EXPLAIN` queries.
-   `business-analysis.sql` --- analysis queries for sales, products,
    customers, payments, cancellations, retention, and data quality.
-   `dashboard/` --- optional dashboard screenshots or other material
    you have permission to publish.

Update the filenames in this README if you use different names for your
uploaded SQL files.

## How to Run

1.  Install MySQL and open MySQL Workbench or another MySQL client.
2.  Ensure the required `customers` and `products` tables exist before
    running scripts that reference them.
3.  Run the database setup and sample-data statements in the correct
    order.
4.  Run the business-analysis queries after the tables and records have
    been created.
5.  Review the query results, especially the reconciliation checks.

**Caution:** Review the SQL scripts before running them against an
existing database. They include `INSERT`, `UPDATE`, and `DELETE`
statements, as well as view and index creation.

## Limitations

-   The project uses a small sample dataset; results are illustrative
    and should not be treated as representative of a real e-commerce
    business.
-   The ₹1,400 reconciliation difference shows that recorded order
    totals and item-level calculations do not agree for all records.
-   Stock-pressure ratios are simple indicators based on units sold and
    current stock, not a full inventory forecasting model.
-   The monthly inactivity analysis uses a fixed reference date in the
    SQL script; update it before reusing the analysis for another
    reporting period.

## Business Value

This project demonstrates how SQL can turn relational transaction data
into business metrics, identify customer and product patterns, and
surface data-quality issues that require investigation. It also
demonstrates basic database-management and query-plan inspection
techniques.

------------------------------------------------------------------------

*Portfolio project demonstrating SQL and business analytics skills.*
