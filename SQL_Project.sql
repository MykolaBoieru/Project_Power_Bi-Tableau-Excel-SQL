SELECT * FROM road_accident

-- 1
SELECT SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE YEAR(accident_date) = '2022'

-- 2
SELECT SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE YEAR(accident_date) = '2022' AND road_surface_conditions = 'Dry'

-- 3
SELECT COUNT(DISTINCT accident_index) AS CY_Accidents
FROM road_accident
WHERE YEAR(accident_date) = '2022'

-- 4
SELECT SUM(number_of_casualties) AS CY_Fatal_Casualties
FROM road_accident
WHERE accident_severity = 'Fatal'

-- 5
SELECT SUM(number_of_casualties) AS CY_Fatal_Casualties
FROM road_accident
WHERE YEAR(accident_date) = '2022' AND accident_severity = 'Fatal'

-- 6
SELECT SUM(number_of_casualties) AS CY_Serious_Casualties
FROM road_accident
WHERE accident_severity = 'Serious'

-- 7
SELECT SUM(number_of_casualties) AS CY_Serious_Casualties
FROM road_accident
WHERE YEAR(accident_date) = '2022' AND accident_severity = 'Serious'

-- 8
SELECT SUM(number_of_casualties) AS CY_Slight_Casualties
FROM road_accident
WHERE accident_severity = 'Slight'

-- 9
SELECT SUM(number_of_casualties) AS CY_Slight_Casualties
FROM road_accident
WHERE YEAR(accident_date) = '2022' AND accident_severity = 'Slight'

-- 10
SELECT CAST (SUM(number_of_casualties) AS DECIMAL(10,2)) * 100 / 
(SELECT CAST (SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident)
FROM road_accident
WHERE accident_severity = 'Slight'

-- 11
SELECT CAST (SUM(number_of_casualties) AS DECIMAL(10,2)) * 100 / 
(SELECT CAST (SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident)
FROM road_accident
WHERE accident_severity = 'Serious'

-- 12
SELECT CAST (SUM(number_of_casualties) AS DECIMAL(10,2)) * 100 / 
(SELECT CAST (SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident)
FROM road_accident
WHERE accident_severity = 'Fatal'

-- 13 for 2022 only
SELECT
    CASE
	    WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
		WHEN vehicle_type IN ('Car', 'Taxi/Private hire car') THEN 'Cars'
		WHEN vehicle_type IN ('Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motocycle over 125cc nd up to 500cc', 'Motocycle over 500cc', 'Pedal cycle') THEN 'Bike'
		WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passengers seats)') THEN 'Bus'
		WHEN vehicle_type IN ('Goods over 3.5t. and under 7.5t','Goods 7.5 tonnes mgw and over', 'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
		ELSE 'Other'
	END AS vehicle_group, 
	SUM(number_of_casualties) as CY_Casualties
FROM road_accident
WHERE YEAR(accident_date) = '2022'
GROUP BY 
    CASE
	    WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
		WHEN vehicle_type IN ('Car', 'Taxi/Private hire car') THEN 'Cars'
		WHEN vehicle_type IN ('Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motocycle over 125cc nd up to 500cc', 'Motocycle over 500cc', 'Pedal cycle') THEN 'Bike'
		WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passengers seats)') THEN 'Bus'
		WHEN vehicle_type IN ('Goods over 3.5t. and under 7.5t','Goods 7.5 tonnes mgw and over', 'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
		ELSE 'Other'
	END

--14
SELECT
    CASE
	    WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
		WHEN vehicle_type IN ('Car', 'Taxi/Private hire car') THEN 'Cars'
		WHEN vehicle_type IN ('Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motocycle over 125cc nd up to 500cc', 'Motocycle over 500cc', 'Pedal cycle') THEN 'Bike'
		WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passengers seats)') THEN 'Bus'
		WHEN vehicle_type IN ('Goods over 3.5t. and under 7.5t','Goods 7.5 tonnes mgw and over', 'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
		ELSE 'Other'
	END AS vehicle_group, 
	SUM(number_of_casualties) as CY_Casualties
FROM road_accident
GROUP BY 
    CASE
	    WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
		WHEN vehicle_type IN ('Car', 'Taxi/Private hire car') THEN 'Cars'
		WHEN vehicle_type IN ('Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motocycle over 125cc nd up to 500cc', 'Motocycle over 500cc', 'Pedal cycle') THEN 'Bike'
		WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passengers seats)') THEN 'Bus'
		WHEN vehicle_type IN ('Goods over 3.5t. and under 7.5t','Goods 7.5 tonnes mgw and over', 'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
		ELSE 'Other'
	END

-- 15
SELECT DATENAME(MONTH, accident_date) AS Month_Name, SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE YEAR(accident_date) = '2022'
GROUP BY DATENAME(MONTH, accident_date)


-- 16
SELECT DATENAME(MONTH, accident_date) AS Month_Name, SUM(number_of_casualties) AS PY_Casualties
FROM road_accident
WHERE YEAR(accident_date) = '2021'
GROUP BY DATENAME(MONTH, accident_date)


-- 17
SELECT DATENAME(MONTH, accident_date) AS Month_Name, SUM(number_of_casualties) AS PY_Casualties
FROM road_accident
WHERE YEAR(accident_date) = '2021' AND road_surface_conditions = 'Dry'
GROUP BY DATENAME(MONTH, accident_date)


-- 18
SELECT road_type, SUM(number_of_casualties) AS CY_Casualties FROM road_accident
WHERE YEAR(accident_date) = '2022'
GROUP BY road_type

-- 19
SELECT urban_or_rural_area, SUM(number_of_casualties) FROM road_accident
WHERE YEAR(accident_date) = '2022'
GROUP BY urban_or_rural_area

-- 20
SELECT urban_or_rural_area, CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) * 100 /
(SELECT CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident WHERE YEAR(accident_date) = '2022') 
AS Percentage_of_Total
FROM road_accident
WHERE YEAR(accident_date) = '2022'
GROUP BY urban_or_rural_area


-- 21
SELECT urban_or_rural_area, SUM(number_of_casualties) AS Total_Casualties, CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) * 100 /
(SELECT CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident WHERE YEAR(accident_date) = '2022') 
AS Percentage_of_Total
FROM road_accident
WHERE YEAR(accident_date) = '2022'
GROUP BY urban_or_rural_area

-- 22
SELECT
    CASE 
	    WHEN light_conditions IN ('Daylight') THEN 'Day'
		WHEN light_conditions IN ('Darkness - lighting unknown', 'Darkness - lights lit', 
		'Darkness - lights unlit', 'Darkness - no lighting') THEN 'Night'
	END AS Light_Condition,
	CAST(CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) * 100 / 
	(SELECT CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident WHERE YEAR(accident_date) = '2022') AS DECIMAL(10,2))
	AS CY_Casualties_Percentage
FROM road_accident
WHERE YEAR(accident_date) = '2022'
GROUP BY
	CASE
	    WHEN light_conditions IN ('Daylight') THEN 'Day'
		WHEN light_conditions IN ('Darkness - lighting unknown', 'Darkness - lights lit', 
		'Darkness - lights unlit', 'Darkness - no lighting') THEN 'Night'
	END


-- 23
SELECT TOP 10 local_authority, SUM(number_of_casualties) AS Total_casualties
FROM road_accident
GROUP BY local_authority 
ORDER BY Total_casualties DESC