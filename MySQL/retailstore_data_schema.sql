-- MYSQL database schema for an retail store database with ANSI SQL DDL followed by Data for the necessary tables

CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone VARCHAR(15) NOT NULL,
  street_address VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  zip_code VARCHAR(10) NOT NULL
);

CREATE TABLE products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  product_description TEXT NOT NULL,
  product_category VARCHAR(100) NOT NULL,
  product_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATETIME NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  item_price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (first_name, last_name, email, phone, street_address, city, state, zip_code)
VALUES
  ('John', 'Doe', 'johndoe@example.com', '555-555-1212', '123 Main St', 'Anytown', 'Anystate', '12345'),
  ('Jane', 'Doe', 'janedoe@example.com', '555-555-1212', '456 Main St', 'Anytown', 'Anystate', '67890');

INSERT INTO products (product_name, product_description, product_category, product_price)
VALUES
  ('Product 1', 'Description for product 1', 'Category 1', 19.99),
  ('Product 2', 'Description for product 2', 'Category 2', 29.99);

INSERT INTO orders (customer_id, order_date, total_amount)
VALUES
  (1, NOW(), 19.99),
  (2, NOW(), 29.99);

INSERT INTO order_items (order_id, product_id, quantity, item_price)
VALUES
  (1, 1, 1, 19.99),
  (2, 2, 1, 29.99);

