
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select product_id
from SHOPVERSE_ANALYTICS.BRONZE.bronze_products
where product_id is null



  
  
      
    ) dbt_internal_test