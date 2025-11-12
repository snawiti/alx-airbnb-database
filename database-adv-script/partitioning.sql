-- ================================================================
-- TABLE PARTITIONING IMPLEMENTATION
-- Project: alx-airbnb-database
-- Purpose: Optimize Booking table queries using partitioning
-- ================================================================

-- 1️⃣ Step 1: Drop and recreate a sample Bookings table for demonstration
DROP TABLE IF EXISTS bookings;

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT NOW()
)
PARTITION BY RANGE (start_date);


-- 2️⃣ Step 2: Create partitions by year
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');


-- 3️⃣ Step 3: Insert sample data
INSERT INTO bookings (user_id, property_id, start_date, end_date, total_amount)
VALUES
(1, 10, '2023-03-10', '2023-03-15', 1200.00),
(2, 12, '2024-06-01', '2024-06-05', 800.00),
(3, 14, '2025-02-18', '2025-02-25', 1500.00),
(4, 15, '2025-10-12', '2025-10-14', 600.00);


-- 4️⃣ Step 4: Test performance BEFORE partitioning
-- (Run this only if you have the original non-partitioned table)
-- EXPLAIN ANALYZE
-- SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';


-- 5️⃣ Step 5: Test performance AFTER partitioning
EXPLAIN ANALYZE
SELECT * 
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
