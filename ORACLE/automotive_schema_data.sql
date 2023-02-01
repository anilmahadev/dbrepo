--Oracle database schema for an automotive database with ANSI SQL DDL followed by Data for the necessary tables
-- Create the table for vehicle manufacturers
CREATE TABLE manufacturer (
  manufacturer_id NUMBER(5) PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  country VARCHAR2(50) NOT NULL
);

-- Create a sequence for the manufacturer_id
CREATE SEQUENCE manufacturer_seq START WITH 1 INCREMENT BY 1 NOCACHE;

-- Create the table for vehicle models
CREATE TABLE model (
  model_id NUMBER(5) PRIMARY KEY,
  manufacturer_id NUMBER(5) NOT NULL,
  name VARCHAR2(50) NOT NULL,
  year NUMBER(4) NOT NULL,
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturer (manufacturer_id)
);

-- Create a sequence for the model_id
CREATE SEQUENCE model_seq START WITH 1 INCREMENT BY 1 NOCACHE;

-- Create the table for vehicle owners
CREATE TABLE owner (
  owner_id NUMBER(5) PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  address VARCHAR2(100) NOT NULL,
  phone_number VARCHAR2(15) NOT NULL
);

-- Create a sequence for the owner_id
CREATE SEQUENCE owner_seq START WITH 1 INCREMENT BY 1 NOCACHE;

-- Create the table for vehicles
CREATE TABLE vehicle (
  vehicle_id NUMBER(5) PRIMARY KEY,
  model_id NUMBER(5) NOT NULL,
  owner_id NUMBER(5) NOT NULL,
  vin VARCHAR2(17) NOT NULL,
  purchase_date DATE NOT NULL,
  FOREIGN KEY (model_id) REFERENCES model (model_id),
  FOREIGN KEY (owner_id) REFERENCES owner (owner_id)
);

-- Create a sequence for the vehicle_id
CREATE SEQUENCE vehicle_seq START WITH 1 INCREMENT BY 1 NOCACHE;

-- Insert data into the manufacturer table
INSERT INTO manufacturer (manufacturer_id, name, country)
VALUES 
  (manufacturer_seq.NEXTVAL, 'Toyota', 'Japan'),
  (manufacturer_seq.NEXTVAL, 'Ford', 'USA'),
  (manufacturer_seq.NEXTVAL, 'BMW', 'Germany'),
  (manufacturer_seq.NEXTVAL, 'Honda', 'Japan');

-- Insert data into the model table
INSERT INTO model (model_id, manufacturer_id, name, year)
VALUES
  (model_seq.NEXTVAL, 1, 'Camry', 2022),
  (model_seq.NEXTVAL, 1, 'Corolla', 2021),
  (model_seq.NEXTVAL, 2, 'Mustang', 2022),
  (model_seq.NEXTVAL, 2, 'F-150', 2021),
  (model_seq.NEXTVAL, 3, '3 Series', 2022),
  (model_seq.NEXTVAL, 3, '5 Series', 2021),
