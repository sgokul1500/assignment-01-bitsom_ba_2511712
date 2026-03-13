-- Customers table

CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- Products table

CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives

CREATE TABLE SalesReps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

-- Orders

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id)
);

-- Order items

CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,

    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Sample data aligned with CSV style

INSERT INTO Customers VALUES
('C001','Rohan Sharma','rohan@email.com','Mumbai'),
('C002','Priya Gupta','priya@email.com','Delhi'),
('C003','Amit Verma','amit@email.com','Mumbai'),
('C004','Sneha Iyer','sneha@email.com','Bangalore'),
('C005','Arjun Singh','arjun@email.com','Pune');

INSERT INTO Products VALUES
('P001','Laptop','Electronics',55000),
('P002','Mobile Phone','Electronics',20000),
('P003','Headphones','Electronics',3000),
('P004','Keyboard','Accessories',1500),
('P005','Monitor','Electronics',12000);

INSERT INTO SalesReps VALUES
('S001','Rohit Sharma','rohit@company.com','Mumbai Office'),
('S002','Anjali Verma','anjali@company.com','Delhi Office'),
('S003','Karan Kapoor','karan@company.com','Bangalore Office'),
('S004','Meera Nair','meera@company.com','Mumbai Office'),
('S005','Vikram Singh','vikram@company.com','Delhi Office');

INSERT INTO Orders VALUES
('ORD1114','C001','S001','2024-01-01'),
('ORD1091','C002','S002','2024-01-02'),
('ORD1133','C003','S003','2024-01-03'),
('ORD1140','C001','S004','2024-01-04'),
('ORD1155','C004','S005','2024-01-05');

INSERT INTO OrderItems (order_id,product_id,quantity) VALUES
('ORD1114','P001',1),
('ORD1091','P002',2),
('ORD1133','P003',3),
('ORD1140','P004',1),
('ORD1155','P005',2);