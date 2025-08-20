{{ config(materialized='view', schema='stg') }}

SELECT *
FROM {{ source('shopverse_raw', 'bronze_customers') }}
