-- MySQL database schema for an airline database with ANSI SQL DDL followed by Data for the necessary tables

CREATE TABLE airlines (
  airline_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  headquarters VARCHAR(255) NOT NULL,
  established DATE NOT NULL
);

CREATE TABLE flights (
  flight_id INT AUTO_INCREMENT PRIMARY KEY,
  airline_id INT NOT NULL,
  departure_airport VARCHAR(255) NOT NULL,
  arrival_airport VARCHAR(255) NOT NULL,
  departure_time TIME NOT NULL,
  arrival_time TIME NOT NULL,
  FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
);

CREATE TABLE passengers (
  passenger_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  passport_number VARCHAR(255) NOT NULL,
  nationality VARCHAR(255) NOT NULL
);

CREATE TABLE bookings (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  flight_id INT NOT NULL,
  passenger_id INT NOT NULL,
  seat_number VARCHAR(255) NOT NULL,
  FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
  FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
);


INSERT INTO airlines (name, headquarters, established) VALUES
  ('Delta Airlines', 'Atlanta, GA', '1924-05-30'),
  ('United Airlines', 'Chicago, IL', '1926-04-06');

INSERT INTO flights (airline_id, departure_airport, arrival_airport, departure_time, arrival_time) VALUES
  (1, 'Atlanta, GA', 'Los Angeles, CA', '2022-07-01 12:00:00', '2022-07-01 16:00:00'),
  (1, 'Atlanta, GA', 'London, UK', '2022-07-01 18:00:00', '2022-07-02 10:00:00'),
  (2, 'Chicago, IL', 'New York, NY', '2022-07-01 12:00:00', '2022-07-01 14:00:00');

INSERT INTO passengers (first_name, last_name, passport_number, nationality) VALUES
  ('John', 'Doe', 'A12345678', 'United States'),
  ('Jane', 'Doe', 'B12345678', 'Canada');

INSERT INTO bookings (flight_id, passenger_id, seat_number) VALUES
  (1, 1, 'A1'),
  (2, 2, 'B2');
