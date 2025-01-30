select *
from aircrafts_data

select *
from bookings

select aircraft_code, model, RANGE
from aircrafts a 
where a.aircraft_code = '321';

-- комментарий

select *
from bookings b
where (b.total_amount > 100000
	and b.book_date between to_date ('2017-07-01', 'YYYY-MM-DD') -- учитывает время
					and to_date ('2017-07-31', 'YYYY-MM-DD')
					or b.total_amount < 80000)

select distinct ship
from outcomes

select count(ship)
from outcomes;

select count(distinct ship)
from outcomes

-- водоизмещение в тыс
select displacement / 10^3 as dis
from classes cl

-- отношение орудий на водоизмещение
select numguns / displacement
from classes

-- вывести через _ класс и страну
select class ||'_'|| country
from classes

select class || country
from classes

-- количество уникальных стран в таблице
select count(distinct country)
from classes

-- список уникальных стран
select distinct country
from classes

-- заглавные буквы
select distinct upper(country)
from classes

-- водоизмещение (int) в другой тип данных
select cast(displacement as float)
from classes

select displacement::float
from classes

select displacement / 1^2 as dis
from classes

-- alias
select s.*, launched as year
from ships as s

-- order by
select *
from ships
order by launched desc, class

select *
from ships
order by 3;

-- LIMIT
select *
from battles
order by 1
limit 3;

select *
from battles
order by 1
limit 4
offset 2;

-- where (in, not in, between)
select *
from classes
where type = 'bc';

select *
from classes
where country like '%Britain';

select *
from classes
where country ilike '%britain'; -- ilike не обращает внимания на регистр

select *
from classes
where country in ('USA', 'Japan')
order by 3