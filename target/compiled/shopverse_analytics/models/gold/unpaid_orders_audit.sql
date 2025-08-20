select 
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_price AS order_total_amount,
    'No successful payment recorded' AS audit_note
FROM
    shopverse_analytics.silver.stg_orders o
LEFT JOIN
   
    shopverse_analytics.silver.stg_payments sp ON o.order_id = sp.order_id
WHERE

    sp.payment_id IS NULL