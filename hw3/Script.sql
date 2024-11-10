/*
 * Ibodullo Kudratov
 * homework 4
 */

--> wooow работает 

select 
	name
	, genre_id 
from track ;



select 
	name as song
	, unit_price as price 
	, composer as author
from track ;

select 
	name as song
	, milliseconds / 60000 as duration_in_minutes -- не знал вещественный надо было или нет, можно поставит "." в после 60000
from track
order by milliseconds desc;


select 
	name as song
	, genre_id 
from track
limit 15;


select *
from track
offset 49;



select 
	name 
from track
where bytes / 100000 > 100;



select 
	name 
	, composer 
	--, track_id == проверка
from track
where composer != 'U2'
offset 9
limit 11;




SELECT 
    min(invoice_date) as first,
    max(invoice_date) as last
from invoice;

   


select 
    avg(total) AS mean
from invoice;

select 
	billing_city 
from invoice
group by billing_city 
having count(billing_city) > 1  ;

   














