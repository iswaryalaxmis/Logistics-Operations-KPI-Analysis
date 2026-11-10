# Python Documentation – Logistics & Operations KPI Analysis

## 1. Overview

Python was used to explore, clean, transform and analyse logistics order data before loading it into MySQL for further analysis.

The main library used was Pandas, supported by NumPy for numerical and conditional operations.

## 2. Python Libraries

| Library | Purpose |
|---|---|
| Pandas | Data manipulation and analysis |
| NumPy | Numerical calculations and conditional logic |
| Matplotlib | Data visualisation |
| Seaborn | Statistical visualisation |

## 3. Data Exploration

The initial analysis examined the dataset structure, data types, missing values and duplicate records.

Techniques used:

- `head()` – preview records
- `shape` – identify dataset dimensions
- `info()` – inspect column data types
- `describe()` – generate descriptive statistics
- `isnull().sum()` – identify missing values
- `duplicated().sum()` – identify duplicate records

## 4. Data Cleaning

The dataset was prepared for analysis through:

- Converting date columns into datetime format
- Checking duplicate order IDs
- Identifying missing values
- Validating numerical columns
- Checking consistency of delivery status values

Missing actual delivery dates were retained for orders that had not yet been delivered.

## 5. Feature Engineering

Three analytical columns were created:

**Delivery Days**

Actual delivery date minus order date.

**Delay Days**

Actual delivery date minus estimated delivery date.

**Delivery Performance**

Orders were classified as:
- On Time: delivered on or before the estimated date
- Late: delivered after the estimated date
- Not Delivered: orders without a completed delivery

## 6. KPI Analysis

The following business KPIs were calculated:

- Total number of orders
- Number of delivered orders
- On-time delivery percentage
- Average delivery duration
- Total freight cost
- Late delivery count
- Average customer rating

## 7. Data Export

After cleaning and transformation, the processed dataset was exported as a CSV file for import into MySQL Workbench.

```python
df.to_csv("../data/processed/logistics_cleaned.csv", index=False)
```

## 8. Business Value

Python helped prepare reliable data for downstream SQL analysis and Power BI reporting.

The analysis supports logistics performance monitoring, delivery efficiency assessment and freight cost evaluation.
