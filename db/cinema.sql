-- DROP TABLE tickets;
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
