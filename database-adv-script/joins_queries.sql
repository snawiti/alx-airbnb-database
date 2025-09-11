-- 1. INNER JOIN: Retrieve all bookings with their users
SELECT 
    b.id AS booking_id,
    b.property_id,
    b.check_in,
    b.check_out,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email
FROM bookings b
INNER JOIN users u
    ON b.user_id = u.id;

-- 2. LEFT JOIN: Retrieve all properties with their reviews (if any)
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    r.id AS review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r
    ON p.id = r.property_id;

-- 3. FULL OUTER JOIN: Retrieve all users and bookings
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    b.id AS booking_id,
    b.property_id,
    b.check_in,
    b.check_out
FROM users u
FULL OUTER JOIN bookings b
    ON u.id = b.user_id;

-- Alternative FULL OUTER JOIN for MySQL using UNION
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    b.id AS booking_id,
    b.property_id,
    b.check_in,
    b.check_out
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id

UNION

SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    b.id AS booking_id,
    b.property_id,
    b.check_in,
    b.check_out
FROM users u
RIGHT JOIN bookings b ON u.id = b.user_id;
