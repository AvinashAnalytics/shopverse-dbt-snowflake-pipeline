{{ config(materialized='view') }}
SELECT
    country,
    region,
    SUM(profit) AS total_profit
FROM {{ ref('int_order_payments') }}
INNER JOIN {{ ref('stg_customers') }} USING (customer_id)
INNER JOIN {{ ref('stg_country') }} USING (country)
GROUP BY country, region
