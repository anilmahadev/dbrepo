-- IBM DB2 database schema for an airline database with ANSI SQL DDL followed by Data for the necessary tables

-- Creating the table for Airlines
CREATE TABLE Airlines (
  Airline_ID INT PRIMARY KEY NOT NULL,
  Airline_Name VARCHAR(50) NOT NULL,
  Head_Office VARCHAR(50) NOT NULL
);

-- Creating the table for Flights
CREATE TABLE Flights (
  Flight_ID INT PRIMARY KEY NOT NULL,
  Airline_ID INT NOT NULL,
  Departure_City VARCHAR(50) NOT NULL,
  Arrival_City VARCHAR(50) NOT NULL,
  Departure_Time TIME NOT NULL,
  Arrival_Time TIME NOT NULL,
  FOREIGN KEY (Airline_ID) REFERENCES Airlines (Airline_ID)
);

-- Creating the table for Passengers
CREATE TABLE Passengers (
  Passenger_ID INT PRIMARY KEY NOT NULL,
  First_Name VARCHAR(50) NOT NULL,
  Last_Name VARCHAR(50) NOT NULL,
  Phone_Number VARCHAR(15) NOT NULL,
  Email VARCHAR(50) NOT NULL
);

-- Creating the table for Bookings
CREATE TABLE Bookings (
  Booking_ID INT PRIMARY KEY NOT NULL,
  Flight_ID INT NOT NULL,
  Passenger_ID INT NOT NULL,
  Seat_Number VARCHAR(5) NOT NULL,
  FOREIGN KEY (Flight_ID) REFERENCES Flights (Flight_ID),
  FOREIGN KEY (Passenger_ID) REFERENCES Passengers (Passenger_ID)
);


-- Populating the Airlines table
INSERT INTO Airlines (Airline_ID, Airline_Name, Head_Office)
VALUES (1, 'Delta Airlines', 'Atlanta, GA, USA'),
       (2, 'United Airlines', 'Chicago, IL, USA'),
       (3, 'American Airlines', 'Fort Worth, TX, USA');

-- Populating the Flights table
INSERT INTO Flights (Flight_ID, Airline_ID, Departure_City, Arrival_City, Departure_Time, Arrival_Time)
VALUES (100, 1, 'New York, NY, USA', 'London, UK', '08:00:00', '10:00:00'),
       (200, 2, 'Los Angeles, CA, USA', 'Paris, France', '09:00:00', '11:00:00'),
       (300, 3, 'Miami, FL, USA', 'Rome, Italy', '10:00:00', '12:00:00');

-- Populating the Passengers table
INSERT INTO Passengers (Passenger_ID, First_Name, Last_Name, Phone_Number, Email)
VALUES (1000, 'John', 'Doe', '555-555-5555', 'johndoe@email.com'),
       (2000, 'Jane', 'Doe', '555-555-5556', 'janedoe@email.com'),
       (3000, 'Jim', 'Smith', '555-555-5557', 'jimsmith@email.com);
