{{ config(materialized='view') }}
SELECT
    order_id,
    customer_id,
    product_id,
    quantity,
    selling_price,
    cost_price,
     {{ calculate_profit('selling_price', 'cost_price', 'quantity') }} AS profit,
    quantity * selling_price AS total_price,
    order_date
FROM {{ source('shopverse_raw', 'bronze_orders') }}
