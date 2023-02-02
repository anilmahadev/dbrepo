--Postresql database schema for an airline database with ANSI SQL DDL followed by Data for the necessary tables

-- Create a table for storing information about airlines
CREATE TABLE airlines (
  airline_id serial PRIMARY KEY,
  airline_name varchar(255) NOT NULL,
  established_year date NOT NULL
);

-- Create a table for storing information about airports
CREATE TABLE airports (
  airport_id serial PRIMARY KEY,
  airport_name varchar(255) NOT NULL,
  airport_location varchar(255) NOT NULL
);

-- Create a table for storing information about flights
CREATE TABLE flights (
  flight_id serial PRIMARY KEY,
  flight_number varchar(255) NOT NULL,
  departure_airport_id int REFERENCES airports(airport_id),
  arrival_airport_id int REFERENCES airports(airport_id),
  departure_time timestamp NOT NULL,
  arrival_time timestamp NOT NULL,
  airline_id int REFERENCES airlines(airline_id)
);

-- Create a table for storing information about passengers
CREATE TABLE passengers (
  passenger_id serial PRIMARY KEY,
  passenger_name varchar(255) NOT NULL,
  passenger_email varchar(255) NOT NULL,
  flight_id int REFERENCES flights(flight_id)
);


-- Insert data into the airlines table
INSERT INTO airlines (airline_name, established_year)
VALUES
  ('American Airlines', '1930-04-15'),
  ('Delta Airlines', '1924-03-02'),
  ('United Airlines', '1931-03-28');

-- Insert data into the airports table
INSERT INTO airports (airport_name, airport_location)
VALUES
  ('John F. Kennedy International Airport', 'New York, NY'),
  ('Hartsfield-Jackson Atlanta International Airport', 'Atlanta, GA'),
  ('O''Hare International Airport', 'Chicago, IL');

-- Insert data into the flights table
INSERT INTO flights (flight_number, departure_airport_id, arrival_airport_id, departure_time, arrival_time, airline_id)
VALUES
  ('AA100', 1, 2, '2022-12-01 08:00:00', '2022-12-01 10:00:00', 1),
  ('DL200', 2, 3, '2022-12-02 09:00:00', '2022-12-02 11:00:00', 2),
  ('UA300', 3, 1, '2022-12-03 10:00:00', '2022-12-03 12:00:00', 3);

-- Insert data into the passengers table
INSERT INTO passengers (passenger_name, passenger_email, flight_id)
VALUES
  ('John Doe', 'johndoe@example.com', 1),
  ('Jane Doe', 'janedoe@example.com', 2),
  ('Jim Smith', 'jimsmith@example.com', 3);
