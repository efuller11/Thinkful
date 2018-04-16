-- #1 What are the three longest trips on rainy days?
with rainy as 
(SELECT 
date
From weather
WHERE events = 'Rain'
GROUP BY 1
)

SELECT
trip_id,
duration,
DATE(start_date) trip_date
FROM trips
JOIN rainy
on rainy.date = trip_date
ORDER BY duration DESC
LIMIT 3

-- #2 Which station is full most often?
SELECT
status.station_id,
stations.name,
COUNT(CASE WHEN docks_available=0 then 1 END) empty_count
FROM status
JOIN stations
on stations.station_id = status.station_id
GROUP BY 1
ORDER BY empty_count DESC

-- #3 Return a list of stations with a count of number of trips starting at that station but ordered by dock count.
select 
	start_terminal,
	dockcount,
	count(start_terminal) trip_amount
from	
	trips
join
	stations
on trips.start_terminal = stations.station_id
group by 1, 2

order by 2 desc

-- #4 (Challenge) What's the length of the longest trip for each day it rains anywhere?
with rainy as 
(SELECT 
date
From weather
WHERE events = 'Rain'
GROUP BY 1
),

rain_trips as (
SELECT
trip_id,
duration,
DATE(start_date) trip_date
FROM trips
JOIN rainy
on rainy.date = trip_date
ORDER BY duration DESC
)

SELECT 
trip_date,
max(duration)
from rain_trips
GROUP BY 1