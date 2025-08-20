
    
    

select
    country as unique_field,
    count(*) as n_records

from shopverse_analytics.silver.stg_country
where country is not null
group by country
having count(*) > 1


