CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	loyalty_member BOOLEAN DEFAULT FALSE
);


CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	ticket_price NUMERIC(5,2),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE ticket_movie(
	ticket_id INTEGER NOT NULL,
	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id),
	movie_id INTEGER NOT NULL
	
);


CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(50) NOT NULL,
	movie_time TIME,
	movie_date DATE,
	movie_genre VARCHAR(20) NOT NULL,
	movie_rating VARCHAR(15) NOT NULL,
	theater_id INTEGER NOT NULL
);

ALTER TABLE ticket_movie
ADD FOREIGN KEY(movie_id) REFERENCES movie(movie_id);

CREATE TABLE theater(
	theater_id SERIAL PRIMARY KEY,
	theater_name VARCHAR(20) NOT NULL
);

ALTER TABLE movie
ADD FOREIGN KEY(theater_id) REFERENCES theater(theater_id);

SELECT *
FROM customer
