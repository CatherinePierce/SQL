-- лекция 3

select *
from battles
where battles.name in (select distinct battle from outcomes)

select *
from ships
where launched >= 1941 and launched <= 1945

-- Что вернет запрос ниже 

SELECT 'CA_tegoriztion' LIKE 'CA_t%ion' ESCAPE '#'
-- _ означает любую букву; like - оператор сравнения; escape - экранирование
-- (можно через \)

select *
from ships

select name, class, launched, length(name) as length
from ships
where length(name)> 5
	and length(name)<10
	and launched < 1917
	and name not like '% %';

select *
from ships

select round(avg(2025-launched), 2)
from ships

select 'Курьянович' as surname, 
	'Диана' as name,
	'Эдуардовна' as patronymic,
	'2002-08-23'::date as birthday;

select name, launched,
case 
	when launched >= 1919 then 'NEW'
	else 'OLD'
end
from ships
order by name asc;

select *
from outcomes

select battle, ship, result
from outcomes
where battle = 'Guadalcanal'
	and result not like 'sunk';

	select name, launched,
case 
	when launched >= 1919 then 'NEW'
	else 'OLD'
end
from ships
order by name asc;

