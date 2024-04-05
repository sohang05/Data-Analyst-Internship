CREATE DATABASE HotelReservation;

USE HotelReservation;

Select * from Hotel;

-------Total no. of reservations in the dataset---------

Select count(Booking_Id) As Total_Reservations
from Hotel;

--------Most popular meal plan among guests--------------

Select type_of_meal_plan, count(type_of_meal_plan) as No_of_times_meal_ordered
from Hotel
Group by type_of_meal_plan
Order by No_of_times_meal_ordered DESC
;

---------Avg price per room for reservation involving children----------

Select Avg(avg_price_per_room) as Avg_price
from Hotel
where no_of_children > 0;

----------Reservations made for the year 2017----------------------------
SELECT count(*)
FROM Hotel
WHERE YEAR(arrival_date) = 2017;


----------Most Commonly booked room type----------------------------------
Select room_type_reserved, count(room_type_reserved) as Most_popular_room_types
from Hotel
Group by room_type_reserved
Order by Most_popular_room_types DESC
;

----------Reservations that fall on weekend-------------------------------
Select count(*) as Reservation_on_weekend
from Hotel
where no_of_weekend_nights > 0;

----------Lowest and Highest lead time for reservations------------------

Select Max(Cast(lead_time as int)) as Highest_lead_time, Min(Cast(lead_time as int)) as Lowest_lead_time
from hotel
;

----------The most common market segment type for reservations_------------

Select market_segment_type, count(market_segment_type) as Most_common_segment_type
from Hotel
Group by market_segment_type
Order by Most_common_segment_type DESC;

----------How many reservations have a booking status of "Confirmed"?---------

Select count(*) as Confirmed_Reservations
from Hotel
where booking_status = 'Not_Canceled';

----------What is the total number of adults and children across all reservations?---

Select sum(no_of_adults) As Total_no_of_Adults,sum(no_of_children) As Total_no_of_Children
from hotel
;

-------------What is the average number of weekend nights for reservations involving children?-----

Select AVG(no_of_weekend_nights) as Avg_weekend_nights
from Hotel
where no_of_children >0 ;

-------------How many reservations were made in each month of the year?--------------
Select Month(arrival_date) as Reservation_Month, count(*) As TotalReservations
From Hotel
Group by Month(arrival_date)
Order by TotalReservations DESC
;

-----------What is the average number of nights (both weekend and weekday) spent by guests for each room type?

Select room_type_reserved AS RoomType, Avg(no_of_weekend_nights + no_of_week_nights) As Avg_no_of_nights
from Hotel
Group by room_type_reserved
Order by Avg_no_of_nights DESC;

-----------For reservations involving children, what is the most common room type, and what is the average price for that room type?

Select room_type_reserved AS RoomType, Avg(avg_price_per_room) As Avg_price
from Hotel
Where no_of_children > 0
Group by room_type_reserved
Order by Avg_price DESC
;

-------Find the market segment type that generates the highest average price per room----------------

Select market_segment_type, Max(avg_price_per_room) AS Highest_Avg_price
from Hotel
Group by market_segment_type
Order by Highest_Avg_price DESC
;