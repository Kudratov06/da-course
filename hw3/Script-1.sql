select 
	phone 
from customer
where 
	phone not like '%(%'
	and phone not like '%)%';
	



SELECT 
    upper(left('lorem ipsum', 1)) || lower(substring('lorem ipsum' FROM 2))
AS formatted_text;



select 
	name 
from track
where 
 name like '%run%';
 



select 
	 first_name
	 , last_name 
from customer
where email like '%gmail%';


select 
    name
from 
    Track
where 
	length(name) =
		(select 
			max(length(name)) 
		from track);



select 
    extract (month from invoice_date ) as month_id,
    sum(total) as sales_sum
from invoice
where 
    extract (year from invoice_date) = 2021
group by 
    month_id
order by 
    month_id;



   




   
select 
    extract (month from invoice_date ) as month_id,
    to_char(invoice_date, 'month') as month_name,
    sum(total) as sales_sum
from invoice
where e
    extract (year from invoice_date) = 2021
group by 
    month_id, month_name 
order by 
    month_id;
eee
   
   
   
select 
    concat(first_name , ' ', last_name ) as full_name,
    birth_date,
    extract(year from age( birth_date )) as age_now
from 
    employee 
order by 
    age_now desc
limit 3;



select 
    avg(extract (year from age(birth_date) + interval '3 years 4 months')) as average_age_in_3_years_4_months
from 
    employee ;


   
   
select 
    extract(year from invoice_date) as sale_year,
    country,
    sum(total) as sales_sum
from 
    invoice
join 
    customer on invoice.customer_id = customer.customer_id 
group by 
    sale_year, country
having 
    sum(total) > 20
order by 
    sale_year asc, 
    sales_sum desc;








