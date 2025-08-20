SELECT
    c.customer_id,
    c.name,
    cn.region,
    c.country,
    c.segment,
    SUM(iop.profit) AS total_profit,
    COUNT(DISTINCT iop.order_id) AS total_orders
FROM {{ ref('stg_customers') }} AS c
INNER JOIN
    {{ ref('int_order_payments') }} AS iop
    ON c.customer_id = iop.customer_id
INNER JOIN {{ ref('country') }} AS cn ON c.country = cn.country
GROUP BY
    c.customer_id,
    c.name,
    cn.region,
    c.country,
    c.segment
