
-- DIMENSION TABLES

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    month INT,
    month_name VARCHAR(20),
    year INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

 -- FACT TABLE

CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_sales DECIMAL(12,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================
-- DIM_DATE (cleaned ISO dates)
-- =========================

INSERT INTO dim_date VALUES
(1,'2023-01-15',1,'January',2023),
(2,'2023-02-05',2,'February',2023),
(3,'2023-02-20',2,'February',2023),
(4,'2023-08-29',8,'August',2023),
(5,'2023-12-12',12,'December',2023);

-- =========================
-- DIM_STORE (real stores)
-- =========================

INSERT INTO dim_store VALUES
(1,'Chennai Anna','Chennai'),
(2,'Delhi South','Delhi'),
(3,'Bangalore MG','Bangalore'),
(4,'Pune FC Road','Pune'),
(5,'Mumbai Central','Mumbai');

-- =========================
-- DIM_PRODUCT (real products)
-- categories standardized
-- =========================

INSERT INTO dim_product VALUES
(1,'Speaker','Electronics'),
(2,'Tablet','Electronics'),
(3,'Phone','Electronics'),
(4,'Smartwatch','Electronics'),
(5,'Atta 10kg','Grocery'),
(6,'Jeans','Clothing'),
(7,'Biscuits','Grocery'),
(8,'Jacket','Clothing'),
(9,'Laptop','Electronics'),
(10,'Milk 1L','Grocery');

-- =========================
-- FACT TABLE DATA
-- derived from CSV rows
-- =========================

INSERT INTO fact_sales VALUES
(1,4,1,1,3,49262.78,147788.34),
(2,5,1,2,11,23226.12,255487.32),
(3,2,1,3,20,48703.39,974067.80),
(4,3,2,4,14,23226.12,325165.68),
(5,1,1,9,10,58851.01,588510.10),
(6,2,3,6,7,3500.00,24500.00),
(7,3,4,7,15,50.00,750.00),
(8,4,5,5,8,450.00,3600.00),
(9,5,3,8,5,2500.00,12500.00),
(10,1,4,10,12,60.00,720.00);