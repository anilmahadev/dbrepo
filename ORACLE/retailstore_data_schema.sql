-- CREATE TABLES

-- Table for storing information about store locations
CREATE TABLE store_locations (
    location_id NUMBER PRIMARY KEY,
    location_name VARCHAR2(50) NOT NULL,
    address VARCHAR2(100) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    state VARCHAR2(50) NOT NULL,
    zip_code VARCHAR2(10) NOT NULL
);

-- Table for storing information about products
CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(50) NOT NULL,
    category VARCHAR2(50) NOT NULL,
    description VARCHAR2(200) NOT NULL,
    price NUMBER NOT NULL
);

-- Table for storing information about orders
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    order_date DATE NOT NULL,
    location_id NUMBER NOT NULL,
    customer_name VARCHAR2(50) NOT NULL,
    total_amount NUMBER NOT NULL,
    CONSTRAINT fk_location_id FOREIGN KEY (location_id) REFERENCES store_locations (location_id)
);

-- Table for storing information about order items
CREATE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    quantity NUMBER NOT NULL,
    CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders (order_id),
    CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES products (product_id)
);

INSERT INTO customers (customer_id, first_name, last_name, email, phone_number, address, city, state, zip_code, country)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'Anytown', 'Anystate', '12345', 'USA');

INSERT INTO products (product_id, product_name, description, price, category, stock_quantity)
VALUES (1, 'Product 1', 'This is product 1', 19.99, 'Category 1', 100);

INSERT INTO orders (order_id, customer_id, order_date)
VALUES (1, 1, SYSDATE);

INSERT INTO order_details (order_detail_id, order_id, product_id, quantity)
VALUES (1, 1, 1, 1);

