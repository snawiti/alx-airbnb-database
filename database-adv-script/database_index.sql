-- ================================================================
-- DATABASE INDEX CREATION SCRIPT
-- Project: alx-airbnb-database
-- Purpose: Improve performance on frequently queried columns
-- ================================================================

-- 1️⃣ Create index on Users table (frequently searched or joined on email and id)
CREATE INDEX idx_users_email ON users (email);
CREATE INDEX idx_users_id ON users (id);

-- 2️⃣ Create index on Bookings table (user_id and property_id are used in JOINs and filters)
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_bookings_created_at ON bookings (created_at);

-- 3️⃣ Create index on Properties table (location and id used in filters or sorting)
CREATE INDEX idx_properties_location ON properties (location);
CREATE INDEX idx_properties_id ON properties (id);

-- 4️⃣ (Optional) Composite index for frequent queries combining multiple columns
-- Example: When filtering bookings by both user_id and property_id
CREATE INDEX idx_bookings_user_property ON bookings (user_id, property_id);
