# SQL Documentation – Logistics & Operations KPI Analysis

## 1. Overview

MySQL Workbench was used to store, validate and analyse the cleaned logistics dataset.

SQL queries were developed to answer operational and business questions related to order volumes, delivery performance, carrier efficiency and freight costs.

## 2. Database Setup

A database named `logistics_project` was created.

Main table: `logistics_orders`

The table contains order details, delivery dates, carrier information, freight costs and derived analytical columns.

## 3. Data Validation

The following SQL techniques were used:

- `COUNT()` – count records
- `COUNT(DISTINCT)` – identify unique orders
- `IS NULL` – identify missing values
- `GROUP BY` – validate record distribution
- Primary key constraints – maintain order ID uniqueness

## 4. SQL Concepts Demonstrated

| SQL concept | Application |
|---|---|
| SELECT | Retrieve order information |
| WHERE | Filter orders |
| ORDER BY | Sort analytical results |
| GROUP BY | Aggregate by region and carrier |
| HAVING | Filter aggregated results |
| COUNT and SUM | Calculate order and cost metrics |
| AVG | Calculate average delivery time |
| CASE WHEN | Categorise delivery performance |
| JOIN | Combine related datasets |
| Subqueries | Perform nested analysis |
| CTEs | Structure complex analytical queries |
| Window functions | Rank carrier performance |

## 5. Business KPI Analysis

The following KPIs were calculated using SQL:

1. Total orders by region
2. Delivered orders by carrier
3. On-time delivery percentage
4. Average delivery days by carrier
5. Total freight cost by region
6. Late delivery percentage by carrier
7. Monthly order volume and order value

## 6. Advanced SQL Analysis

Common Table Expressions (CTEs) were used to organise multi-step analytical queries.

Window functions such as `RANK()` were used to compare carrier delivery performance.

Conditional expressions using `CASE WHEN` were applied to classify delivery outcomes.

## 7. Business Value

SQL enabled structured analysis of logistics operations and provided the aggregated results required for Power BI dashboard development.

The analysis helps identify delivery delays, compare carrier performance and monitor freight expenditure.
