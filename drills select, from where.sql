select
	trip_id,
	bike_id,
	duration
	
from
	trips
where 
	duration > 500

order By duration desc

-- #2
select
	*
from
	stations
where	
	station_id = 84

-- #3
select	
	MinTemperatureF
from 
	weather
where 
	zip = 94301