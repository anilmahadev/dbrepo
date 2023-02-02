--PostgreSQL database schema for an retail store database with ANSI SQL DDL followed by Data for the necessary tables

-- Create the table for customers
CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(100) NOT NULL,
  phone_number VARCHAR(100) NOT NULL
);

-- Create the table for products
CREATE TABLE product (
  product_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  price NUMERIC(10, 2) NOT NULL
);

-- Create the table for orders
CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  order_date DATE NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

-- Create the table for order items
CREATE TABLE order_item (
  order_item_id SERIAL PRIMARY KEY,
  order_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders (order_id),
  FOREIGN KEY (product_id) REFERENCES product (product_id)
);

-- Insert data into the customer table
INSERT INTO customer (name, address, phone_number)
VALUES
  ('John Doe', '123 Main St', '555-555-1212'),
  ('Jane Doe', '456 Elm St', '555-555-1213'),
  ('Jim Smith', '789 Oak St', '555-555-1214');

-- Insert data into the product table
INSERT INTO product (name, description, price)
VALUES
  ('T-Shirt', 'A comfortable cotton t-shirt', 19.99),
  ('Jeans', 'Stylish blue jeans', 39.99),
  ('Sneakers', 'Stylish sneakers', 59.99);

-- Insert data into the orders table
INSERT INTO orders (customer_id, order_date)
VALUES
  (1, '2022-01-01'),
  (2, '2022-02-01'),
  (3, '2022-03-01');

-- Insert data into the order_item table
INSERT INTO order_item (order_id, product_id, quantity)
VALUES
  (1, 1, 2),
  (1, 2, 1),
  (2, 2, 2),
  (3, 3, 1);
