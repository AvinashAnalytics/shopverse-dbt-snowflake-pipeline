
  create or replace   view shopverse_analytics.stg.stg_customers
  
   as (
    

SELECT
   *
FROM SHOPVERSE_ANALYTICS.BRONZE.bronze_customers
  );

