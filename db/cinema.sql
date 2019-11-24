DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE films;
DROP TABLE customers;


CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR,
  price INT
);

CREATE TABLE customers(
  ID SERIAL4 PRIMARY KEY,
  name VARCHAR,
  funds INT
);

CREATE TABLE screenings(
  ID SERIAL4 PRIMARY KEY,
  film_id INT4 REFERENCES films(id),
  showing_time VARCHAR
);

CREATE TABLE tickets(
  ID SERIAL4 PRIMARY KEY,
  cust_id INT4 REFERENCES customers(id),
  film_id INT4 REFERENCES films(id),
  screening_id INT4 REFERENCES screenings(id)
);
