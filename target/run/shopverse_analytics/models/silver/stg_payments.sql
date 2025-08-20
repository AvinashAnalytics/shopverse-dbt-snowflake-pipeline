
  create or replace   view shopverse_analytics.silver.stg_payments
  
   as (
    
SELECT *
FROM SHOPVERSE_ANALYTICS.BRONZE.bronze_payments
WHERE status = 'Success'
  );

