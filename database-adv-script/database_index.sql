/* Identify high-usage columns in your User, Booking, and Property tables 
(e.g., columns used in WHERE, JOIN, ORDER BY clauses).

High usage columns: Property.rating, Property.name, Property.location, Booking.status, User.first_name, User.last_name
*/

--- Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql

CREATE INDEX idx_name_location_rating
ON Property(name, location, rating);

CREATE INDEX idx_status
ON Booking(status);

CREATE INDEX idx_firstlast_name
ON User(first_name, last_name);

--- Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.

--- idx_name_location_rating

EXPLAIN ANALYZE
WITH property_booking_counts AS (
    SELECT 
        p.property_id,
        p.name,
        p.location,
        COUNT(b.booking_id) AS property_bookings
    FROM Property p
    LEFT JOIN Booking b ON b.property_id = p.property_id
    GROUP BY p.property_id, p.name, p.location
)

SELECT 
    property_id,
    name,
    location,
    property_bookings,
    RANK() OVER (
        ORDER BY property_bookings DESC
    ) AS overall_rank,
    ROW_NUMBER() OVER (
        PARTITION BY location
        ORDER BY property_bookings DESC
    ) AS location_rank
FROM property_booking_counts;

--- idx_status & idx_firstlast_name

EXPLAIN ANALYZE
SELECT u.*, (
    SELECT COUNT(b.status)
    FROM Booking b
    WHERE b.user_id = u.user_id AND b.status = 'confirmed'
) AS confirmed_bookings
FROM User u
WHERE (
    SELECT COUNT(b.status)
    FROM Booking b
    WHERE b.user_id = u.user_id AND b.status = 'confirmed' 
) > 3
ORDER BY confirmed_bookings DESC;