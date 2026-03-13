## Anomaly Analysis

### 1. Insert Anomaly
In the flat dataset, product details such as `product_id`, `product_name`, `category`, and `unit_price` appear together with order information.

Example columns:
order_id, product_id, product_name, category, unit_price

Example rows from the dataset:
Rows containing orders like `ORD1114`, `ORD1091`, and `ORD1133` contain both order and product information.

Problem:
If a new product is introduced but has not yet been ordered, there is no way to store that product in the dataset because the table requires an `order_id`.

Thus, a product cannot be inserted independently without creating an order, which creates an **Insert Anomaly**.

---

### 2. Update Anomaly
Customer information is repeated for every order placed by that customer.

Example columns:
customer_id, customer_name, customer_email, customer_city

Example rows:
The same `customer_id` appears in multiple orders such as `ORD1114`, `ORD1091`, and `ORD1133`.

Problem:
If a customer's email or city changes, it must be updated in every row containing that customer.

If one row is missed, inconsistent data will occur.

This results in an **Update Anomaly**.

---

### 3. Delete Anomaly
Product information is stored only within order rows.

Example columns:
product_id, product_name, category

Problem:
If a product appears in only one order row and that order is deleted, all information about that product will be lost.

For example, deleting the row containing `order_id = ORD1133` would remove the only record containing that product’s information.

This causes a **Delete Anomaly**.

---

## Normalization Justification

Keeping all data in a single table may appear simple, but it creates significant problems with redundancy and data integrity. In the dataset, customer information such as `customer_name`, `customer_email`, and `customer_city` is repeated every time the customer places a new order. This repetition increases storage requirements and introduces update anomalies. For instance, if a customer's email address changes, every row containing that customer must be updated. Missing even one update would result in inconsistent data.

Product information is also duplicated across multiple rows. Attributes such as `product_name`, `category`, and `unit_price` appear each time that product is ordered. If the price of a product changes, multiple rows must be updated. This increases the chance of errors and makes the database difficult to maintain.

Insert and delete operations also become problematic. A new product cannot be stored unless an order exists for it, which leads to insert anomalies. Similarly, deleting an order could remove the only record containing a product’s information, causing a delete anomaly.

By normalizing the database into separate tables such as **Customers, Products, SalesReps, Orders, and OrderItems**, each entity is stored only once. This eliminates redundancy, reduces storage usage, prevents anomalies, and improves data consistency. Therefore, normalization is not over-engineering but an essential step in designing a reliable relational database.