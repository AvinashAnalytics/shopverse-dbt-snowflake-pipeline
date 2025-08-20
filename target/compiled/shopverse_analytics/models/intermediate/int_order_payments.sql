
SELECT o.*, p.payment_id, p.payment_method
FROM shopverse_analytics.silver.stg_orders o
JOIN shopverse_analytics.silver.stg_payments p ON o.order_id = p.order_id