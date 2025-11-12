-- ================================================================
-- PERFORMANCE TESTING AND QUERY OPTIMIZATION
-- Project: alx-airbnb-database
-- ================================================================

-- 1️⃣ Initial (unoptimized) query
-- Retrieves all bookings along with user, property, and payment details
EXPLAIN
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


-- 2️⃣ Observed Issues:
-- - Missing indexes on user_id, property_id, and booking_id columns slow joins.
-- - Selecting all joined tables at once can be costly.
-- - No filtering (retrieves entire dataset unnecessarily).


-- 3️⃣ Optimization: Add indexes to speed up joins
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_payments_booking_id ON payments (booking_id);


-- 4️⃣ Refactored (optimized) query
-- Reduced data retrieval using selective columns and optimized JOIN order
EXPLAIN
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount,
    pay.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE b.created_at >= NOW() - INTERVAL '6 months'
ORDER BY b.created_at DESC;
