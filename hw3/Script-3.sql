/* 1 */
select 
    e.employee_id as "employee_id",
    e.first_name || ' ' || e.last_name as "full_name",
    coalesce(count(c.customer_id), 0) as "customer_count",
    (coalesce(count(c.customer_id), 0) * 100.0 / (select count(*) from customer)) as "percentage_of_total_customers"
from 
    employee e
left join 
    customer c on e.employee_id = c.support_rep_id
group by 
    e.employee_id, e.first_name, e.last_name
order by 
    e.employee_id;

/* 2 */
select 
    a.title as "album_title",
    ar.name as "artist_name"
from 
    album a
join 
    artist ar on a.artist_id = ar.artist_id
left join 
    track t on a.album_id = t.album_id
left join 
    invoice_line il on t.track_id = il.track_id
group by 
    a.album_id, a.title, ar.name
having 
    count(il.track_id) = 0
order by 
    a.title;
   
   
   
/* 3 не смог(( */
   
/* 4 */ 
   
select 
    e.employee_id as employee_id,
    e.first_name || ' ' || e.last_name as full_name,
    e.title as position
from 
    employee e
where 
    e.employee_id not in (select distinct reports_to from employee where reports_to is not null)
order by 
    e.employee_id;




/* 5 */
   

select 
    c.customer_id,
    c.first_name || ' ' || c.last_name as full_name,
    min(i.invoice_date) as first_purchase_date,
    max(i.invoice_date) as last_purchase_date,
    extract(year from age(max(i.invoice_date), min(i.invoice_date))) as diff_in_years
from 
    customer c
join 
    invoice i on c.customer_id = i.customer_id
group by 
    c.customer_id, c.first_name, c.last_name
order by 
    c.customer_id;
   
   
   
   
   
/* 6 */
   
   
select 
    extract(year from i.invoice_date) as year,
    a.title as album_title,
    ar.name as artist_name,
    sum(il.quantity) as total_sold
from 
    album a
join 
    track t on a.album_id = t.album_id
join 
    invoice_line il on t.track_id = il.track_id
join 
    invoice i on il.invoice_id = i.invoice_id
join 
    artist ar on a.artist_id = ar.artist_id
group by 
    year, a.album_id, album_title, artist_name
order by 
    year, total_sold desc;
   
   
 /* 7 */

   
   
select 
    t.track_id as track_id,
    t.name as track_title
from 
    track t
join 
    invoice_line il on t.track_id = il.track_id
join 
    invoice i on il.invoice_id = i.invoice_id
join 
    customer c on i.customer_id = c.customer_id
where 
    c.country in ('USA', 'Canada')
group by 
    t.track_id, t.name
having 
    count(distinct c.country) = 2;
   
   
   
/* 8 */
   
   
   
   
select 
    t.track_id as track_id,
    t.name as track_title
from 
    track t
join 
    invoice_line il on t.track_id = il.track_id
join 
    invoice i on il.invoice_id = i.invoice_id
join 
    customer c on i.customer_id = c.customer_id
group by 
    t.track_id, t.name
having 
    sum(case when c.country = 'Canada' then 1 else 0 end) > 0
    and sum(case when c.country = 'USA' then 1 else 0 end) = 0;




   
   
   
   
   
   
   
   
   
   
   
   
   