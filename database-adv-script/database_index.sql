-- ================================================================
-- DATABASE INDEX CREATION AND PERFORMANCE TESTING SCRIPT
-- Project: alx-airbnb-database
-- Purpose: Identify, create, and measure the impact of indexes
-- ================================================================

-- 1️⃣ Step 1: Measure performance BEFORE adding indexes
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 5;

EXPLAIN ANALYZE
SELECT *
FROM properties
WHERE location = 'Lusaka';


-- 2️⃣ Step 2: Create indexes on high-usage columns
CREATE INDEX idx_users_email ON users (email);
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_properties_location ON properties (location);


-- 3️⃣ Step 3: Measure performance AFTER adding indexes
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 5;

EXPLAIN ANALYZE
SELECT *
FROM properties
WHERE location = 'Lusaka';


-- 4️⃣ (Optional) Composite index for common combined lookups
CREATE INDEX idx_bookings_user_property ON bookings (user_id, property_id);
