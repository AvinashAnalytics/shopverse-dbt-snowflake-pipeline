
  create or replace   view shopverse_analytics.silver.stg_country
  
   as (
    
SELECT * FROM shopverse_analytics.silver.country
  );

