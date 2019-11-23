DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR,
  price INT
);

CREATE table customers(
  ID SERIAL4 PRIMARY KEY,
  name VARCHAR,
  funds INT
);

CREATE TABLE tickets(
  ID SERIAL4 PRIMARY KEY,
  cust_id INT,
  film_id INT
)
