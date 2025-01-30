select numguns
from classes

select *
from classes

select country, bore
from classes

select cl.country
from classes cl

select cl.type, cl.*
from classes cl

select random()

select 235+532

select random()

select cl.numguns, cl.bore
from classes as cl

select cl.numguns + cl.bore smthstrange
from classes as cl

select *
from classes

select gcd (12, 14) gcd

select lcm (12, 14) lcm

select sqrt(8) sqrt

select 
'Мама'||' мыла '|| 'раму' concat,
lower('ЗаБоРчИк1!') lwr,
upper('ЗаБоРчИк1!') upr,
position('бор' in 'ЗаБоРчИк1') pos1,
position('о' in 'ЗаБоРчИк1') pos2,
'*',
left('abcde', 2) lft,
replace ('Today is ReportDate', 'ReportDate',
'2023-01-14') repl;

select
to_date('14 Jan 2023', 'DD Mon YYYY') char2date,
to_char(current_timestamp, 'DD Mon YYYY
HH12:MI:SS') time2char,
to_number('12454,8', '99999D9') str2num,
to_char(-125.8, 'S999D99');

select *
from classes cl
limit 5

select *
from classes cl
where numguns <= 9

select
cl.*,
case
	when cl.numguns > 7 then 'BIG'
	when cl.numguns > 10 then 'MEDIUM'
	else 'SMALL'
end
from classes cl
/* комментарий*/

select
case
	when 10 > NULL then '10 > NULL'
	when 10 < NULL then '10 < NULL'
	when 10 = NULL then '10 = NULL'
	else 'WAT?'
end

select
coalesce(description, short_description, '(none)')
from classes cl

select
cl.*
from classes cl
where bore > 8

SELECT COALESCE (NULL, '1', 'Natalia');

select *
from outcomes

select ship
from outcomes
where result = 'sunk'

select *
from battles b
where b.name in ('North Atlantic', 'North Cape');

select *
from battles b
where b.name not in ('North Atlantic', 'North Cape');

select *
from ships
where launched > 1941

select *
from ships

select *
from battles b
where b.name in (select distinct battle from outcomes) -- подзапрос

select distinct battle
from outcomes