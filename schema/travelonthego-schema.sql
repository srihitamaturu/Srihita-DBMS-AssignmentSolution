CREATE SCHEMA TravelOnTheGo;

USE TravelOnTheGo;

CREATE TABLE PRICE (
 Bus_Type varchar(50),
 Distance int,
 Season varchar(50) DEFAULT 'Normal',
 Price int
 );
 
CREATE INDEX PriceList 
	ON PRICE(
		Bus_Type, 
        Distance);

CREATE TABLE PASSENGER (
Passenger_name varchar(50),
 Category varchar(10),
 Gender varchar(1),
 Boarding_City varchar(20),
 Destination_City varchar(20),
 Distance int,
 Bus_Type varchar(50),
 FOREIGN KEY(Bus_Type, Distance) REFERENCES Price(Bus_Type, Distance)
);