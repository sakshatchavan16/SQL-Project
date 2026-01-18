create database CINEMA_TICKET_BOOKING_SYSTEM;
use CINEMA_TICKET_BOOKING_SYSTEM;

CREATE TABLE customer (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(15),
  registered_date DATE
);
ALTER TABLE customer DROP INDEX email;
desc customer;

CREATE TABLE movie (
  movie_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100),
  genre VARCHAR(50),
  duration INT,
  language VARCHAR(30),
  release_date DATE
);
desc movie;

CREATE TABLE cinema_hall (
  hall_id INT AUTO_INCREMENT PRIMARY KEY,
  hall_name VARCHAR(50),
  total_seats INT,
  location VARCHAR(100)
);
desc cinema_hall;

CREATE TABLE show_time (
  showtime_id INT AUTO_INCREMENT PRIMARY KEY,
  movie_id INT,
  hall_id INT,
  show_date DATE,
  start_time TIME,
  end_time TIME,
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
  FOREIGN KEY (hall_id) REFERENCES cinema_hall(hall_id)
);
desc show_time;

CREATE TABLE seats (
  seat_id INT AUTO_INCREMENT PRIMARY KEY,
  hall_id INT,
  seat_number VARCHAR(10),
  status ENUM('Available','Booked') DEFAULT 'Available',
  FOREIGN KEY (hall_id) REFERENCES cinema_hall(hall_id)
);
desc seats;

CREATE TABLE booking (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  showtime_id INT,
  seat_id INT,
  booking_date DATE,
  status ENUM('Confirmed','Cancelled') DEFAULT 'Confirmed',
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (showtime_id) REFERENCES show_time(showtime_id),
  FOREIGN KEY (seat_id) REFERENCES seats(seat_id)
);
desc booking;
SELECT showtime_id FROM show_time;
select * from seats;


CREATE TABLE payment (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  booking_id INT,
  amount DECIMAL(10,2),
  payment_date DATE,
  method ENUM('UPI','Credit Card','Debit Card','Cash'),
  FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);
desc payment;

CREATE TABLE feedback (
  feedback_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  movie_id INT,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comments VARCHAR(255),
  feedback_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);
desc feedback;
desc feedback;

INSERT INTO movie (title, genre, duration, language, release_date) VALUES
('Pathaan', 'Action', 146, 'Hindi', '2023-01-25'),
('RRR', 'Action', 182, 'Telugu', '2022-03-25'),
('Jawan', 'Action/Thriller', 169, 'Hindi', '2023-09-07'),
('KGF Chapter 2', 'Action/Drama', 168, 'Kannada', '2022-04-14'),
('Pushpa: The Rise', 'Action', 179, 'Telugu', '2021-12-17'),
('Vikram', 'Action/Thriller', 173, 'Tamil', '2022-06-03'),
('Brahmastra', 'Fantasy/Adventure', 167, 'Hindi', '2022-09-09'),
('Gadar 2', 'Action/Drama', 170, 'Hindi', '2023-08-11'),
('Drishyam 2', 'Thriller', 140, 'Hindi', '2022-11-18'),
('Leo', 'Action/Thriller', 164, 'Tamil', '2023-10-19'),
('Kantara', 'Drama', 147, 'Kannada', '2022-09-30'),
('Dangal', 'Sports/Drama', 161, 'Hindi', '2016-12-23'),
('Baahubali: The Beginning', 'Action/Adventure', 159, 'Telugu', '2015-07-10'),
('Baahubali: The Conclusion', 'Action/Adventure', 171, 'Telugu', '2017-04-28'),
('3 Idiots', 'Comedy/Drama', 170, 'Hindi', '2009-12-25'),
('Chhichhore', 'Comedy/Drama', 143, 'Hindi', '2019-09-06'),
('Soorarai Pottru', 'Drama', 153, 'Tamil', '2020-11-12'),
('Article 15', 'Crime/Drama', 130, 'Hindi', '2019-06-28'),
('Tanhaji', 'Historical/Action', 135, 'Hindi', '2020-01-10'),
('Uri: The Surgical Strike', 'Action/War', 138, 'Hindi', '2019-01-11');
select * from movie;

 INSERT INTO show_time (movie_id, hall_id, show_date, start_time, end_time) VALUES
 (1,4,'2025-10-01','10:00:00','12:30:00'),
 (2,5,'2025-10-02','11:00:00','13:30:00'),
 (3,6,'2025-10-03','12:00:00','14:30:00'), 
 (4,7,'2025-10-04','13:00:00','15:30:00'),
 (5,8,'2025-10-05','14:00:00','16:30:00'), 
 (6,9,'2025-10-06','15:00:00','17:30:00'),
 (7,10,'2025-10-07','16:00:00','18:30:00'), 
 (8,11,'2025-10-08','17:00:00','19:30:00'),
 (9,12,'2025-10-09','18:00:00','20:30:00'), 
 (10,13,'2025-10-10','19:00:00','21:30:00'),
 (11,14,'2025-10-11','20:00:00','22:30:00'), 
 (12,15,'2025-10-12','21:00:00','23:30:00'),
 (13,16,'2025-10-13','10:00:00','12:30:00'), 
 (14,17,'2025-10-14','11:00:00','13:30:00'),
 (15,18,'2025-10-15','12:00:00','14:30:00'), 
 (16,19,'2025-10-16','13:00:00','15:30:00'),
 (17,20,'2025-10-17','14:00:00','16:30:00'), 
 (18,1,'2025-10-18','15:00:00','17:30:00'),
 (19,2,'2025-10-19','16:00:00','18:30:00'), 
 (20,3,'2025-10-20','17:00:00','19:30:00');
 select * from show_time;
 
  INSERT INTO seats (hall_id, seat_number, status) VALUES (1,'A1','Booked'),
 (2,'B2','Available'), (3,'C3','Available'), (4,'D4','Available'),
 (5,'E5','Available'), (6,'F6','Booked'), (7,'A7','Available'),
 (8,'B8','Available'), (9,'C9','Available'), (10,'D10','Available'),
 (11,'E11','Booked'), (12,'F12','Available'), (13,'A13','Available'),
 (14,'B14','Available'), (15,'C15','Available'), (16,'D16','Booked'),
 (17,'E17','Available'), (18,'F18','Available'), (19,'A19','Available'),
 (20,'B20','Available');
 select * from seats;

 INSERT INTO customer (name, email, phone, registered_date) VALUES 
-- ('Sahil Chavan','sahil.chavan@example.com','9876500010','2025-01-01'), 
 ('Sneha Patil','sneha.patil@example.com','9876500011','2025-01-06'), 
 ('Rohit Sharma','rohit.sharma@example.com','9876500012','2025-01-11'), 
 ('Priya Singh','priya.singh@example.com','9876500013','2025-01-16'), 
 ('Amit Kumar','amit.kumar@example.com','9876500014','2025-01-21'), 
 ('Neha Gupta','neha.gupta@example.com','9876500015','2025-01-26'), 
 ('Vikas Yadav','vikas.yadav@example.com','9876500016','2025-01-31'), 
 ('Anjali Mehta','anjali.mehta@example.com','9876500017','2025-02-05'), 
 ('Karan Verma','karan.verma@example.com','9876500018','2025-02-10'), 
 ('Maya Nair','maya.nair@example.com','9876500019','2025-02-15'), 
 ('Aditya Roy','aditya.roy@example.com','9876500020','2025-02-20'), 
 ('Rina Patel','rina.patel@example.com','9876500021','2025-02-25'), 
 ('Sunil Joshi','sunil.joshi@example.com','9876500022','2025-03-02'), 
 ('Pooja Kaur','pooja.kaur@example.com','9876500023','2025-03-07'), 
 ('Sameer Khan','sameer.khan@example.com','9876500024','2025-03-12'), 
 ('Tanya Rao','tanya.rao@example.com','9876500025','2025-03-17'), 
 ('Harsh Vardhan','harsh.v@example.com','9876500026','2025-03-22'), 
 ('Isha Bhat','isha.bhat@example.com','9876500027','2025-03-27'),
 ('Devendra','devendra@example.com','9876500028','2025-04-01'),
 ('Rachna','rachna@example.com','9876500029','2025-04-06');
 select * from customer;
 
 INSERT INTO booking (customer_id, showtime_id, seat_id, booking_date) VALUES
(1, 21, 41, '2024-11-10'),
(2, 22, 42, '2024-11-11'),
(3, 23, 43, '2024-11-12'),
(4, 24, 44, '2024-11-13'),
(5, 25, 45, '2024-11-14'),
(6, 21, 46, '2024-11-15'),
(7, 22, 47, '2024-11-16'),
(8, 23, 48, '2024-11-17'),
(9, 24, 49, '2024-11-18'),
(10, 25, 50, '2024-11-19');
INSERT INTO booking (customer_id, showtime_id, seat_id, booking_date) VALUES
(1,26, 51, '2025-01-05'),
(2,27, 52, '2025-01-06'),
(3,28, 53, '2025-01-07'),
(4,29, 54, '2025-01-08'),
(5,30, 55, '2025-01-09'),
(6,31, 56, '2025-01-10'),
(7, 32, 57, '2025-01-11'),
(8, 33, 58, '2025-01-12'),
(9, 34, 59, '2025-01-13'),
(10, 35, 60, '2025-01-14');
select * from booking;

 INSERT INTO payment (booking_id, amount, payment_date, method) VALUES
(51, 250.00, '2025-10-01', 'Credit Card'),
(61, 300.00, '2025-10-02', 'UPI'),
(52, 275.00, '2025-10-03', 'Cash'),
(62, 250.00, '2025-10-04', 'Credit Card'),
(53, 300.00, '2025-10-05', 'UPI'),
(63, 275.00, '2025-10-06', 'Cash'),
(54, 250.00, '2025-10-07', 'Credit Card'),
(64, 300.00, '2025-10-08', 'UPI'),
(55, 275.00, '2025-10-09', 'Cash'),
(65, 250.00, '2025-10-10', 'Credit Card'),
(56, 300.00, '2025-10-11', 'UPI'),
(66, 275.00, '2025-10-12', 'Cash'),
(57, 250.00, '2025-10-13', 'Credit Card'),
(67, 300.00, '2025-10-14', 'UPI'),
(58, 275.00, '2025-10-15', 'Cash'),
(59, 250.00, '2025-10-16', 'Credit Card'),
(60, 300.00, '2025-10-17', 'UPI'),
(68, 275.00, '2025-10-18', 'Cash'),
(69, 250.00, '2025-10-19', 'Credit Card'),
(70, 300.00, '2025-10-20', 'UPI');
select * from payment;

INSERT INTO feedback (customer_id, movie_id, rating, comments, feedback_date) VALUES
(1, 1, 5, 'Amazing action and visuals!', '2024-02-15'),
(2, 2, 4, 'Great storyline and music.', '2024-02-16'),
(3, 3, 5, 'Excellent performance by lead actor.', '2024-03-10'),
(4, 4, 3, 'Good movie but a bit lengthy.', '2024-03-12'),
(5, 5, 4, 'Loved the songs and direction.', '2024-04-01'),
(6, 6, 5, 'Superb thriller, kept me hooked!', '2024-04-05'),
(7, 7, 3, 'Visually good but slow-paced.', '2024-04-07'),
(8, 8, 4, 'Great continuation of the series.', '2024-04-10'),
(9, 9, 5, 'Mind-blowing suspense!', '2024-05-02'),
(10, 10, 4, 'Action-packed and entertaining.', '2024-05-05'),
(1, 2, 5, 'RRR was outstanding in every way.', '2024-05-12'),
(2, 3, 4, 'Jawan had great action and emotion.', '2024-05-20'),
(3, 4, 5, 'KGF 2 was pure mass entertainment.', '2024-06-01'),
(4, 5, 3, 'Pushpa was good, but could be shorter.', '2024-06-10'),
(5, 6, 4, 'Vikram had superb cinematography.', '2024-07-05'),
(6, 7, 5, 'Brahmastra had magical visuals.', '2024-07-15'),
(7, 8, 4, 'Gadar 2 brought back nostalgia.', '2024-08-01'),
(8, 9, 5, 'Drishyam 2 was thrilling and smart.', '2024-08-20'),
(9, 10, 4, 'Leo had intense performances.', '2024-09-05'),
(10, 1, 5, 'Pathaan was a blockbuster!', '2024-09-15');
select * from feedback;

INSERT INTO cinema_hall (hall_name, total_seats, location) VALUES
('PVR Icon Andheri', 250,'Andheri'),
('INOX R City Ghatkopar', 280, 'Ghatkopar'),
('Cinepolis Infinity Malad', 220, ' Malad'),
('Carnival Cinemas Kurla', 200, ' Kurla'),
('Miraj Cinemas Borivali', 230, 'Borivali'),
('Wave Cinemas Thane', 240, ' Thane'),
('Mukta A2 Cinemas Juhu', 210, 'Juhu'),
('Rajhans Cinemas Dadar', 260, 'Dadar'),
('SPI Cinemas Lower Parel', 300, 'Lower Parel'),
('City Pride Mulund', 190, ' Mulund'),
('SRS Cinemas Bandra', 220, ' Bandra'),
('E-Square Andheri East', 200, 'Andheri East'),
('INOX Leisure Colaba', 230, ' Colaba'),
('Big Cinemas Goregaon', 250, ' Goregaon'),
('PVR Gold Chembur', 275, ' Chembur'),
('QFX Cinemas Powai', 210, ' Powai'),
('Galaxy Cinemas Vile Parle', 240, ' Vile Parle'),
('Movietime Malad West', 260, ' Malad West'),
('Plaza Multiplex Dadar West', 225, ' Dadar West'),
('Wave Platinum Bhandup', 250, 'Bhandup');

select * from movie ;
select * from cinema_hall;
select * from show_time;
select * from seats;
select * from customer;
select * from booking ;
select * from payment;
select * from feedback;

-- Q.1 What is the total revenue generated from all bookings?
SELECT SUM(amount) AS Total_Revenue
FROM payment;

-- Q.2  Which films are over 2.30 hours Long.
select title,duration 
from movie
where duration > 150;

-- JOIN QUERIES
-- Q.1 Top 5 customers who made the most bookings overall.
SELECT c.customer_id, c.name AS Customer_Name, COUNT(b.booking_id) AS Total_Bookings
FROM booking b
JOIN customer c ON b.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_Bookings DESC
LIMIT 5;

-- Q.2 Total payment received per movie.
SELECT m.title AS movie_title, SUM(p.amount) AS total_revenue
FROM payment p
JOIN booking b ON p.booking_id = b.booking_id
JOIN show_time st ON b.showtime_id = st.showtime_id
JOIN movie m ON st.movie_id = m.movie_id
GROUP BY m.title
ORDER BY total_revenue DESC;

-- Q.3 List of customers who gave feedback along with the movie name and rating
SELECT c.name AS customer_name, m.title AS movie_title, f.rating, f.comments
FROM feedback f
JOIN customer c ON f.customer_id = c.customer_id
JOIN movie m ON f.movie_id = m.movie_id
ORDER BY f.rating DESC;

-- Q.4 List all bookings with the customer name and movie title.
SELECT b.booking_id, c.name AS Customer_Name, m.title AS Movie_Title
FROM booking b
INNER JOIN customer c ON b.customer_id = c.customer_id
INNER JOIN show_time s ON b.showtime_id = s.showtime_id
INNER JOIN movie m ON s.movie_id = m.movie_id;

-- SUBQUERIES
-- Q.1 Find customers who spent more than the average payment amount
SELECT DISTINCT c.name, p.amount FROM customer c
JOIN booking b ON c.customer_id = b.customer_id
JOIN payment p ON b.booking_id = p.booking_id
WHERE p.amount > 
(SELECT AVG(amount) FROM payment);

-- Q.2 Find movies that have higher than average rating
SELECT m.title, AVG(f.rating) AS avg_rating FROM movie m
JOIN feedback f ON m.movie_id = f.movie_id
GROUP BY m.title
HAVING AVG(f.rating) > 
(SELECT AVG(rating) FROM feedback);

-- Q.3 Get details of the most expensive booking made
SELECT c.name, m.title, p.amount
FROM payment p
JOIN booking b ON p.booking_id = b.booking_id
JOIN show_time st ON b.showtime_id = st.showtime_id
JOIN movie m ON st.movie_id = m.movie_id
JOIN customer c ON b.customer_id = c.customer_id
WHERE p.amount = (SELECT MAX(amount) FROM payment);

-- Q.4 List customers who have booked at least one movie in the “Andheri” location, Finds customers who made bookings in any Andheri hall.
SELECT customer_id,name FROM customer
WHERE customer_id IN
(SELECT b.customer_id FROM booking b
JOIN show_time st ON b.showtime_id = st.showtime_id
JOIN cinema_hall ch ON st.hall_id = ch.hall_id
WHERE ch.location LIKE '%Andheri%');

-- View
-- Q.1 Payment Report by Method
CREATE VIEW payment_report_by_method AS
SELECT 
    method AS payment_method,
    COUNT(payment_id) AS total_transactions,
    SUM(amount) AS total_amount_collected,
    ROUND(AVG(amount),2) AS average_payment
FROM payment
GROUP BY method;
SELECT * FROM payment_report_by_method;

-- Q.2 Top Rated Movies
CREATE VIEW top_rated_movies AS
SELECT 
    m.title,
    ROUND(AVG(f.rating), 2) AS average_rating,
    COUNT(f.feedback_id) AS total_reviews
FROM movie m
JOIN feedback f ON m.movie_id = f.movie_id
GROUP BY m.title
HAVING AVG(f.rating) >= 4.0;
SELECT * FROM top_rated_movies;

-- Q.3 
CREATE VIEW Movie_Show_Details AS
SELECT 
    m.title AS Movie_Title,
    c.hall_name AS Cinema_Hall,
    c.location AS Location,
    s.show_date AS Show_Date,
    s.start_time AS Start_Time,
    s.end_time AS End_Time
FROM show_time s
JOIN movie m ON s.movie_id = m.movie_id
JOIN cinema_hall c ON s.hall_id = c.hall_id;
select * from Movie_Show_Details;

-- Q.4 
CREATE VIEW Payment_Summary AS
SELECT 
    method AS Payment_Method,
    COUNT(payment_id) AS Total_Transactions,
    SUM(amount) AS Total_Amount
FROM payment
GROUP BY method;
select * from Payment_Summary;
















