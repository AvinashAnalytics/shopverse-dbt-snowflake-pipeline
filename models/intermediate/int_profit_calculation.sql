{{ config(materialized='ephemeral') }}
SELECT
    order_id,
     {{ calculate_profit('selling_price', 'cost_price', 'quantity') }} AS profit,
FROM {{ ref('stg_orders') }}