# alx-airbnb-database
# Airbnb Database – Advanced SQL Joins

This project is part of the **ALX Airbnb Database Module**.  
The objective of this task is to practice **complex SQL queries using different types of JOINs** to retrieve and analyze data from an Airbnb-like database.

---

## 📌 Task 0: Write Complex Queries with Joins

### 1. INNER JOIN – Bookings with Users
**Query:**  
Retrieve all bookings and the respective users who made those bookings.

- Uses `INNER JOIN`
- Only returns rows where there is a match between `bookings.user_id` and `users.id`.

---

### 2. LEFT JOIN – Properties with Reviews
**Query:**  
Retrieve all properties and their reviews, including properties that have no reviews.

- Uses `LEFT JOIN`
- Ensures all properties are shown, even if they do not have a review.

---

### 3. FULL OUTER JOIN – Users and Bookings
**Query:**  
Retrieve all users and all bookings, even if a user has no booking or a booking is not linked to a user.

- Uses `FULL OUTER JOIN`  
- Shows unmatched rows from both `users` and `bookings`.

⚠️ Note: If the database system (e.g., MySQL) does not support `FULL OUTER JOIN`, the query is simulated using a combination of `LEFT JOIN` and `RIGHT JOIN` with `UNION`.

---

## 📂 Repository Structure
