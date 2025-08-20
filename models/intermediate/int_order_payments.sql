{{ config(materialized='ephemeral') }}
SELECT
    o.*,
    p.payment_id,
    p.payment_method
FROM {{ ref('stg_orders') }} AS o
INNER JOIN {{ ref('stg_payments') }} AS p ON o.order_id = p.order_id
