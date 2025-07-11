/*
Write an initial query that retrieves all bookings along with 
the user details, property details, and payment details and save it on perfomance.sql

Analyze the query’s performance using EXPLAIN and identify any inefficiencies.
*/

EXPLAIN ANALYZE
SELECT 
    b.booking_id, b.start_date, b.end_date, b.total_price, b.status, 
    u.first_name, u.last_name, p.name, p.location, pa.payment_date
FROM Booking b
INNER JOIN User u
ON b.user_id = u.user_id
INNER JOIN Property p
ON b.property_id = p.property_id
INNER JOIN Payment pa
ON b.booking_id = pa.booking_id;

/*
Refactor the query to reduce execution time, 
such as reducing unnecessary joins or using indexing.
*/

WITH booking_base AS (
    SELECT 
        b.booking_id, b.start_date, b.end_date, b.total_price, b.status,
        b.user_id, b.property_id,
        pa.payment_date
    FROM Booking b
    LEFT JOIN Payment pa
        ON b.booking_id = pa.booking_id
)
SELECT 
    bb.booking_id, bb.start_date, bb.end_date, bb.total_price, bb.status,
    u.first_name, u.last_name,
    p.name AS property_name, p.location,
    bb.payment_date
FROM booking_base bb
INNER JOIN User u
    ON bb.user_id = u.user_id
INNER JOIN Property p
    ON bb.property_id = p.property_id
ORDER BY bb.start_date DESC;
