-- задача 1
select 'Курьянович' as surname, 
	'Диана' as name,
	'Эдуардовна' as patronymic,
	'2002-08-23'::date as birthday;

-- задача 2
select 
	to_char(current_timestamp, 'DD month YYYY') today,
	to_char(current_timestamp, 'Day') day_of_week,
	case
		when extract(day from current_timestamp) % 2 = 0 then 'Четное'
		else 'Нечетное'
	end day_parity;

-- задача 3
select name, class, launched, length(name) as length
from ships
where length(name) > 5
	and length(name)< 10
	and launched < 1917
	and name not like '% %';
	
-- задача 4
select round(avg(2025-launched), 2)
from ships;

-- задача 5
select name, launched,
case 
	when launched >= 1919 then 'NEW'
	else 'OLD'
end
from ships
order by name asc;

-- задача 6
select battle, ship, result
from outcomes
where battle = 'Guadalcanal'
	and result not like 'sunk';

-- задача 7
select avg(actual_duration) as avg_duration_of_long_flight, 
	avg(extract(epoch from actual_duration)/60) as avg_duration_of_long_flight_min
from flights_v
where actual_duration > '02:00:00';

-- задача 8
select flight_no, departure_airport_name, arrival_airport_name, 
		scheduled_duration, actual_duration
from flights_v
where actual_duration is not null
order by actual_duration desc
limit 4;

-- второй вариант с coalesce:
select flight_no, departure_airport_name, arrival_airport_name, 
		scheduled_duration, actual_duration
from flights_v
order by coalesce(actual_duration, '00:00:00') desc
limit 4;

-- задача 9. Вариант с разметкой
select *
from flights
where status = 'Departed'
order by flight_id asc;

-- второй вариант с логикой
select *
from flights
where actual_departure is not null
		and actual_arrival is null
order by flight_id asc;

-- задача 10.
select distinct passenger_name
from tickets t
inner join ticket_flights n on t.ticket_no = n.ticket_no
where fare_conditions = 'Comfort'
order by passenger_name asc;