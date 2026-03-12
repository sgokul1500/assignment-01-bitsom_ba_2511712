
## Anomaly Analysis

### 1. Insert Anomaly
In the current flat table structure, it is not possible to insert a new product or sales representative unless an order exists.

Example:
Columns involved:
product_id, product_name, category, unit_price

If a new product is introduced but no order has been placed yet, there is no way to store that product in the table because the table requires an order_id.

Example rows:
Rows such as:
order_id = ORD1114 and ORD1091 contain product information together with order data.  
If a product has not been ordered yet, no row can be created for it.

Thus, product information depends on order creation, which causes an Insert Anomaly.

### 2. Update Anomaly
Customer information is repeated across multiple rows. If a customer's details change, they must be updated in multiple places.

Example:
Columns involved:
customer_id, customer_name, customer_email, customer_city

Example rows:
Rows containing the same customer_id appear multiple times (for example rows with order_id ORD1114, ORD1091, ORD1133).

If the customer's email changes, every row containing that customer_id must be updated.  
If one row is missed, inconsistent data will exist.

This leads to an Update Anomaly.

### 3. Delete Anomaly
Deleting an order may accidentally remove important information about customers or products.

Example:
Columns involved:
product_id, product_name, category

If a product appears in only one order row and that order is deleted, all information about that product will be lost.

For example, deleting the row with a specific order_id would also delete the only stored information about that product.

This results in a Delete Anomaly.

## Normalization Justification

Keeping all data in a single table may appear simple, but it introduces several serious problems related to data redundancy and inconsistency. In the provided dataset, customer information such as customer_name, customer_email, and customer_city is repeated in multiple rows whenever the same customer places multiple orders. This redundancy increases storage usage and creates update anomalies. For example, if a customer's email address changes, every row containing that customer must be updated. If even one row is missed, the database will contain inconsistent data.

Similarly, product information such as product_name, category, and unit_price is repeated every time that product appears in an order. If a product price changes, multiple rows must be updated. This increases the chance of errors and makes maintenance difficult.

Another problem occurs when inserting or deleting data. A new product cannot be stored unless an order exists for it, which creates an insert anomaly. Likewise, deleting an order could remove the only record containing a product’s details, causing a delete anomaly.

By normalizing the database into separate tables such as Customers, Products, Orders, Sales Representatives, and Order Items, each entity is stored only once. This eliminates redundancy, prevents anomalies, and improves data integrity. Therefore, normalization is not over-engineering but a necessary step to ensure a reliable and maintainable database design.