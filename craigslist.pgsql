DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist

CREATE TABLE regions 
(
  id SERIAL PRIMARY KEY,
  region_name TEXT UNIQUE NOT NULL
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  category_name TEXT UNIQUE NOT NULL
);

CREATE TABLE USERS 
(
  id SERIAL PRIMARY KEY,
  username VARCHAR(15) UNIQUE NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  preferred_region INTEGER REFERENCES regions ON DELETE SET NULL
);


CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  post_text TEXT,
  price FLOAT,
  user_id INTEGER REFERENCES users ON DELETE CASCADE,
  location TEXT,
  region_id INTEGER REFERENCES regions ON DELETE CASCADE
);

CREATE TABLE post_categories
(
  id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES posts ON DELETE CASCADE,
  category_id INTEGER REFERENCES categories ON DELETE CASCADE
);

INSERT INTO regions (region_name)
VALUES
('Denver'),
('Seattle');

INSERT INTO categories (category_name)
VALUES
('Furniture'),
('Appliances');

INSERT INTO users (username, email, password, preferred_region)
VALUES
('therealcraig', 'craig@craigslist.com', '######', 1),
('alexfofalex', 'alex@fofalex.com', '######', 2);

INSERT INTO posts (title, post_text, price, user_id, location, region_id)
VALUES
('WHO WANTS THIS COUCH','Its a very good couch', 200, 1, 'Thornton', 1),
('Recliner with built in fridge','No low-ball offers, I know what I have here', 300, 2, 'Downtown', 2);

INSERT INTO post_categories (post_id, category_id)
VALUES
(1,1),
(2,1),
(2,2);

