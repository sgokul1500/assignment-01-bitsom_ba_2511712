CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE SalesReps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id)
);

CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Sample Inserts

INSERT INTO Customers VALUES
('C001','Rahul Mehta','rahul@email.com','Mumbai'),
('C002','Priya Shah','priya@email.com','Delhi'),
('C003','Amit Patel','amit@email.com','Mumbai'),
('C004','Sneha Rao','sneha@email.com','Bangalore'),
('C005','Arjun Singh','arjun@email.com','Pune');

INSERT INTO Products VALUES
('P001','Laptop','Electronics',55000),
('P002','Phone','Electronics',20000),
('P003','Headphones','Accessories',3000),
('P004','Keyboard','Accessories',1500),
('P005','Monitor','Electronics',12000);

INSERT INTO SalesReps VALUES
('S001','Rohit Sharma','rohit@company.com','Mumbai HQ'),
('S002','Anjali Verma','anjali@company.com','Delhi Office'),
('S003','Karan Kapoor','karan@company.com','Bangalore Office'),
('S004','Meera Nair','meera@company.com','Mumbai HQ'),
('S005','Vikram Singh','vikram@company.com','Delhi Office');

INSERT INTO Orders VALUES
('O001','C001','S001','2024-01-01'),
('O002','C002','S002','2024-01-02'),
('O003','C003','S003','2024-01-03'),
('O004','C001','S004','2024-01-04'),
('O005','C004','S005','2024-01-05');

INSERT INTO OrderItems (order_id,product_id,quantity) VALUES
('O001','P001',1),
('O002','P002',2),
('O003','P003',3),
('O004','P004',1),
('O005','P005',2);