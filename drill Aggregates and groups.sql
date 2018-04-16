-- #1
select
	maxtemperatureF,
	zip
from	
	weather
group by 1
order by maxtemperatureF desc

--#2
select
	start_station,
	count(*) station_count
from trips
group by 1
order by station_count desc

--#3
select
	duration
from 
	trips
order by duration

--#4

select
	end_station,
	avg(duration) duration_avg
from trips
group by 1
order by duration_avg desc
	