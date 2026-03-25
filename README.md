# SQL-Project
## 🎬 Cinema Ticket Booking System (SQL)
Cinema Ticket Booking System : A beginner-level SQL project that manages cinema ticket booking operations. It includes database tables for movies, shows, customers, bookings, and payments, with SQL queries to perform booking, seat availability checks, and data retrieval.

🎬 **Cinema Ticket Booking System (SQL)**

## 📌 Project Overview 
The Cinema Ticket Booking System is a SQL-based database project that simulates the backend of an online movie ticket booking platform. The project is designed to efficiently manage movie listings, theatres, show schedules, seat availability, customers, and ticket bookings using a relational database.
This repository contains a complete SQL script that creates the database schema and supports analytical queries for understanding booking trends and cinema performance.

--

## 🗃️ Database Schema

The database consists of **7 interlinked tables** connected through Foreign Key relationships:

| Table | Description |
|-------|-------------|
| `customer` | Stores customer details (name, email, phone, registration date) |
| `movie` | Contains movie info (title, genre, duration, language, release date) |
| `cinema_hall` | Details of cinema halls (name, location, total seats) |
| `show_time` | Maps movies to halls with date & time slots |
| `seats` | Tracks seat availability (Available / Booked) |
| `booking` | Records customer bookings linked to showtimes & seats |
| `payment` | Stores payment info per booking (UPI, Credit Card, Debit Card, Cash) |
| `feedback` | Customer ratings (1–5) and comments per movie |

--

## 📊 Key Insights from Data

- 💰 **Total Revenue:** ₹5,500 across 20 bookings
- 🏆 **Top Revenue Movies:** Jawan & Pushpa: The Rise — ₹575 each
- ⭐ **Perfect Rated Movies:** Pathaan & Drishyam 2 — 5.0 avg rating
- 📱 **Most Popular Payment Method:** UPI (7 transactions, ₹2,100 total)

--

## 💡 Concepts Demonstrated

- ✅ Database creation & table design
- ✅ Primary Keys & Foreign Keys
- ✅ ENUM & CHECK constraints
- ✅ AUTO_INCREMENT
- ✅ INSERT, SELECT, ALTER TABLE
- ✅ INNER JOIN across multiple tables
- ✅ Subqueries with WHERE IN & HAVING
- ✅ Aggregate functions: SUM, AVG, COUNT, ROUND, MAX
- ✅ GROUP BY, ORDER BY, LIMIT
- ✅ CREATE VIEW for reusable reporting queries
- ✅ LIKE operator for pattern matching

--

## 📈 SQL Analytics Included : 

The project includes SQL queries for analysis such as:

Total tickets booked per movie.

Revenue generated per theatre or show.

Most popular movies and time slots.

Seat occupancy and availability analysis.

Customer booking behavior insights.

These queries help demonstrate data analysis and reporting skills using SQL.
