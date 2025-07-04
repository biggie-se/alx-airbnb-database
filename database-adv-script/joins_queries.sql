SELECT Booking.booking_id
FROM Booking
INNER JOIN User
ON Booking.user_id = User.user_id;

SELECT Property.property_id, Property.name
FROM Property
LEFT JOIN Review
ON Property.property_id = Review.review_id;

SELECT User.user_id, User.first_name, User.last_name
FROM User
FULL OUTER JOIN User.user_id = Booking.user_id