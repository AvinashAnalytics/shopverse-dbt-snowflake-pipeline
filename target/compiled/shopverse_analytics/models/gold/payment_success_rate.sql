SELECT
    payment_method,
    COUNT(CASE WHEN status = 'Success' THEN payment_id END) AS successful_payments,
    COUNT(payment_id) AS total_payments,
    (COUNT(CASE WHEN status = 'Success' THEN payment_id END)::FLOAT / COUNT(payment_id)) AS success_rate
FROM SHOPVERSE_ANALYTICS.BRONZE.bronze_payments
GROUP BY payment_method
ORDER BY payment_method