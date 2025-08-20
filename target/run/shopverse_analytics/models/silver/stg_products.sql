
  create or replace   view shopverse_analytics.silver.stg_products
  
   as (
    
SELECT DISTINCT product_id, product_name, category, subcategory
FROM SHOPVERSE_ANALYTICS.BRONZE.bronze_products
  );

