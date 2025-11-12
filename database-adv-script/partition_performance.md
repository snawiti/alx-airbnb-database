# Partitioning Performance Report

## Objective
Improve query performance on the large `bookings` table by partitioning it based on the `start_date` column.

---

## Step 1: Before Partitioning
### Query Tested
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
