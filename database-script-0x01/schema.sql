CREATE TABLE User (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    `role` ENUM(guest,host,`admin`) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE Property (
    property_id INT PRIMARY KEY,
    host_id INT REFERENCES User(user_id),
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    pricepernight DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    property_id INT REFERENCES Property(property_id),
    user_id INT REFERENCES User(user_id),
    `start_date` DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    `status` ENUM(pending,confirmed,cancelled) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE INDEX idx_booking_property
ON Booking(booking_id, property_id);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    booking_id INT REFERENCES Booking(booking_id),
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    payment_method ENUM(credit_card,paypal,stripe) NOT NULL
);

CREATE INDEX idx_booking_pay
ON Payment(booking_id);

CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    property_id REFERENCES Property(property_id),
    user_id REFERENCES User(user_id),
    rating int CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE Message (
    message_id INT PRIMARY KEY,
    sender_id REFERENCES User(user_id),
    recipient_id REFERENCES User(user_id),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);