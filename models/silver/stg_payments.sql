{{ config(materialized='view') }}
SELECT *
FROM {{ source('shopverse_raw', 'bronze_payments') }}
WHERE status = 'Success'
