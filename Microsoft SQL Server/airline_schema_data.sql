-- Microsoft SQL Server database schema for an airline database with ANSI SQL DDL followed by Data for the necessary tables

CREATE TABLE Airlines (
    AirlineID INT PRIMARY KEY IDENTITY(1,1),
    AirlineName VARCHAR(255) NOT NULL,
    Country VARCHAR(255) NOT NULL
);

CREATE TABLE Flights (
    FlightID INT PRIMARY KEY IDENTITY(1,1),
    AirlineID INT FOREIGN KEY REFERENCES Airlines(AirlineID),
    FlightNumber VARCHAR(255) NOT NULL,
    DepartureAirport VARCHAR(255) NOT NULL,
    ArrivalAirport VARCHAR(255) NOT NULL,
    DepartureDateTime DATETIME NOT NULL,
    ArrivalDateTime DATETIME NOT NULL
);

CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Phone VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY IDENTITY(1,1),
    PassengerID INT FOREIGN KEY REFERENCES Passengers(PassengerID),
    FlightID INT FOREIGN KEY REFERENCES Flights(FlightID),
    BookingDateTime DATETIME NOT NULL,
    SeatNumber VARCHAR(255) NOT NULL
);


INSERT INTO Airlines (AirlineName, Country)
VALUES
    ('Delta Air Lines', 'United States'),
    ('Emirates', 'United Arab Emirates'),
    ('Lufthansa', 'Germany');

INSERT INTO Flights (AirlineID, FlightNumber, DepartureAirport, ArrivalAirport, DepartureDateTime, ArrivalDateTime)
VALUES
    (1, 'DL123', 'Atlanta', 'London', '2023-02-01 08:00:00', '2023-02-01 12:00:00'),
    (2, 'EK456', 'Dubai', 'New York', '2023-02-01 09:00:00', '2023-02-01 16:00:00'),
    (3, 'LH789', 'Frankfurt', 'Tokyo', '2023-02-01 10:00:00', '2023-02-01 16:00:00');

INSERT INTO Passengers (FirstName, LastName, Phone, Email)
VALUES
    ('John', 'Doe', '1234567890', 'johndoe@email.com'),
    ('Jane', 'Doe', '0987654321', 'janedoe@email.com'),
    ('Jim', 'Smith', '67890 12345', 'jimsmith@email.com');

INSERT INTO Bookings (PassengerID, FlightID, BookingDateTime, SeatNumber)
VALUES
    (1, 1, '2022-12-01 08:00:00', 'A1'),
    (2, 2, '2022-12-01 09:00:00', 'B2');

