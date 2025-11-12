# Database Performance Monitoring and Refinement

## Objective
Continuously monitor query performance, detect bottlenecks, and apply refinements such as new indexes or schema adjustments to improve efficiency.

---

## Step 1: Monitor Query Performance

### Query 1: Fetch bookings for a specific user
```sql
SHOW PROFILE;
EXPLAIN ANALYZE
SELECT 
    b.id, b.start_date, b.end_date, b.total_amount,
    p.name AS property_name, u.name AS user_name
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE u.id = 3
ORDER BY b.start_date DESC;
