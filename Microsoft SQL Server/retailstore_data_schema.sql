-- Microsoft SQL Server database schema for an retail store database with ANSI SQL DDL followed by Data for the necessary tables

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(20) NOT NULL,
    Address NVARCHAR(255) NOT NULL
);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    ProductName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255) NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    Stock INT NOT NULL
);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into the Customers table
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES 
    ('John', 'Doe', 'john.doe@email.com', '555-555-5555', '123 Main St'),
    ('Jane', 'Doe', 'jane.doe@email.com', '555-555-5556', '456 Main St'),
    ('Jim', 'Smith', 'jim.smith@email.com', '555-555-5557', '789 Main St');

-- Insert sample data into the Products table
INSERT INTO Products (ProductName, Description, Price, Stock)
VALUES 
    ('Shirt', 'A blue shirt', 19.99, 100),
    ('Pants', 'A pair of jeans', 29.99, 50),
    ('Shoes', 'A pair of sneakers', 39.99, 25);

-- Insert sample data into the Orders table
INSERT INTO Orders (CustomerID, OrderDate)
VALUES 
    (1, '2022-01-01 10:00:00'),
    (2, '2022-02-01 11:00:00'),
    (3, '2022-03-01 12:00:00');

-- Insert sample data into the OrderDetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 1),
    (3, 1, 3);
