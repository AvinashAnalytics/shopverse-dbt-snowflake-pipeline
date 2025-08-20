{{ config(materialized='view') }}
SELECT * FROM {{ ref('country') }}
