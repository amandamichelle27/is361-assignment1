# Question #1: 23 speeds are listed, 432 is the max and 90 is the min.
SELECT COUNT(*)   AS num_listed_speed,
       MAX(speed) AS max_speed,
       MIN(speed) AS min_speed
FROM planes
WHERE speed IS NOT NULL;

# Question #2: The total distance is broken down by whether the tailnum is null.
# The total for all tailnums is the sum of the two, 27188805.
# The total for only null tailnums is 81763.
SELECT SUM(distance)   AS total_distance,
	   tailnum IS NULL AS is_null
FROM flights
WHERE year = 2013 AND month = 1
GROUP BY tailnum IS NULL;

# Question #3. The results are the same for the inner join, except that the NULL
# manufacturer result is not returned.
SELECT SUM(f.distance) AS total_distance,
       p.manufacturer
FROM flights f
LEFT OUTER JOIN planes p
ON f.tailnum = p.tailnum
WHERE f.year = 2013 AND f.month = 7 AND f.day = 5
GROUP BY p.manufacturer;

# Question 4.
# Computes the total number of arrivals per manufacturer per airport on 2013-07-05.
SELECT COUNT(*) AS count,
       p.manufacturer,
	   a.name
FROM flights f
INNER JOIN planes p
ON f.tailnum = p.tailnum
LEFT OUTER JOIN airports a
ON a.faa = f.origin
WHERE f.year = 2013 AND f.month = 7 AND f.day = 5
GROUP BY p.manufacturer;