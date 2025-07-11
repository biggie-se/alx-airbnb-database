
---Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.

SELECT Booking.booking_id, User.user_id, User.first_name, User.last_name
FROM Booking
INNER JOIN User
ON Booking.user_id = User.user_id;

---Write a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.

SELECT Property.property_id, Property.name, Review.review_id, Review.comment
FROM Property
LEFT JOIN Review
ON Property.property_id = Review.property_id;

---Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

SELECT User.user_id, User.first_name, User.last_name, Booking.booking_id, Booking.start_date
FROM User
FULL OUTER JOIN Booking
ON User.user_id = Booking.user_id
ORDER BY 
    CASE WHEN Booking.start_date IS NULL THEN 1 ELSE 0 END,
    Booking.start_date;