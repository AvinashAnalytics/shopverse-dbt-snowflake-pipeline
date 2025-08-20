
  
    

create or replace transient table shopverse_analytics.gold.customer_profit
    

    
    as (with __dbt__cte__int_order_payments as (

SELECT o.*, p.payment_id, p.payment_method
FROM shopverse_analytics.silver.stg_orders o
JOIN shopverse_analytics.silver.stg_payments p ON o.order_id = p.order_id
) SELECT
    c.customer_id,
    c.name,
    cn.region,
    c.country,
    c.segment,
    SUM(iop.profit) AS total_profit,
    COUNT(DISTINCT iop.order_id) AS total_orders
FROM shopverse_analytics.stg.stg_customers c
JOIN __dbt__cte__int_order_payments iop ON c.customer_id = iop.customer_id
join shopverse_analytics.silver.country cn on c.country=cn.country
GROUP BY
    c.customer_id,
    c.name,
    cn.region,
    c.country,
    c.segment
    )
;


  