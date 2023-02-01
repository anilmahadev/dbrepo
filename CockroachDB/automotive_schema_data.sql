--CockroachDB database schema for an automotive database with ANSI SQL DDL followed by Data for the necessary tables
-- Create the table for vehicle manufacturers
CREATE TABLE manufacturer (
  manufacturer_id INT PRIMARY KEY,
  name STRING NOT NULL,
  country STRING NOT NULL
);

-- Create a serial sequence for the manufacturer_id
CREATE SEQUENCE manufacturer_seq;

-- Create the table for vehicle models
CREATE TABLE model (
  model_id INT PRIMARY KEY,
  manufacturer_id INT NOT NULL,
  name STRING NOT NULL,
  year INT NOT NULL,
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturer (manufacturer_id)
);

-- Create a serial sequence for the model_id
CREATE SEQUENCE model_seq;

-- Create the table for vehicle owners
CREATE TABLE owner (
  owner_id INT PRIMARY KEY,
  name STRING NOT NULL,
  address STRING NOT NULL,
  phone_number STRING NOT NULL
);

-- Create a serial sequence for the owner_id
CREATE SEQUENCE owner_seq;

-- Create the table for vehicles
CREATE TABLE vehicle (
  vehicle_id INT PRIMARY KEY,
  model_id INT NOT NULL,
  owner_id INT NOT NULL,
  vin STRING NOT NULL,
  purchase_date DATE NOT NULL,
  FOREIGN KEY (model_id) REFERENCES model (model_id),
  FOREIGN KEY (owner_id) REFERENCES owner (owner_id)
);

-- Create a serial sequence for the vehicle_id
CREATE SEQUENCE vehicle_seq;

-- Insert data into the manufacturer table
INSERT INTO manufacturer (manufacturer_id, name, country)
VALUES 
  (NEXT VALUE FOR manufacturer_seq, 'Toyota', 'Japan'),
  (NEXT VALUE FOR manufacturer_seq, 'Ford', 'USA'),
  (NEXT VALUE FOR manufacturer_seq, 'BMW', 'Germany'),
  (NEXT VALUE FOR manufacturer_seq, 'Honda', 'Japan');

-- Insert data into the model table
INSERT INTO model (model_id, manufacturer_id, name, year)
VALUES
  (NEXT VALUE FOR model_seq, 1, 'Camry', 2022),
  (NEXT VALUE FOR model_seq, 1, 'Corolla', 2021),
  (NEXT VALUE FOR model_seq, 2, 'Mustang', 2022),
  (NEXT VALUE FOR model_seq, 2, 'F-150', 2021),
  (NEXT VALUE FOR model_seq, 3, '3 Series', 2022),
  (NEXT VALUE FOR model_seq, 3, '5 Series', 2021);
