
  create or replace   view shopverse_analytics.gold.product_profit
  
   as (
    
with __dbt__cte__int_order_payments as (

SELECT o.*, p.payment_id, p.payment_method
FROM shopverse_analytics.silver.stg_orders o
JOIN shopverse_analytics.silver.stg_payments p ON o.order_id = p.order_id
) SELECT  category, subcategory, SUM(profit) AS total_profit
FROM __dbt__cte__int_order_payments
JOIN shopverse_analytics.silver.stg_products USING (product_id)
GROUP BY  category, subcategory
order by category
  );

