--#1 What's the most expensive listing? What else can you tell me about the listing?

select
	name,
	min_nights,
	availibility,
	number_of_reviews,
	price
from
	listings
order by price desc
limit 1

-- #2 What neighborhoods seem to be the most popular?
select
	neigh,
	name,
	min_nights,
	availibility,
	number_of_reviews,
	reviews_per_month,
	price
from
	listings
order by reviews_per_month desc

-- #3  What about the busiest?
select
	l.id,
	l.name,
	l.availibility,
	l.min_nights,
	l.room_type,
	l.price,
	l.number_of_reviews,
	r.date,
	count(r.date) count

from 
	listings l
join reviews r
on r.id = l.id
group by r.date
order by count desc

-- What time of year is the cheapest time to go to your city?
select
	l.id,
	l.name,
	l.availibility,
	l.min_nights,
	l.room_type,
	l.price,
	l.number_of_reviews,
	r.date,
	min(price) lowest_price

from 
	listings l
join reviews r
on r.id = l.id
group by r.date
order by lowest_price 
