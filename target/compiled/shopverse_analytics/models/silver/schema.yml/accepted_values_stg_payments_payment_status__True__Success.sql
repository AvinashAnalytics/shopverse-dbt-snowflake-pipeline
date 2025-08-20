
    
    

with all_values as (

    select
        payment_status as value_field,
        count(*) as n_records

    from shopverse_analytics.silver.stg_payments
    group by payment_status

)

select *
from all_values
where value_field not in (
    'Success'
)


