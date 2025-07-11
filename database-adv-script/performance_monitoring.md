# Objective: 

- Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

# Instructions:

- Use SQL commands like SHOW PROFILE or EXPLAIN ANALYZE to monitor the performance of a few of your frequently used queries.

- Identify any bottlenecks and suggest changes (e.g., new indexes, schema adjustments).

- Implement the changes and report the improvements.*/

<h3>First, enable profiling for the session</h3>
SET profiling = 1;

<h3>Run your query</h3>
SELECT * FROM bookings WHERE property_id = 25;

<h3>View profiling results</h3>
SHOW PROFILES;

<h3>Get detailed breakdown of the last query</h3>
SHOW PROFILE FOR QUERY 1;

<h3>You can check specific aspects like CPU or memory usage if needed</h3>
SHOW PROFILE CPU FOR QUERY 1;
