
with __dbt__cte__int_order_payments as (

SELECT o.*, p.payment_id, p.payment_method
FROM shopverse_analytics.silver.stg_orders o
JOIN shopverse_analytics.silver.stg_payments p ON o.order_id = p.order_id
) SELECT country, region, SUM(profit) AS total_profit
FROM __dbt__cte__int_order_payments
JOIN shopverse_analytics.stg.stg_customers USING (customer_id)
JOIN shopverse_analytics.silver.stg_country USING (country)
GROUP BY country, region