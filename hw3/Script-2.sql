select 
    e.employee_id as "id сотрудника",
    e.first_name || ' ' || e.last_name as "полное имя",
    e.title as "позиция",
    e.reports_to as "id менеджера",
    m.first_name || ' ' || m.last_name as "полное имя менеджера",
    m.title as "позиция менеджера"
from 
    employee e
left join 
    employee m on e.reports_to = m.employee_id
order by 
    e.employee_id;

   
   
   
   
select 
    invoice_id as "invoice_id",
    invoice_date as "invoice_date",
    (extract(year from invoice_date) * 100 + extract(month from invoice_date))::int as "monthkey",
    customer_id as "customer_id",
    total
from 
    invoice
where 
    extract(year from invoice_date) = 2023
    and total > (
        select avg(total)
        from invoice
        where extract(year from invoice_date) = 2023
    )
order by 
    invoice_id;

   
   
   
   
   
select 
    i.invoice_id as "invoice_id",
    i.invoice_date as "invoice_date",
    (extract(year from i.invoice_date) * 100 + extract(month from i.invoice_date))::int as "monthkey",
    i.customer_id as "customer_id",
    c.email as "email",
    i.total
from 
    invoice i
join 
    customer c on i.customer_id = c.customer_id
where 
    extract(year from i.invoice_date) = 2023
    and i.total > (
        select avg(total)
        from invoice
        where extract(year from invoice_date) = 2023
    )
order by 
    i.invoice_id;
   
   
   
   
   
   
select 
    i.invoice_id as "invoice_id",
    i.invoice_date as "invoice_date",
    (extract(year from i.invoice_date) * 100 + extract(month from i.invoice_date))::int as "monthkey",
    i.customer_id as "customer_id",
    c.email as "email",
    i.total
from 
    invoice i
join 
    customer c on i.customer_id = c.customer_id
where 
    extract(year from i.invoice_date) = 2023
    and i.total > (
        select avg(total)
        from invoice
        where extract(year from invoice_date) = 2023
    )
    and c.email not like '%@gmail.com'
order by 
    i.invoice_id;


   
   
   
   
   
select 
    i.invoice_id as "invoice_id",
    i.invoice_date as "invoice_date",
    i.total as "total",
    (i.total / total_revenue.total_revenue) * 100 as "percentage_of_total_revenue"
from 
    invoice i,
    (select sum(total) as total_revenue
     from invoice
     where extract(year from invoice_date) = 2024) total_revenue
where 
    extract(year from i.invoice_date) = 2024
order by 
    i.invoice_id;
   
   
   

   
   
select 
    c.customer_id as "customer_id",
    c.first_name || ' ' || c.last_name as "customer_name",
    sum(i.total) as "customer_revenue",
    (sum(i.total) / total_revenue.total_revenue) * 100 as "percentage_of_total_revenue"
from 
    customer c
join 
    invoice i on c.customer_id = 
    i.customer_id
join 
    (select sum(total) as total_revenue
     from invoice
     where extract(year from invoice_date) = 2024) total_revenue on true
where 
    extract(year from i.invoice_date) = 2024
group by 
    c.customer_id, c.first_name, c.last_name, total_revenue.total_revenue
order by 
    c.customer_id;


   
   
   
   
   
   
   




   

