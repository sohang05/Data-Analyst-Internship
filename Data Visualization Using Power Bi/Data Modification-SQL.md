# DATA MODIFICATION USING SQL

This is task 3 of the data analyst internship. In this project I have to provide insights on Indian agriculture using **Power Bi**.
The dataset used in this project contains data on different types of crops that were cultivated across India during the year 1966-2017.
The dataset contains about **80 columns** and **16000+ rows**. So, it is difficult to view, analyze and visualize all this data.
In order for the data to be visualized the dataset needs to be split into different categories. To do so, I have used SQL and below are
the steps I have used to modify the data


### First step in any SQL query is to create a database and store our data in that database.
```SQL
Create Database Indian_Agriculture;
Use Indian_Agriculture;
```
### The Select Query is used to view or retrieve the specified data from a table. The * symbol simply means "ALL", i.e I have used * to retrieve all data from the table.
```SQL
Select * from crop_analysis;
```


### I have createed a new table with only State and District info.
```SQL
Create Table State_Dist_Info(
[Year] int,  
[State Name] varchar(100), 
[Dist Name] varchar(100)
);
```
```SQL
Insert into State_Dist_Info(
[Year],
[State Name],
[Dist Name])

Select 
[Year],
[State Name],
[Dist Name]
from crop_analysis;
```
```SQL
Select * from State_Dist_Info;
```
### After creating a State-District table I have added Zone column to specify zone for each State.

#### Alter is used to make any changes into an existing table.
```SQL
Alter Table State_Dist_Info ADD Zone varchar(200);
```
```SQL
UPDATE State_Dist_Info
SET Zone = 'North'
Where [State Name] IN ('Haryana','Punjab','Uttar Pradesh','Uttarakhand','Himachal Pradesh');

UPDATE State_Dist_Info
SET Zone = 'South'
Where [State Name] IN ('Andhra Pradesh','Karnataka','Kerala','Tamil Nadu','Telangana');

UPDATE State_Dist_Info
SET Zone = 'East'
Where [State Name] IN ('Bihar','Orissa','West Bengal','Jharkhand');

UPDATE State_Dist_Info
SET Zone = 'West'
Where [State Name] IN ('Gujarat','Maharashtra','Rajasthan');

UPDATE State_Dist_Info
SET Zone = 'Central'
Where [State Name] IN ('Madhya Pradesh','Chhattisgarh');

UPDATE State_Dist_Info
SET Zone = 'NorthEast'
Where [State Name] IN ('Assam');
```
```SQL
Select * from State_Dist_Info;
```
### Now, I have created another table with category

```SQL
Create table Category(
	[Crop ID] INT IDENTITY(100001, 1),
	[Crop Name] varchar(255),
	[Category] VARCHAR(255)
);
```
```SQL
INSERT INTO Category ([Crop Name], [Category])
VALUES('Rice', 'Cereals'),
	('Wheat', 'Cereals'),
	('Kharif Sorghum', 'Cereals'),
	('Rabi Sorghum', 'Cereals'),
	('Sorghum','Cereals'),
	('Pearl Millet', 'Cereals'),
	('Maize', 'Cereals'), 
	('Finger Millet', 'Cereals'),
	('Barley', 'Cereals'),
	('Chickpea', 'Pulse'),
	('Pigeonpea', 'Pulse'),
	('Minor Pulse', 'Pulse'),
	('Groundnut', 'Oilseeds'),
	('Sesamum', 'Oilseeds'),
	('Rapeseed and Mustard', 'Oilseeds'),
	('Safflower', 'Oilseeds'), 
	('Castor', 'Oilseeds'),
	('Linseed', 'Oilseeds'),
	('Sunflower', 'Oilseeds'),
	('Soyabean', 'Oilseeds'),
	('Sugarcane', 'Sugar Crop'),
	('Cotton', 'Fiber Crop');
```
```SQL
SELECT * FROM Category;
```

### Creating individual columns based on Area, Production & Yield

### BASED ON AREA
```SQL
Create Table Crop_Area(
[Year] int, 
[State Name] varchar(100),
[Dist Name] varchar(100),
[Rice]float, 
[Wheat]float, 
[Kharif_Sorghum]float, 
[Rabi_Sorghum]float, 
[Sorghum]float,
[Pearl_Millet] float, 
[Maize]float, 
[Finger_Millet]float,
[Barley] float,
[Chickpea] float, 
[Pigeonpea] float, 
[Minor_Pulses] float,
[Groundnut]float,
[Sesamum]float, 
[Rapeseed_Mustard] float,
[Safflower]float, 
[Castor]float, 
[Linseed]float, 
[Sunflower]float, 
[Soyabean]float,
[Sugarcane]float, 
[Oilseeds]float, 
[Cotton]float,
[Total Area (1000 ha)] float
);
```
```SQL
Insert into Crop_Area(
[Year] ,  
[State Name] ,
[Dist Name],
[Rice], 
[Wheat], 
[Kharif_Sorghum], 
[Rabi_Sorghum], 
[Sorghum],
[Pearl_Millet], 
[Maize], 
[Finger_Millet],
[Barley] ,
[Chickpea] , 
[Pigeonpea] , 
[Minor_Pulses],
[Groundnut],
[Sesamum], 
[Rapeseed_Mustard] ,
[Safflower], 
[Castor], 
[Linseed], 
[Sunflower], 
[Soyabean],
[Sugarcane], 
[Oilseeds], 
[Cotton],
[Total Area (1000 ha)])

Select
[Year], 
[State Name],
[Dist Name] ,
[RICE AREA (1000 ha)],
[WHEAT AREA (1000 ha)] ,
[KHARIF SORGHUM AREA (1000 ha)],
[RABI SORGHUM AREA (1000 ha)],
[SORGHUM AREA (1000 ha)],
[PEARL MILLET AREA (1000 ha)],
[MAIZE AREA (1000 ha)],
[FINGER MILLET AREA (1000 ha)],
[BARLEY AREA (1000 ha)],
[CHICKPEA AREA (1000 ha)],
[PIGEONPEA AREA (1000 ha)],
[MINOR PULSES AREA (1000 ha)],
[GROUNDNUT AREA (1000 ha)],
[SESAMUM AREA (1000 ha)],
[RAPESEED AND MUSTARD AREA (1000 ha)],
[SAFFLOWER AREA (1000 ha)],
[CASTOR AREA (1000 ha)],
[LINSEED AREA (1000 ha)],
[SUNFLOWER AREA (1000 ha)],
[SOYABEAN AREA (1000 ha)],
[SUGARCANE AREA (1000 ha)],
[OILSEEDS AREA (1000 ha)],
[COTTON AREA (1000 ha)],
([RICE AREA (1000 ha)]+[WHEAT AREA (1000 ha)]+[KHARIF SORGHUM AREA (1000 ha)]+[RABI SORGHUM AREA (1000 ha)]+[SORGHUM AREA (1000 ha)]+
[PEARL MILLET AREA (1000 ha)]+[MAIZE AREA (1000 ha)]+[FINGER MILLET AREA (1000 ha)]+[BARLEY AREA (1000 ha)]+[CHICKPEA AREA (1000 ha)]+
[PIGEONPEA AREA (1000 ha)]+[MINOR PULSES AREA (1000 ha)]+[GROUNDNUT AREA (1000 ha)]+[SESAMUM AREA (1000 ha)]+[RAPESEED AND MUSTARD AREA (1000 ha)]+
[SAFFLOWER AREA (1000 ha)]+[CASTOR AREA (1000 ha)]+[LINSEED AREA (1000 ha)]+[SUNFLOWER AREA (1000 ha)]+[SOYABEAN AREA (1000 ha)]+[SUGARCANE AREA (1000 ha)]+
[OILSEEDS AREA (1000 ha)]+[COTTON AREA (1000 ha)])
from crop_analysis;
```
```SQL
Select * from Crop_Area;
```

### BASED ON PRODUCTION
```SQL
Create Table Crop_Production(
[Year] int, 
[State Name] varchar(100),
[Dist Name] varchar(100),
[Rice]float, 
[Wheat]float, 
[Kharif_Sorghum]float, 
[Rabi_Sorghum]float, 
[Sorghum]float,
[Pearl_Millet] float, 
[Maize]float, 
[Finger_Millet]float,
[Barley] float,
[Chickpea] float, 
[Pigeonpea] float, 
[Minor_Pulses] float,
[Groundnut]float,
[Sesamum]float, 
[Rapeseed_Mustard] float,
[Safflower]float, 
[Castor]float, 
[Linseed]float, 
[Sunflower]float, 
[Soyabean]float,
[Sugarcane]float, 
[Oilseeds]float, 
[Cotton]float,
[Total Production (1000 tons)] float
);
```
```SQL
Insert into Crop_Production(
[Year] , 
[State Name],
[Dist Name] ,
[Rice], 
[Wheat], 
[Kharif_Sorghum], 
[Rabi_Sorghum], 
[Sorghum],
[Pearl_Millet], 
[Maize], 
[Finger_Millet],
[Barley] ,
[Chickpea] , 
[Pigeonpea] , 
[Minor_Pulses],
[Groundnut],
[Sesamum], 
[Rapeseed_Mustard] ,
[Safflower], 
[Castor], 
[Linseed], 
[Sunflower], 
[Soyabean],
[Sugarcane], 
[Oilseeds], 
[Cotton],
[Total Production (1000 tons)])

Select
[Year],
[State Name],
[Dist Name] ,
[RICE PRODUCTION (1000 tons)],
[WHEAT PRODUCTION (1000 tons)] ,
[KHARIF SORGHUM PRODUCTION (1000 tons)],
[RABI SORGHUM PRODUCTION (1000 tons)],
[SORGHUM PRODUCTION (1000 tons)],
[PEARL MILLET PRODUCTION (1000 tons)],
[MAIZE PRODUCTION (1000 tons)],
[FINGER MILLET PRODUCTION (1000 tons)],
[BARLEY PRODUCTION (1000 tons)],
[CHICKPEA PRODUCTION (1000 tons)],
[PIGEONPEA PRODUCTION (1000 tons)],
[MINOR PULSES PRODUCTION (1000 tons)],
[GROUNDNUT PRODUCTION (1000 tons)],
[SESAMUM PRODUCTION (1000 tons)],
[RAPESEED AND MUSTARD PRODUCTION (1000 tons)],
[SAFFLOWER PRODUCTION (1000 tons)],
[CASTOR PRODUCTION (1000 tons)],
[LINSEED PRODUCTION (1000 tons)],
[SUNFLOWER PRODUCTION (1000 tons)],
[SOYABEAN PRODUCTION (1000 tons)],
[SUGARCANE PRODUCTION (1000 tons)],
[OILSEEDS PRODUCTION (1000 tons)],
[COTTON PRODUCTION (1000 tons)],
([RICE PRODUCTION (1000 tons)]+[WHEAT PRODUCTION (1000 tons)]+[KHARIF SORGHUM PRODUCTION (1000 tons)]+[RABI SORGHUM PRODUCTION (1000 tons)]+
[SORGHUM PRODUCTION (1000 tons)]+[PEARL MILLET PRODUCTION (1000 tons)]+[MAIZE PRODUCTION (1000 tons)]+[FINGER MILLET PRODUCTION (1000 tons)]+
[BARLEY PRODUCTION (1000 tons)]+[CHICKPEA PRODUCTION (1000 tons)]+[PIGEONPEA PRODUCTION (1000 tons)]+[MINOR PULSES PRODUCTION (1000 tons)]+
[GROUNDNUT PRODUCTION (1000 tons)]+[SESAMUM PRODUCTION (1000 tons)]+[RAPESEED AND MUSTARD PRODUCTION (1000 tons)]+[SAFFLOWER PRODUCTION (1000 tons)]+
[CASTOR PRODUCTION (1000 tons)]+[LINSEED PRODUCTION (1000 tons)]+[SUNFLOWER PRODUCTION (1000 tons)]+[SOYABEAN PRODUCTION (1000 tons)]+
[SUGARCANE PRODUCTION (1000 tons)]+[OILSEEDS PRODUCTION (1000 tons)]+[COTTON PRODUCTION (1000 tons)])
from crop_analysis;
```
```SQL
Select * from Crop_Production;
```
### BASED ON YIELD
```SQL
Create Table Crop_Yield(
[Year] int, 
[State Name] varchar(100),
[Dist Name] varchar(100),
[Rice]float, 
[Wheat]float, 
[Kharif_Sorghum]float, 
[Rabi_Sorghum]float, 
[Sorghum]float,
[Pearl_Millet] float, 
[Maize]float, 
[Finger_Millet]float,
[Barley] float,
[Chickpea] float, 
[Pigeonpea] float, 
[Minor_Pulses] float,
[Groundnut]float,
[Sesamum]float, 
[Rapeseed_Mustard] float,
[Safflower]float, 
[Castor]float, 
[Linseed]float, 
[Sunflower]float, 
[Soyabean]float,
[Sugarcane]float, 
[Oilseeds]float, 
[Cotton]float,
[Total Yield (kg per ha)] float
);
```
```SQL
Insert into Crop_Yield(
[Year] ,  
[State Name],
[Dist Name] ,
[Rice], 
[Wheat], 
[Kharif_Sorghum], 
[Rabi_Sorghum], 
[Sorghum],
[Pearl_Millet], 
[Maize], 
[Finger_Millet],
[Barley] ,
[Chickpea] , 
[Pigeonpea] , 
[Minor_Pulses],
[Groundnut],
[Sesamum], 
[Rapeseed_Mustard] ,
[Safflower], 
[Castor], 
[Linseed], 
[Sunflower], 
[Soyabean],
[Sugarcane], 
[Oilseeds], 
[Cotton],
[Total Yield (kg per ha)])

Select
[Year],
[State Name] ,
[Dist Name],
[RICE YIELD (Kg per ha)],
[WHEAT YIELD (Kg per ha)] ,
[KHARIF SORGHUM YIELD (Kg per ha)],
[RABI SORGHUM YIELD (Kg per ha)],
[SORGHUM YIELD (Kg per ha)],
[PEARL MILLET YIELD (Kg per ha)],
[MAIZE YIELD (Kg per ha)],
[FINGER MILLET YIELD (Kg per ha)],
[BARLEY YIELD (Kg per ha)],
[CHICKPEA YIELD (Kg per ha)],
[PIGEONPEA YIELD (Kg per ha)],
[MINOR PULSES YIELD (Kg per ha)],
[GROUNDNUT YIELD (Kg per ha)],
[SESAMUM YIELD (Kg per ha)],
[RAPESEED AND MUSTARD YIELD (Kg per ha)],
[SAFFLOWER YIELD (Kg per ha)],
[CASTOR YIELD (Kg per ha)],
[LINSEED YIELD (Kg per ha)],
[SUNFLOWER YIELD (Kg per ha)],
[SOYABEAN YIELD (Kg per ha)],
[SUGARCANE YIELD (Kg per ha)],
[OILSEEDS YIELD (Kg per ha)],
[COTTON YIELD (Kg per ha)],
([RICE YIELD (Kg per ha)]+[WHEAT YIELD (Kg per ha)]+[KHARIF SORGHUM YIELD (Kg per ha)]+[RABI SORGHUM YIELD (Kg per ha)]+[SORGHUM YIELD (Kg per ha)]+
[PEARL MILLET YIELD (Kg per ha)]+[MAIZE YIELD (Kg per ha)]+[FINGER MILLET YIELD (Kg per ha)]+[BARLEY YIELD (Kg per ha)]+[CHICKPEA YIELD (Kg per ha)]+
[PIGEONPEA YIELD (Kg per ha)]+[MINOR PULSES YIELD (Kg per ha)]+[GROUNDNUT YIELD (Kg per ha)]+[SESAMUM YIELD (Kg per ha)]+[RAPESEED AND MUSTARD YIELD (Kg per ha)]+
[SAFFLOWER YIELD (Kg per ha)]+[CASTOR YIELD (Kg per ha)]+[LINSEED YIELD (Kg per ha)]+[SUNFLOWER YIELD (Kg per ha)]+[SOYABEAN YIELD (Kg per ha)]+
[SUGARCANE YIELD (Kg per ha)]+[OILSEEDS YIELD (Kg per ha)]+[COTTON YIELD (Kg per ha)])
from crop_analysis;
```
```SQL
Select * from Crop_Yield;
```

### Creating a new table on : Year Wise Area, Production & Yield Data for different States

### BASED ON AREA
```SQL
Create Table Area_By_Year(
Year int,
[Rice]float, 
[Wheat]float, 
[Kharif_Sorghum]float, 
[Rabi_Sorghum]float, 
[Sorghum]float,
[Pearl_Millet] float, 
[Maize]float, 
[Finger_Millet]float,
[Barley] float,
[Chickpea] float, 
[Pigeonpea] float, 
[Minor_Pulses] float,
[Groundnut]float,
[Sesamum]float, 
[Rapeseed_Mustard] float,
[Safflower]float, 
[Castor]float, 
[Linseed]float, 
[Sunflower]float, 
[Soyabean]float,
[Sugarcane]float,  
[Cotton]float
);
```
```SQL
Insert into Area_By_Year( 
Year, 
[Rice], 
[Wheat], 
[Kharif_Sorghum], 
[Rabi_Sorghum], 
[Sorghum],
[Pearl_Millet], 
[Maize], 
[Finger_Millet],
[Barley] ,
[Chickpea] , 
[Pigeonpea] , 
[Minor_Pulses],
[Groundnut],
[Sesamum], 
[Rapeseed_Mustard] ,
[Safflower], 
[Castor], 
[Linseed], 
[Sunflower], 
[Soyabean],
[Sugarcane], 
[Cotton])

Select Year,sum(rice) , sum(Wheat) , Sum(Kharif_Sorghum) ,sum(Rabi_Sorghum) ,sum(Sorghum),sum(Pearl_Millet) ,sum(Maize),
sum(Finger_Millet) ,sum(Barley) ,sum(Chickpea) ,sum(Pigeonpea) ,sum(Minor_Pulses),sum(Groundnut),sum(Sesamum),sum(Rapeseed_Mustard),
sum(Safflower),sum(Castor),sum(Linseed) ,sum(Sunflower) ,sum(Soyabean) ,sum(Sugarcane) ,sum(Cotton) 
from Crop_Area
group by Year
;
```
```SQL
Select * from Area_By_Year;
```
### BASED ON PRODUCTION
```SQL
Create Table Prod_By_Year(
Year int,
[Rice]float, 
[Wheat]float, 
[Kharif_Sorghum]float, 
[Rabi_Sorghum]float, 
[Sorghum]float,
[Pearl_Millet] float, 
[Maize]float, 
[Finger_Millet]float,
[Barley] float,
[Chickpea] float, 
[Pigeonpea] float, 
[Minor_Pulses] float,
[Groundnut]float,
[Sesamum]float, 
[Rapeseed_Mustard] float,
[Safflower]float, 
[Castor]float, 
[Linseed]float, 
[Sunflower]float, 
[Soyabean]float,
[Sugarcane]float,  
[Cotton]float
);
```
```SQL
Insert into Prod_By_Year( 
Year,
[Rice], 
[Wheat], 
[Kharif_Sorghum], 
[Rabi_Sorghum], 
[Sorghum],
[Pearl_Millet], 
[Maize], 
[Finger_Millet],
[Barley] ,
[Chickpea] , 
[Pigeonpea] , 
[Minor_Pulses],
[Groundnut],
[Sesamum], 
[Rapeseed_Mustard] ,
[Safflower], 
[Castor], 
[Linseed], 
[Sunflower], 
[Soyabean],
[Sugarcane], 
[Cotton])

Select Distinct(Year),sum(rice), sum(Wheat), Sum(Kharif_Sorghum) ,
sum(Rabi_Sorghum),sum(Sorghum),sum(Pearl_Millet),sum(Maize),sum(Finger_Millet) ,sum(Barley) ,sum(Chickpea),sum(Pigeonpea) ,
sum(Minor_Pulses),sum(Groundnut) ,sum(Sesamum) ,sum(Rapeseed_Mustard) ,sum(Safflower) ,sum(Castor),sum(Linseed),sum(Sunflower),sum(Soyabean) ,
sum(Sugarcane) ,sum(Cotton)
from Crop_Production
group by Year
;
```
```SQL
Select * from Prod_By_Year;
```

### BASED ON YIELD
```SQL
Create Table Yield_By_Year(
Year int,
[Rice]float, 
[Wheat]float, 
[Kharif_Sorghum]float, 
[Rabi_Sorghum]float, 
[Sorghum]float,
[Pearl_Millet] float, 
[Maize]float, 
[Finger_Millet]float,
[Barley] float,
[Chickpea] float, 
[Pigeonpea] float, 
[Minor_Pulses] float,
[Groundnut]float,
[Sesamum]float, 
[Rapeseed_Mustard] float,
[Safflower]float, 
[Castor]float, 
[Linseed]float, 
[Sunflower]float, 
[Soyabean]float,
[Sugarcane]float,  
[Cotton]float,
);
```
```SQL
Insert into Yield_By_Year( 
Year, 
[Rice], 
[Wheat], 
[Kharif_Sorghum], 
[Rabi_Sorghum], 
[Sorghum],
[Pearl_Millet], 
[Maize], 
[Finger_Millet],
[Barley] ,
[Chickpea] , 
[Pigeonpea] , 
[Minor_Pulses],
[Groundnut],
[Sesamum], 
[Rapeseed_Mustard] ,
[Safflower], 
[Castor], 
[Linseed], 
[Sunflower], 
[Soyabean],
[Sugarcane], 
[Cotton])

Select Distinct(Year),sum(rice) , sum(Wheat) , Sum(Kharif_Sorghum) ,sum(Rabi_Sorghum) ,sum(Sorghum),sum(Pearl_Millet) ,sum(Maize),
sum(Finger_Millet) ,sum(Barley) ,sum(Chickpea) ,sum(Pigeonpea) ,sum(Minor_Pulses),sum(Groundnut),sum(Sesamum),sum(Rapeseed_Mustard),
sum(Safflower),sum(Castor),sum(Linseed) ,sum(Sunflower) ,sum(Soyabean) ,sum(Sugarcane) ,sum(Cotton)
from Crop_Yield
group by Year
;
```
```SQL
Select * from Yield_By_Year;
```

### Creating tables with State Wise & District Wisw Data.

### STATE WISE
```SQL
Create Table State_Wise_Analysis(
[State Name] varchar(100),
[Total Area (1000 ha)] float,
[Total Production (1000 tons)] float,
[Total Yield (kg per ha)] float
);
```
```SQL
Insert into State_Wise_Analysis(
[State Name],
[Total Area (1000 ha)],
[Total Production (1000 tons)],
[Total Yield (kg per ha)])

Select Distinct[State Name],Sum([RICE AREA (1000 ha)]+[WHEAT AREA (1000 ha)]+[KHARIF SORGHUM AREA (1000 ha)]+[RABI SORGHUM AREA (1000 ha)]+[SORGHUM AREA (1000 ha)]+
[PEARL MILLET AREA (1000 ha)]+[MAIZE AREA (1000 ha)]+[FINGER MILLET AREA (1000 ha)]+[BARLEY AREA (1000 ha)]+[CHICKPEA AREA (1000 ha)]+
[PIGEONPEA AREA (1000 ha)]+[MINOR PULSES AREA (1000 ha)]+[GROUNDNUT AREA (1000 ha)]+[SESAMUM AREA (1000 ha)]+[RAPESEED AND MUSTARD AREA (1000 ha)]+
[SAFFLOWER AREA (1000 ha)]+[CASTOR AREA (1000 ha)]+[LINSEED AREA (1000 ha)]+[SUNFLOWER AREA (1000 ha)]+[SOYABEAN AREA (1000 ha)]+[SUGARCANE AREA (1000 ha)]+
[OILSEEDS AREA (1000 ha)]+[COTTON AREA (1000 ha)]) as Total_Area,Sum([RICE PRODUCTION (1000 tons)]+[WHEAT PRODUCTION (1000 tons)]+[KHARIF SORGHUM PRODUCTION (1000 tons)]+[RABI SORGHUM PRODUCTION (1000 tons)]+
[SORGHUM PRODUCTION (1000 tons)]+[PEARL MILLET PRODUCTION (1000 tons)]+[MAIZE PRODUCTION (1000 tons)]+[FINGER MILLET PRODUCTION (1000 tons)]+
[BARLEY PRODUCTION (1000 tons)]+[CHICKPEA PRODUCTION (1000 tons)]+[PIGEONPEA PRODUCTION (1000 tons)]+[MINOR PULSES PRODUCTION (1000 tons)]+
[GROUNDNUT PRODUCTION (1000 tons)]+[SESAMUM PRODUCTION (1000 tons)]+[RAPESEED AND MUSTARD PRODUCTION (1000 tons)]+[SAFFLOWER PRODUCTION (1000 tons)]+
[CASTOR PRODUCTION (1000 tons)]+[LINSEED PRODUCTION (1000 tons)]+[SUNFLOWER PRODUCTION (1000 tons)]+[SOYABEAN PRODUCTION (1000 tons)]+
[SUGARCANE PRODUCTION (1000 tons)]+[OILSEEDS PRODUCTION (1000 tons)]+[COTTON PRODUCTION (1000 tons)]) as Total_Production, Sum([RICE YIELD (Kg per ha)]+[WHEAT YIELD (Kg per ha)]+[KHARIF SORGHUM YIELD (Kg per ha)]+[RABI SORGHUM YIELD (Kg per ha)]+[SORGHUM YIELD (Kg per ha)]+
[PEARL MILLET YIELD (Kg per ha)]+[MAIZE YIELD (Kg per ha)]+[FINGER MILLET YIELD (Kg per ha)]+[BARLEY YIELD (Kg per ha)]+[CHICKPEA YIELD (Kg per ha)]+
[PIGEONPEA YIELD (Kg per ha)]+[MINOR PULSES YIELD (Kg per ha)]+[GROUNDNUT YIELD (Kg per ha)]+[SESAMUM YIELD (Kg per ha)]+[RAPESEED AND MUSTARD YIELD (Kg per ha)]+
[SAFFLOWER YIELD (Kg per ha)]+[CASTOR YIELD (Kg per ha)]+[LINSEED YIELD (Kg per ha)]+[SUNFLOWER YIELD (Kg per ha)]+[SOYABEAN YIELD (Kg per ha)]+
[SUGARCANE YIELD (Kg per ha)]+[OILSEEDS YIELD (Kg per ha)]+[COTTON YIELD (Kg per ha)]) As Total_Yield
from crop_analysis
where [State Name]=[State Name]
group by [State Name]
order by Total_Area,Total_Production,Total_Yield DESC
;
```
```SQL
Select * from State_Wise_Analysis;
```
### DIST WISE
```SQL
Create Table Dist_Wise_Analysis(
[Dist Name] varchar(100),
[Total Area (1000 ha)] float,
[Total Production (1000 tons)] float,
[Total Yield (kg per ha)] float
);
```
```SQL
Insert into Dist_Wise_Analysis(
[Dist Name],
[Total Area (1000 ha)],
[Total Production (1000 tons)],
[Total Yield (kg per ha)])

Select Distinct[Dist Name],Sum([RICE AREA (1000 ha)]+[WHEAT AREA (1000 ha)]+[KHARIF SORGHUM AREA (1000 ha)]+[RABI SORGHUM AREA (1000 ha)]+[SORGHUM AREA (1000 ha)]+
[PEARL MILLET AREA (1000 ha)]+[MAIZE AREA (1000 ha)]+[FINGER MILLET AREA (1000 ha)]+[BARLEY AREA (1000 ha)]+[CHICKPEA AREA (1000 ha)]+
[PIGEONPEA AREA (1000 ha)]+[MINOR PULSES AREA (1000 ha)]+[GROUNDNUT AREA (1000 ha)]+[SESAMUM AREA (1000 ha)]+[RAPESEED AND MUSTARD AREA (1000 ha)]+
[SAFFLOWER AREA (1000 ha)]+[CASTOR AREA (1000 ha)]+[LINSEED AREA (1000 ha)]+[SUNFLOWER AREA (1000 ha)]+[SOYABEAN AREA (1000 ha)]+[SUGARCANE AREA (1000 ha)]+
[OILSEEDS AREA (1000 ha)]+[COTTON AREA (1000 ha)]) as Total_Area,Sum([RICE PRODUCTION (1000 tons)]+[WHEAT PRODUCTION (1000 tons)]+[KHARIF SORGHUM PRODUCTION (1000 tons)]+[RABI SORGHUM PRODUCTION (1000 tons)]+
[SORGHUM PRODUCTION (1000 tons)]+[PEARL MILLET PRODUCTION (1000 tons)]+[MAIZE PRODUCTION (1000 tons)]+[FINGER MILLET PRODUCTION (1000 tons)]+
[BARLEY PRODUCTION (1000 tons)]+[CHICKPEA PRODUCTION (1000 tons)]+[PIGEONPEA PRODUCTION (1000 tons)]+[MINOR PULSES PRODUCTION (1000 tons)]+
[GROUNDNUT PRODUCTION (1000 tons)]+[SESAMUM PRODUCTION (1000 tons)]+[RAPESEED AND MUSTARD PRODUCTION (1000 tons)]+[SAFFLOWER PRODUCTION (1000 tons)]+
[CASTOR PRODUCTION (1000 tons)]+[LINSEED PRODUCTION (1000 tons)]+[SUNFLOWER PRODUCTION (1000 tons)]+[SOYABEAN PRODUCTION (1000 tons)]+
[SUGARCANE PRODUCTION (1000 tons)]+[OILSEEDS PRODUCTION (1000 tons)]+[COTTON PRODUCTION (1000 tons)]) as Total_Production, Sum([RICE YIELD (Kg per ha)]+[WHEAT YIELD (Kg per ha)]+[KHARIF SORGHUM YIELD (Kg per ha)]+[RABI SORGHUM YIELD (Kg per ha)]+[SORGHUM YIELD (Kg per ha)]+
[PEARL MILLET YIELD (Kg per ha)]+[MAIZE YIELD (Kg per ha)]+[FINGER MILLET YIELD (Kg per ha)]+[BARLEY YIELD (Kg per ha)]+[CHICKPEA YIELD (Kg per ha)]+
[PIGEONPEA YIELD (Kg per ha)]+[MINOR PULSES YIELD (Kg per ha)]+[GROUNDNUT YIELD (Kg per ha)]+[SESAMUM YIELD (Kg per ha)]+[RAPESEED AND MUSTARD YIELD (Kg per ha)]+
[SAFFLOWER YIELD (Kg per ha)]+[CASTOR YIELD (Kg per ha)]+[LINSEED YIELD (Kg per ha)]+[SUNFLOWER YIELD (Kg per ha)]+[SOYABEAN YIELD (Kg per ha)]+
[SUGARCANE YIELD (Kg per ha)]+[OILSEEDS YIELD (Kg per ha)]+[COTTON YIELD (Kg per ha)]) As Total_Yield
from crop_analysis
where [Dist Name]=[Dist Name]
group by [Dist Name]
order by Total_Area,Total_Production,Total_Yield DESC
;
```
```SQL
Select * from Dist_Wise_Analysis;
```

### This is State wise table for different crops

### BASED ON AREA
```SQl
Create Table crop_analysis_by_area(
[State name] varchar(200),
Rice float,Wheat float,Kharif_Sorghum float, Rabi_Sorghum float, Sorghum float, Pearl_Millet float,
Maize float, Finger_Millet float, Barley float, Chickpea float, Pigeonpea float, Minor_Pulses float,
Groundnut float, Sesamum float, Rapeseed_Mustard float, Safflower float, Castor Float, Linseed float,
Sunflower Float, Soyabean float, Sugarcane float,Oilseeds float, Cotton float);
```
```SQL
Insert Into crop_analysis_by_area(
[State name] ,
Rice ,Wheat ,Kharif_Sorghum , Rabi_Sorghum , Sorghum , Pearl_Millet ,
Maize , Finger_Millet , Barley , Chickpea , Pigeonpea , Minor_Pulses ,
Groundnut , Sesamum , Rapeseed_Mustard , Safflower , Castor , Linseed ,
Sunflower, Soyabean, Sugarcane ,Oilseeds , Cotton )

Select [State name], sum([rice area (1000 ha)]) as Rice_area,sum([wheat area (1000 ha)]) as Wheat_area,
sum([Kharif Sorghum Area (1000 ha)]) as Kharif_Sorghum_Area, sum([RABI SORGHUM AREA (1000 ha)]) as Rabi_Sorghum_Area, sum([SORGHUM AREA (1000 ha)]) as Sorghum_Area ,
Sum([Pearl Millet Area (1000 ha)]) As Pearl_Millet ,Sum([Maize Area (1000 ha)]) as Maize_Area , Sum([FINGER MILLET AREA (1000 ha)]) as Finger_Millet ,
SUm([Barley Area (1000 ha)]) as Barley_area ,SUm([Chickpea Area (1000 ha)]) as Chickpea_Area , Sum([Pigeonpea Area (1000 ha)]) As Pigeonpea_Area , Sum([Minor Pulses Area (1000 ha)]) As Minor_pulses_area ,
Sum([Groundnut Area (1000 ha)]) As Groundnut_Area , Sum([Sesamum Area (1000 ha)]) As Sesamum_area, sum([RAPESEED AND MUSTARD AREA (1000 ha)]) as Rapeseed_Mustard_Area , 
SUm([Safflower area (1000 ha)]) as Safflower_area , Sum([Castor Area (1000 ha)]) as Castor_Area , Sum([Linseed Area (1000 ha)]) ,
Sum([Sunflower Area (1000 ha)]), sum([Soyabean Area (1000 ha)])as Soyabean_Area, Sum([Sugarcane Area (1000 ha)]) as Sugarcane_area ,
Sum([Oilseeds Area (1000 ha)]) as Oilseed_Area , Sum([Cotton Area (1000 ha)]) as Cotton_Area
from crop_analysis
group by [state name]
order by rice_area desc;
```
```SQL
Select * from crop_analysis_by_area;
```

### BASED ON PRODUCTION
```SQL
Create Table crop_analysis_by_prod(
[State name] varchar(200),
Rice float,Wheat float,Kharif_Sorghum float, Rabi_Sorghum float, Sorghum float, Pearl_Millet float,
Maize float, Finger_Millet float, Barley float, Chickpea float, Pigeonpea float, Minor_Pulses float,
Groundnut float, Sesamum float, Rapeseed_Mustard float, Safflower float, Castor Float, Linseed float,
Sunflower Float, Soyabean float, Sugarcane float,Oilseeds float, Cotton float);
```
```SQL
Insert Into crop_analysis_by_prod(
[State name] ,
Rice ,Wheat ,Kharif_Sorghum , Rabi_Sorghum , Sorghum , Pearl_Millet ,
Maize , Finger_Millet , Barley , Chickpea , Pigeonpea , Minor_Pulses ,
Groundnut , Sesamum , Rapeseed_Mustard , Safflower , Castor , Linseed ,
Sunflower, Soyabean, Sugarcane ,Oilseeds , Cotton )

Select [State name], sum([RICE PRODUCTION (1000 tons)]) as Rice,sum([WHEAT PRODUCTION (1000 tons)]) as Wheat,
sum([KHARIF SORGHUM PRODUCTION (1000 tons)]) as Kharif_Sorghum, sum([RABI SORGHUM PRODUCTION (1000 tons)]) as Rabi_Sorghum, sum([SORGHUM PRODUCTION (1000 tons)]) as Sorghum,
Sum([PEARL MILLET PRODUCTION (1000 tons)]) As Pearl_Millet ,Sum([MAIZE PRODUCTION (1000 tons)]) as Maize , Sum([FINGER MILLET PRODUCTION (1000 tons)]) as Finger_Millet ,
SUm([BARLEY PRODUCTION (1000 tons)]) as Barley,SUm([CHICKPEA PRODUCTION (1000 tons)]) as Chickpea , Sum([PIGEONPEA PRODUCTION (1000 tons)]) As Pigeonpea, Sum([MINOR PULSES PRODUCTION (1000 tons)]) As Minor_pulses,
Sum([GROUNDNUT PRODUCTION (1000 tons)]) As Groundnut, Sum([SESAMUM PRODUCTION (1000 tons)]) As Sesamum, sum([RAPESEED AND MUSTARD PRODUCTION (1000 tons)]) as Rapeseed_Mustard , 
SUm([SAFFLOWER PRODUCTION (1000 tons)]) as Safflower, Sum([CASTOR PRODUCTION (1000 tons)]) as Castor , Sum([LINSEED PRODUCTION (1000 tons)]) AS Linseed,
Sum([SUNFLOWER PRODUCTION (1000 tons)]) as Sunflower, sum([SOYABEAN PRODUCTION (1000 tons)]) as Soyabean, Sum([SUGARCANE PRODUCTION (1000 tons)]) as Sugarcane,
Sum([OILSEEDS PRODUCTION (1000 tons)]) as Oilseed, Sum([COTTON PRODUCTION (1000 tons)]) as Cotton
from crop_analysis
group by [state name]
order by Rice ,Wheat ,Kharif_Sorghum , Rabi_Sorghum , Sorghum , Pearl_Millet ,
Maize , Finger_Millet , Barley , Chickpea , Pigeonpea , Minor_Pulses ,
Groundnut , Sesamum , Rapeseed_Mustard , Safflower , Castor , Linseed ,
Sunflower, Soyabean, Sugarcane ,Oilseed, Cotton ;
```
```SQL
Select * from crop_analysis_by_prod;
```
### BASED ON YIELD
```SQL
Create Table crop_analysis_by_yield(
[State name] varchar(200),
Rice float,Wheat float,Kharif_Sorghum float, Rabi_Sorghum float, Sorghum float, Pearl_Millet float,
Maize float, Finger_Millet float, Barley float, Chickpea float, Pigeonpea float, Minor_Pulses float,
Groundnut float, Sesamum float, Rapeseed_Mustard float, Safflower float, Castor Float, Linseed float,
Sunflower Float, Soyabean float, Sugarcane float,Oilseeds float, Cotton float);
```
```SQL
Insert Into crop_analysis_by_yield(
[State name] ,
Rice ,Wheat ,Kharif_Sorghum , Rabi_Sorghum , Sorghum , Pearl_Millet ,
Maize , Finger_Millet , Barley , Chickpea , Pigeonpea , Minor_Pulses ,
Groundnut , Sesamum , Rapeseed_Mustard , Safflower , Castor , Linseed ,
Sunflower, Soyabean, Sugarcane ,Oilseeds , Cotton )

Select [State name], sum([RICE YIELD (Kg per ha)]) as Rice,Sum([WHEAT YIELD (Kg per ha)]) as Wheat,
Sum([KHARIF SORGHUM YIELD (Kg per ha)]) as Kharif_Sorghum, Sum([RABI SORGHUM YIELD (Kg per ha)]) as Rabi_Sorghum, Sum([SORGHUM YIELD (Kg per ha)]) as Sorghum,
Sum([PEARL MILLET YIELD (Kg per ha)]) As Pearl_Millet ,Sum([MAIZE YIELD (Kg per ha)]) as Maize , Sum([FINGER MILLET YIELD (Kg per ha)]) as Finger_Millet ,
Sum([BARLEY YIELD (Kg per ha)]) as Barley,Sum([CHICKPEA YIELD (Kg per ha)]) as Chickpea , Sum([PIGEONPEA YIELD (Kg per ha)]) As Pigeonpea, Sum([MINOR PULSES YIELD (Kg per ha)]) As Minor_pulses,
Sum([GROUNDNUT YIELD (Kg per ha)]) As Groundnut, Sum([SESAMUM YIELD (Kg per ha)]) As Sesamum, Sum([RAPESEED AND MUSTARD YIELD (Kg per ha)]) as Rapeseed_Mustard , 
Sum([SAFFLOWER YIELD (Kg per ha)]) as Safflower, Sum([CASTOR YIELD (Kg per ha)]) as Castor , Sum([LINSEED YIELD (Kg per ha)]) AS Linseed,
Sum([SUNFLOWER YIELD (Kg per ha)]) as Sunflower, Sum([SOYABEAN YIELD (Kg per ha)]) as Soyabean, Sum([SUGARCANE YIELD (Kg per ha)]) as Sugarcane,
Sum([OILSEEDS YIELD (Kg per ha)]) as Oilseed, Sum([COTTON YIELD (Kg per ha)]) as Cotton
from crop_analysis
group by [state name]
order by Rice ,Wheat ,Kharif_Sorghum , Rabi_Sorghum , Sorghum , Pearl_Millet ,
Maize , Finger_Millet , Barley , Chickpea , Pigeonpea , Minor_Pulses ,
Groundnut , Sesamum , Rapeseed_Mustard , Safflower , Castor , Linseed ,
Sunflower, Soyabean, Sugarcane ,Oilseed, Cotton ;
```
```SQL
Select * from crop_analysis_by_yield;
```

### Lastly, I have created one more table based on Year for different crops
```SQL
Create Table Year_Wise_Analysis(
Year int,
[Total Area (1000 ha)] float,
[Total Production (1000 tons)] float,
[Total Yield (kg per ha)] float
);
```
```SQL
Insert Into Year_Wise_Analysis(
Year,
[Total Area (1000 ha)],
[Total Production (1000 tons)],
[Total Yield (kg per ha)])

Select Distinct(Year),Sum([RICE AREA (1000 ha)]+[WHEAT AREA (1000 ha)]+[KHARIF SORGHUM AREA (1000 ha)]+[RABI SORGHUM AREA (1000 ha)]+[SORGHUM AREA (1000 ha)]+
[PEARL MILLET AREA (1000 ha)]+[MAIZE AREA (1000 ha)]+[FINGER MILLET AREA (1000 ha)]+[BARLEY AREA (1000 ha)]+[CHICKPEA AREA (1000 ha)]+
[PIGEONPEA AREA (1000 ha)]+[MINOR PULSES AREA (1000 ha)]+[GROUNDNUT AREA (1000 ha)]+[SESAMUM AREA (1000 ha)]+[RAPESEED AND MUSTARD AREA (1000 ha)]+
[SAFFLOWER AREA (1000 ha)]+[CASTOR AREA (1000 ha)]+[LINSEED AREA (1000 ha)]+[SUNFLOWER AREA (1000 ha)]+[SOYABEAN AREA (1000 ha)]+[SUGARCANE AREA (1000 ha)]+
[OILSEEDS AREA (1000 ha)]+[COTTON AREA (1000 ha)]) as Total_Area,Sum([RICE PRODUCTION (1000 tons)]+[WHEAT PRODUCTION (1000 tons)]+[KHARIF SORGHUM PRODUCTION (1000 tons)]+[RABI SORGHUM PRODUCTION (1000 tons)]+
[SORGHUM PRODUCTION (1000 tons)]+[PEARL MILLET PRODUCTION (1000 tons)]+[MAIZE PRODUCTION (1000 tons)]+[FINGER MILLET PRODUCTION (1000 tons)]+
[BARLEY PRODUCTION (1000 tons)]+[CHICKPEA PRODUCTION (1000 tons)]+[PIGEONPEA PRODUCTION (1000 tons)]+[MINOR PULSES PRODUCTION (1000 tons)]+
[GROUNDNUT PRODUCTION (1000 tons)]+[SESAMUM PRODUCTION (1000 tons)]+[RAPESEED AND MUSTARD PRODUCTION (1000 tons)]+[SAFFLOWER PRODUCTION (1000 tons)]+
[CASTOR PRODUCTION (1000 tons)]+[LINSEED PRODUCTION (1000 tons)]+[SUNFLOWER PRODUCTION (1000 tons)]+[SOYABEAN PRODUCTION (1000 tons)]+
[SUGARCANE PRODUCTION (1000 tons)]+[OILSEEDS PRODUCTION (1000 tons)]+[COTTON PRODUCTION (1000 tons)]) as Total_Production, Sum([RICE YIELD (Kg per ha)]+[WHEAT YIELD (Kg per ha)]+[KHARIF SORGHUM YIELD (Kg per ha)]+[RABI SORGHUM YIELD (Kg per ha)]+[SORGHUM YIELD (Kg per ha)]+
[PEARL MILLET YIELD (Kg per ha)]+[MAIZE YIELD (Kg per ha)]+[FINGER MILLET YIELD (Kg per ha)]+[BARLEY YIELD (Kg per ha)]+[CHICKPEA YIELD (Kg per ha)]+
[PIGEONPEA YIELD (Kg per ha)]+[MINOR PULSES YIELD (Kg per ha)]+[GROUNDNUT YIELD (Kg per ha)]+[SESAMUM YIELD (Kg per ha)]+[RAPESEED AND MUSTARD YIELD (Kg per ha)]+
[SAFFLOWER YIELD (Kg per ha)]+[CASTOR YIELD (Kg per ha)]+[LINSEED YIELD (Kg per ha)]+[SUNFLOWER YIELD (Kg per ha)]+[SOYABEAN YIELD (Kg per ha)]+
[SUGARCANE YIELD (Kg per ha)]+[OILSEEDS YIELD (Kg per ha)]+[COTTON YIELD (Kg per ha)]) As Total_Yield
from crop_analysis
where [Year] = [Year]
group by [Year]
order by Total_Area,Total_Production,Total_Yield
;
```
```SQL
Select * from Year_Wise_Analysis;
```

## After modifying the data and splitting the data into multiple tables, I have created an **Excel** file and I have used the same file for Data Visualization.
