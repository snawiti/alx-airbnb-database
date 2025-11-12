# Query Optimization Report

## Objective
Refactor a complex query that retrieves booking, user, property, and payment information to improve performance.

---

## Step 1: Initial Query
```sql
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email AS user_email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.status,
    b.created_at AS booking_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
ORDER BY b.created_at DESC;
