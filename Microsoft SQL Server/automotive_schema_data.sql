--Microsoft SQL Server database schema for an automotive database with ANSI SQL DDL followed by Data for the necessary tables
-- Create the table for vehicle manufacturers
CREATE TABLE manufacturer (
  manufacturer_id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL
);

-- Create the table for vehicle models
CREATE TABLE model (
  model_id INT IDENTITY(1,1) PRIMARY KEY,
  manufacturer_id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  year INT NOT NULL,
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturer (manufacturer_id)
);

-- Create the table for vehicle owners
CREATE TABLE owner (
  owner_id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  phone_number VARCHAR(15) NOT NULL
);

-- Create the table for vehicles
CREATE TABLE vehicle (
  vehicle_id INT IDENTITY(1,1) PRIMARY KEY,
  model_id INT NOT NULL,
  owner_id INT NOT NULL,
  vin VARCHAR(17) NOT NULL,
  purchase_date DATE NOT NULL,
  FOREIGN KEY (model_id) REFERENCES model (model_id),
  FOREIGN KEY (owner_id) REFERENCES owner (owner_id)
);

-- Insert data into the manufacturer table
INSERT INTO manufacturer (name, country)
VALUES 
  ('Toyota', 'Japan'),
  ('Ford', 'USA'),
  ('BMW', 'Germany'),
  ('Honda', 'Japan');

-- Insert data into the model table
INSERT INTO model (manufacturer_id, name, year)
VALUES
  (1, 'Camry', 2022),
  (1, 'Corolla', 2021),
  (2, 'Mustang', 2022),
  (2, 'F-150', 2021),
  (3, '3 Series', 2022),
  (3, '5 Series', 2021),
  (4, 'Civic', 2022),
  (4, 'Accord', 2021);

-- Insert data into the owner table
INSERT INTO owner (name, address, phone_number)
VALUES
  ('John Doe', '123 Main St, Anytown USA 12345', '555-555-1212'),
  ('Jane Doe', '456 Market St, Anytown USA 12345', '555-555-1213'),
  ('Bob Smith', '789 Elm St, Anytown USA 12345', '555-555-1214');

-- Insert data into the vehicle table
INSERT INTO vehicle (model_id, owner_id, vin, purchase_date)
VALUES
  (1, 1, '12345678901234567', '2022-01-01'),
  (2, 2, '23456789012345678', '2021-12-31'),
  (3, 3, '34567890123456789', '2022-06-15');

