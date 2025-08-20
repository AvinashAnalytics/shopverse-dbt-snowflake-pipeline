select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_price as order_total_amount,
    'No successful payment recorded' as audit_note
from
    {{ ref('stg_orders') }} as o
left join

    {{ ref('stg_payments') }} as sp
    on o.order_id = sp.order_id
where

    sp.payment_id is NULL
