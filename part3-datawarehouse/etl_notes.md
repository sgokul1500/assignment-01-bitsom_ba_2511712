## ETL Decisions

### Decision 1 — Date Standardization

Problem:
The raw dataset contained multiple date formats such as "29/08/2023", "12-12-2023", and "2023-02-05". These inconsistent formats make time-based aggregation difficult.

Resolution:
All dates were converted into the ISO standard format (YYYY-MM-DD) before loading into the `dim_date` table. Additional attributes like month and year were extracted to support analytical queries.

---

### Decision 2 — Category Normalization

Problem:
Product categories appeared in inconsistent formats such as "electronics", "Electronics", and "Groceries".

Resolution:
All category values were standardized into **Title Case** and normalized (e.g., "electronics" → "Electronics", "Groceries" → "Grocery") before inserting into `dim_product`.

---

### Decision 3 — Revenue Calculation

Problem:
The dataset did not contain a total revenue column required for analytical reporting.

Resolution:
A new measure `total_sales` was calculated during transformation using:

total_sales = units_sold × unit_price

This derived metric was stored in the `fact_sales` table for efficient business intelligence queries.