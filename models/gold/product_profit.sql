{{ config(materialized='view') }}
SELECT
    category,
    subcategory,
    SUM(profit) AS total_profit
FROM {{ ref('int_order_payments') }}
INNER JOIN {{ ref('stg_products') }} USING (product_id)
GROUP BY category, subcategory
ORDER BY category
