--- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.

SELECT p.*, (
    SELECT AVG(r.rating)
    FROM Review r
    WHERE r.property_id = p.property_id
) AS average_rating
FROM Property p
WHERE (
    SELECT AVG(r.rating)
    FROM Review r
    WHERE r.property_id = p.property_id
) > 4.0;

--- Write a correlated subquery to find users who have made more than 3 bookings.

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