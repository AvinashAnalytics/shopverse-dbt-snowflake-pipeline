
  create or replace   view shopverse_analytics.silver.stg_orders
  
   as (
    
SELECT
    order_id,
    customer_id,
    product_id,
    quantity,
    selling_price,
    cost_price,
     
  (selling_price - cost_price) * quantity
 AS profit,
    quantity * selling_price AS total_price,
    order_date
FROM SHOPVERSE_ANALYTICS.BRONZE.bronze_orders
  );

