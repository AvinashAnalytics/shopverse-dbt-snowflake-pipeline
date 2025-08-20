{{ config(materialized='view') }}
SELECT DISTINCT
    product_id,
    product_name,
    category,
    subcategory
FROM {{ source('shopverse_raw', 'bronze_products') }}
