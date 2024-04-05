### Firstly, I have created a databse :

```SQL
CREATE DATABASE HotelReservation;
USE HotelReservation;
```
### The following query is used to view the data from the dataset
```SQL
Select * from Hotel;
```
Booking_ID|	no_of_adults|	no_of_children|	no_of_weekend_nights|no_of_week_nights|	type_of_meal_plan	|room_type_reserved |lead_time |  
----------|-------------|---------------|---------------------|-----------------|-------------------|-----------------|---------    
INN00001| 2 |0	|1 |	2 |	Meal Plan 1	|Room_Type 1 |	224	|2017-02-10 |Offline|65	    |Not_Canceled   |
INN00002|	2	|0	|2 |	3	| Not Selected|Room_Type 1 |	5	  |2018-06-11	|Online	|106.68	| Not_Canceled  |
INN00003|	1	|0	|2 |	1	| Meal Plan 1	|Room_Type 1 |  1	  |2018-02-28	|Online	|60     | Canceled      |
INN00004|	2	|0	|0 |	2 |	Meal Plan 1	|Room_Type 1 |	211	|2018-05-20	|Online	|100	  | Canceled      |
INN00005|	2	|0	|1 |	1	| Not Selected|Room_Type 1 |	48	|2018-11-04	|Online	|94.5	  | Canceled      |
INN00006|	2	|0	|0 |	2	| Meal Plan 2	|Room_Type 1 |	346	|2018-09-13	|Online	|115	  | Canceled      |
INN00007|	2	|0	|1 |	3	| Meal Plan 1	|Room_Type 1 |  34	|2017-10-15	|Online	|107.55	| Not_Canceled  |
INN00008|	2	|0	|1 |	3	| Meal Plan 1	|Room_Type 4 |	83	|2018-12-26	|Online	|105.61	| Not_Canceled  |
INN00009|	3	|0	|0 |  4	| Meal Plan 1	|Room_Type 1 |	121	|2018-06-07	|Offline|	96.9	| Not_Canceled  |
INN00010|	2	|0	|0 |	5	| Meal Plan 1	|Room_Type 4 |	44	|2018-10-18	|Online	|133.44	| Not_Canceled  |

### 1.Finding the total no. of reservations 
```SQL
Select count(Booking_Id) As Total_Reservations
from Hotel;
```
### What is the most popular meal plan among guests?
```SQL
Select type_of_meal_plan, count(type_of_meal_plan) as No_of_times_meal_ordered
from Hotel
Group by type_of_meal_plan
Order by No_of_times_meal_ordered DESC
;
```
### What is the average price per room for reservations involving children?
```SQL
Select Avg(avg_price_per_room) as Avg_price
from Hotel
where no_of_children > 0;
```
### How many reservations were made for the year 2017?
```SQL
SELECT count(*)
FROM Hotel
WHERE YEAR(arrival_date) = 2017;
```

### What is the most Commonly booked room type?
```SQL
Select room_type_reserved, count(room_type_reserved) as Most_popular_room_types
from Hotel
Group by room_type_reserved
Order by Most_popular_room_types DESC
;
```
### How many reservations fall on a weekend (no_of_weekend_nights > 0)?
```SQL
Select count(*) as Reservation_on_weekend
from Hotel
where no_of_weekend_nights > 0;
```
### What is the highest and lowest lead time for reservations?
```SQL
Select Max(Cast(lead_time as int)) as Highest_lead_time, Min(Cast(lead_time as int)) as Lowest_lead_time
from hotel
;
```
### What is the most common market segment type for reservations?
```SQL
Select market_segment_type, count(market_segment_type) as Most_common_segment_type
from Hotel
Group by market_segment_type
Order by Most_common_segment_type DESC;
```
### How many reservations have a booking status of "Confirmed"?
```SQL
Select count(*) as Confirmed_Reservations
from Hotel
where booking_status = 'Not_Canceled';
```
### What is the total number of adults and children across all reservations?
```SQL
Select sum(no_of_adults) As Total_no_of_Adults,sum(no_of_children) As Total_no_of_Children
from hotel
;
```
### What is the average number of weekend nights for reservations involving children?
```SQL
Select AVG(no_of_weekend_nights) as Avg_weekend_nights
from Hotel
where no_of_children >0 ;
```
### How many reservations were made in each month of the year?
```SQL
Select Month(arrival_date) as Reservation_Month, count(*) As TotalReservations
From Hotel
Group by Month(arrival_date)
Order by TotalReservations DESC
;
```
### What is the average number of nights (both weekend and weekday) spent by guests for each room type?
```SQL
Select room_type_reserved AS RoomType, Avg(no_of_weekend_nights + no_of_week_nights) As Avg_no_of_nights
from Hotel
Group by room_type_reserved
Order by Avg_no_of_nights DESC;
```
### For reservations involving children, what is the most common room type, and what is the average price for 
### that room type?
```SQL
Select room_type_reserved AS RoomType, Avg(avg_price_per_room) As Avg_price
from Hotel
Where no_of_children > 0
Group by room_type_reserved
Order by Avg_price DESC
;
```
### Find the market segment type that generates the highest average price per room.
```SQL
Select market_segment_type, Max(avg_price_per_room) AS Highest_Avg_price
from Hotel
Group by market_segment_type
Order by Highest_Avg_price DESC
;
```
