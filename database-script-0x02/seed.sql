INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, `role`, created_at) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'hashedpwd1', '0712345678', 'host', CURRENT_TIMESTAMP()),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'hashedpwd2', '0723456789', 'guest', CURRENT_TIMESTAMP()),
(3, 'Alice', 'Brown', 'alice.brown@example.com', 'hashedpwd3', '0734567890', 'guest', CURRENT_TIMESTAMP()),
(4, 'Bob', 'White', 'bob.white@example.com', 'hashedpwd4', '0745678901', 'host', CURRENT_TIMESTAMP()),
(5, 'Clara', 'Green', 'clara.green@example.com', 'hashedpwd5', '0756789012', 'guest', CURRENT_TIMESTAMP()),
(6, 'David', 'Black', 'david.black@example.com', 'hashedpwd6', '0767890123', 'guest', CURRENT_TIMESTAMP()),
(7, 'Eva', 'Wilson', 'eva.wilson@example.com', 'hashedpwd7', '0778901234', 'host', CURRENT_TIMESTAMP()),
(8, 'Frank', 'Lee', 'frank.lee@example.com', 'hashedpwd8', '0789012345', 'guest', CURRENT_TIMESTAMP()),
(9, 'Grace', 'Hall', 'grace.hall@example.com', 'hashedpwd9', '0790123456', 'guest', CURRENT_TIMESTAMP()),
(10, 'Henry', 'Young', 'henry.young@example.com', 'hashedpwd10', '0701234567', 'host', CURRENT_TIMESTAMP());

INSERT INTO Property (property_id, user_id, `name`, `description`, `location`, pricepernight, created_at, updated_at) VALUES
(1, 1, 'Cozy Apartment', 'A cozy place near city center.', 'Nairobi', 50, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
(2, 4, 'Beach House', 'Beautiful beachfront property.', 'Mombasa', 120, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
(3, 7, 'Mountain Cabin', 'Quiet cabin with great views.', 'Mt. Kenya', 80, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
(4, 1, 'Studio Loft', 'Modern studio in CBD.', 'Nairobi', 45, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
(5, 4, 'Farm Cottage', 'Peaceful cottage on a farm.', 'Naivasha', 70, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
(6, 7, 'Luxury Villa', '5-bedroom luxury villa.', 'Diani', 250, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
(7, 1, 'Guest House', 'Affordable guest house.', 'Kisumu', 35, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
(8, 4, 'Lake View Apartment', 'Apartment with lake view.', 'Nakuru', 60, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
(9, 7, 'Forest Retreat', 'Retreat in forest setting.', 'Aberdares', 90, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
(10, 1, 'City Condo', 'Condo in Westlands.', 'Nairobi', 100, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

INSERT INTO Booking (booking_id, property_id, user_id, `start_date`, end_date, total_price, `status`, created_at) VALUES
(1, 1, 2, '2025-07-01', '2025-07-05', 200, 'confirmed', CURRENT_TIMESTAMP()),
(2, 2, 3, '2025-07-10', '2025-07-15', 600, 'confirmed', CURRENT_TIMESTAMP()),
(3, 3, 5, '2025-07-03', '2025-07-06', 240, 'cancelled', CURRENT_TIMESTAMP()),
(4, 4, 6, '2025-07-08', '2025-07-12', 180, 'confirmed', CURRENT_TIMESTAMP()),
(5, 5, 8, '2025-07-15', '2025-07-18', 210, 'pending', CURRENT_TIMESTAMP()),
(6, 6, 9, '2025-07-20', '2025-07-25', 1250, 'confirmed', CURRENT_TIMESTAMP()),
(7, 7, 3, '2025-07-05', '2025-07-07', 70, 'confirmed', CURRENT_TIMESTAMP()),
(8, 8, 2, '2025-07-11', '2025-07-13', 120, 'pending', CURRENT_TIMESTAMP()),
(9, 9, 5, '2025-07-18', '2025-07-21', 270, 'confirmed', CURRENT_TIMESTAMP()),
(10, 10, 6, '2025-07-25', '2025-07-28', 300, 'confirmed', CURRENT_TIMESTAMP());

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
(1, 1, 200, CURRENT_TIMESTAMP(), 'credit_card'),
(2, 2, 600, CURRENT_TIMESTAMP(), 'paypal'),
(3, 3, 240, CURRENT_TIMESTAMP(), 'mpesa'),
(4, 4, 180, CURRENT_TIMESTAMP(), 'credit_card'),
(5, 5, 210, CURRENT_TIMESTAMP(), 'paypal'),
(6, 6, 1250, CURRENT_TIMESTAMP(), 'mpesa'),
(7, 7, 70, CURRENT_TIMESTAMP(), 'credit_card'),
(8, 8, 120, CURRENT_TIMESTAMP(), 'paypal'),
(9, 9, 270, CURRENT_TIMESTAMP(), 'mpesa'),
(10, 10, 300, CURRENT_TIMESTAMP(), 'credit_card');

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
(1, 1, 2, 4, 'Great place!', CURRENT_TIMESTAMP()),
(2, 2, 3, 5, 'Loved the view.', CURRENT_TIMESTAMP()),
(3, 3, 5, 3, 'Nice but cold at night.', CURRENT_TIMESTAMP()),
(4, 4, 6, 4, 'Good location.', CURRENT_TIMESTAMP()),
(5, 5, 8, 5, 'Peaceful stay.', CURRENT_TIMESTAMP()),
(6, 6, 9, 5, 'Truly luxurious.', CURRENT_TIMESTAMP()),
(7, 7, 3, 3, 'Basic but clean.', CURRENT_TIMESTAMP()),
(8, 8, 2, 4, 'Amazing sunset view.', CURRENT_TIMESTAMP()),
(9, 9, 5, 5, 'Loved the forest walks.', CURRENT_TIMESTAMP()),
(10, 10, 6, 4, 'Good for business trips.', CURRENT_TIMESTAMP());

INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
(1, 2, 1, 'Is the apartment available next week?', CURRENT_TIMESTAMP()),
(2, 3, 4, 'Can I check in early?', CURRENT_TIMESTAMP()),
(3, 5, 7, 'Do you provide breakfast?', CURRENT_TIMESTAMP()),
(4, 6, 1, 'Is there parking space?', CURRENT_TIMESTAMP()),
(5, 8, 4, 'Can I bring my pet?', CURRENT_TIMESTAMP()),
(6, 9, 7, 'Do you have WiFi?', CURRENT_TIMESTAMP()),
(7, 3, 1, 'Can I extend my stay?', CURRENT_TIMESTAMP()),
(8, 2, 4, 'Is there a gym nearby?', CURRENT_TIMESTAMP()),
(9, 5, 7, 'How far is it from town?', CURRENT_TIMESTAMP()),
(10, 6, 1, 'Can I get an invoice?', CURRENT_TIMESTAMP());
