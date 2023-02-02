-- CockroachDB database schema for an airline database using ANSI SQL DDL

CREATE TABLE airlines (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL
);

CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    airline_id INTEGER NOT NULL REFERENCES airlines(id),
    flight_number VARCHAR(255) NOT NULL,
    departure_airport VARCHAR(255) NOT NULL,
    arrival_airport VARCHAR(255) NOT NULL,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL
);

CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    passport_number VARCHAR(255) NOT NULL,
    flight_id INTEGER NOT NULL REFERENCES flights(id)
);

INSERT INTO airlines (name, country) VALUES
    ('Delta Airlines', 'USA'),
    ('Air France', 'France'),
    ('Emirates', 'UAE');

INSERT INTO flights (airline_id, flight_number, departure_airport, arrival_airport, departure_time, arrival_time) VALUES
    (1, 'DL1234', 'JFK', 'CDG', '2023-03-01 09:00:00', '2023-03-01 12:00:00'),
    (2, 'AF5678', 'CDG', 'DXB', '2023-03-02 14:00:00', '2023-03-02 18:00:00'),
    (3, 'EK9012', 'DXB', 'JFK', '2023-03-03 10:00:00', '2023-03-03 20:00:00');

INSERT INTO passengers (first_name, last_name, passport_number, flight_id) VALUES
    ('John', 'Doe', '123456789', 1),
    ('Jane', 'Doe', '987654321', 2),
    ('Jim', 'Smith', '555443322', 3);


