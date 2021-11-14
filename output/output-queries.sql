/* 3) How many females and how many male passengers travelled for a minimum distance of
600 KMs? */

SELECT p.gender, 
	COUNT(p.gender)
FROM passenger p
WHERE distance >= 600
GROUP BY p.gender;

/* 4)Find the minimum ticket price for Sleeper Bus.*/

SELECT min(price)	
FROM price p  
WHERE Bus_Type ='Sleeper';

/* 5) Select passenger names whose names start with character 'S' */

SELECT Passenger_name FROM PASSENGER 
WHERE Passenger_name like 'S%';

/* 6) Calculate price charged for each passenger displaying Passenger name, Boarding City,
Destination City, Bus_Type, Price in the output */

SELECT p.Passenger_name, 
	p.Boarding_City,
	p.Destination_City,
    p.Bus_Type,
    s.Price,
    s.season
FROM Passenger p 
INNER JOIN price s
	ON p.Bus_Type=s.Bus_Type 
		AND p.distance=s.distance;

/* 7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a
distance of 1000 KMs */

SELECT 
	passenger_name,
    s.price 
FROM passenger p
INNER JOIN price s 
	ON p.Bus_Type=s.Bus_Type 
		AND p.distance=s.distance
WHERE p.bus_Type='Sitting' 
	AND p.distance=1000;

/* 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to
Panaji? */

SELECT 
	p.Bus_Type, 
	p.Price 
FROM PRICE p
WHERE p.Distance = (
	SELECT s.Distance 
    FROM Passenger s
    WHERE s.Boarding_City = 'Panaji'
		AND s.Destination_City = 'Bengaluru');
        
/* 9) List the distances from the "Passenger" table which are unique (non-repeated
distances) in descending order. */

SELECT DISTINCT(p.Distance) 
FROM Passenger p 
ORDER BY 1 DESC;

/* 10) Display the passenger name and percentage of distance travelled by that passenger
from the total distance travelled by all passengers without using user variables */

SELECT p.Passenger_Name, 
	p.Distance / (SELECT SUM(Distance) FROM Passenger) * 100 as 'Distance%'
FROM Passenger p;

/* 11) Display the distance, price in three categories in table Price
a) Expensive if the cost is more than 1000
b) Average Cost if the cost is less than 1000 and greater than 500
c) Cheap otherwise */

SELECT p.Bus_Type, 
	p.Distance,
    p.Price,
    CASE 
		WHEN p.Price > 1000 
			THEN 'Expensive'
		WHEN p.price > 500 
			THEN 'Average Cost'
		WHEN p.price IS NULL
			THEN 'Unknown'
		ELSE 'Cheap'
        END as "Price_Category"
	FROM Price p;