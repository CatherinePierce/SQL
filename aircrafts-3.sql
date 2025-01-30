-- 3 лекция

select *
from bookings b 
where b.total_amount > 100000
	and b.book_date between to_date ('2017-07-01', 'YYYY-MM-DD')
						and to_date ('2017-07-31', 'YYYY-MM-DD');

SELECT
	count (*) total_cnt,
	count(actual_duration) cnt_not_null,
	count (distinct actual_duration) cnt_dist,
	count ((extract(epoch from (actual_duration))/60)::int > 120)
from flights_v

SELECT
	COUNT(actual_duration) COUNT_actual_duration, 
	COUNT(*) "count_*", 
	SUM(actual_duration) SUM_actual_duration, 
	SUM(DISTINCT actual_duration) SUM_dist_actual_duration, 
	AVG(actual_duration) AVG_actual_duration, 
	1.0 * SUM(actual_duration) / COUNT(*) AVG_INCLUDING_NULL 
FROM flights_v;

select *
from flights
where departure_airport = 'VKO'
	and arrival_airport = 'LE'

select count(*) -- null будут считаться со *
-- лучше:
select count(flight_id) -- теперь null туда не попадут

select *
from flights
where departure_airport = 'VKO'
	and arrival_airport = 'LED'

-- плановое время отправления в формате даты
select scheduled_departure::date
from flights

-- все полеты 10 сен 2017 г
select *
from flights
where scheduled_departure::date = '2017-09-10'

select cast(scheduled_departure as date) -- каст переводит в другой тип данных
from flights

-- перелеты в какие годы содержит таблица flights
select distinct extract(year from scheduled_departure) -- extract достает часть типа данных
from flights

select distinct date_trunc('year', scheduled_departure)
from flights

-- все отмененные сентябрьские рейсы из Внуково
select *
from flights
where status = 'Cancelled'
	and departure_airport = 'VKO'
	and extract(month from scheduled_departure) = 9

-- все перелеты, которые не были задержаны (2 варианта запроса)
select distinct status
from flights

select *
from flights
where status <> 'Cancelled'

select *
from flights
where status <> 'Cancelled'

select *
from flights
where scheduled_departure = flights.actual_departure

-- схема bookings и view в ней
select * from bookings.flights_v;

select * from bookings.routes;

-- город отправления, прибытия и длительность полета. ранжируем по длительности полета
select departure_city, arrival_city, duration
from bookings.routes
where departure_city = 'Тюмень'
order by 3;

select * from bookings.airports; -- справочник для аэропортов

-- средняя стоимость бронирований
select avg(total_amount)
from bookings

-- средняя ст-сть бронирований в июле 2017 г
select avg(total_amount)
from bookings
where extract(year from book_date) = 2017
	and extract(month from book_date) = 7

-- округлите среднюю стоимость бронирований до 1 знака после запятой
select round(avg(total_amount), 0)
from bookings

-- макс и мин стоимости бронирований
select max(total_amount), min(total_amount)
from bookings

select total_amount
from bookings
order by 1 desc
limit 2;

-- средняя стоимость перелета в экономе
select round(avg(amount),0)
from ticket_flights
where fare_conditions = 'Economy'

-- like
select * from tickets;

-- все пассажиры, у кот в имени или фамилии есть буква А
select *
from tickets
where passenger_name like '%A%'

-- все пассажиры, у кого имя состоит из 4 букв, а фамилия из 5
select *
from tickets
where passenger_name like '____ _____'

-- у каждого пассажира есть имя и фамилия

select count(passenger_name)
from tickets;

select count(*) as c
from tickets;

-- => null нет

select *
from tickets
where passenger_name not like '% %';

select sum(case when passenger_name not like '% %' then 1 else 0 end)
from tickets;

-- union убирает все дубликаты выводов и выводит одно уникальное значение
select count(*) from tickets where passenger_name like '% %'
union all
select count(*) from tickets;

select *
from tickets as t
inner join ticket_flights as f on t.ticket_no = f.ticket_no;

select *
from ticket_flights

select avg(actual_duration) as avg_duration_of_long_flight, 
	avg(extract(epoch from actual_duration)/60) as avg_duration_of_long_flight_min
from flights_v
where actual_duration > '02:00:00';

select *
from flights_v

select flight_no, departure_airport_name, arrival_airport_name, 
		scheduled_duration, actual_duration
from flights_v
order by coalesce(actual_duration, '00:00:00') desc
limit 4;

select *
from flights_v 

select *
from flights
where status = 'Departed'
order by flight_id asc;

select *
from flights
where actual_departure is not null
		and actual_arrival is null
order by flight_id asc;

select *
from ticket_flights -- через ticket_no связать две таблички

select *
from tickets

select distinct passenger_name
from tickets t
inner join ticket_flights n on t.ticket_no = n.ticket_no
where fare_conditions = 'Comfort'
order by passenger_name asc;