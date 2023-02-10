-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  country_name TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city INTEGER REFERENCES cities on DELETE SET NULL,
  to_city INTEGER REFERENCES cities on DELETE SET NULL
);

Create TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers on DELETE CASCADE,
  flight_id INTEGER REFERENCES flights on DELETE CASCADE,
  seat TEXT
);


INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO cities
  (city_name, country_name)
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile');

  INSERT INTO flights
  (departure, arrival, airline, from_city, to_city)
VALUES 
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 1, 2),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 3, 4),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 5, 6),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 2, 7),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 8, 9),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 10, 11),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 12, 13),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 14, 15),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 13, 16),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 17, 18);

  INSERT INTO tickets
  (passenger_id, flight_id, seat)
VALUES
  (1,1,'33B'),
  (2,2, '8A'),
  (3,3, '12F'),
  (1,4, '20A'),
  (4,5, '23D'),
  (2,6, '18C'),
  (5,7, '9E'),
  (6,8, '1A'),
  (5,9, '32B'),
  (7,10, '10D');






