/* Write a query to find the total number of bookings made by each user, 
using the COUNT function and GROUP BY clause. */

SELECT u.user_id, u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY user_id, u.first_name, u.last_name;

/* Use a window function (ROW_NUMBER, RANK) to rank properties 
based on the total number of bookings they have received.*/

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
    RANK() OVER (
        PARTITION BY location
        ORDER BY property_bookings DESC
    ) AS location_rank
FROM property_booking_counts;
