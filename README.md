# alx-airbnb-database
# Subqueries Practice

## Objective
Practice writing correlated and non-correlated subqueries in SQL.

## Queries Implemented
1. **Properties with Average Rating > 4.0**
   ```sql
   SELECT p.id, p.name, p.location
   FROM properties p
   WHERE p.id IN (
       SELECT r.property_id
       FROM reviews r
       GROUP BY r.property_id
       HAVING AVG(r.rating) > 4.0
   );

# Aggregations and Window Functions

## Objective
Use SQL aggregation and window functions to analyze Airbnb data.

## Queries Implemented

### 1. Total Number of Bookings per User
```sql
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;
