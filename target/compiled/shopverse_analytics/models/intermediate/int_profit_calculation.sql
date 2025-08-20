
SELECT
    order_id,
     
  (selling_price - cost_price) * quantity
 AS profit,
FROM shopverse_analytics.silver.stg_orders