/*
Assume the Booking table is large and query performance is slow. 
Implement partitioning on the Booking table based on the start_date column. 
Save the query in a file partitioning.sql
*/

-- partitioning.sql

-- Step 1: Create partitioned Booking table
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    total_price NUMERIC,
    status VARCHAR(20)
) PARTITION BY RANGE (start_date);

-- Step 2: Create bi-monthly partitions
CREATE TABLE Booking_2025_01_02 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2025-03-01');

CREATE TABLE Booking_2025_03_04 PARTITION OF Booking
    FOR VALUES FROM ('2025-03-01') TO ('2025-05-01');

CREATE TABLE Booking_2025_05_06 PARTITION OF Booking
    FOR VALUES FROM ('2025-05-01') TO ('2025-07-01');

CREATE TABLE Booking_2025_07_08 PARTITION OF Booking
    FOR VALUES FROM ('2025-07-01') TO ('2025-09-01');

CREATE TABLE Booking_2025_09_10 PARTITION OF Booking
    FOR VALUES FROM ('2025-09-01') TO ('2025-11-01');

CREATE TABLE Booking_2025_11_12 PARTITION OF Booking
    FOR VALUES FROM ('2025-11-01') TO ('2026-01-01');

-- Test the performance of queries on the partitioned table (e.g., fetching bookings by date range).
EXPLAIN ANALYZE
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
WHERE bb.status = 'confirmed'
AND bb.payment_date >= '2025-01-01'
ORDER BY bb.start_date DESC;