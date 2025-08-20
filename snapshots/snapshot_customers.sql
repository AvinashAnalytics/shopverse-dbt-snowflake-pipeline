{% snapshot snapshot_customers %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='check',  
        check_cols=['Name','segment','country']
    )
}}
SELECT
    customer_id,
    name,
    country,
    segment
FROM
    {{ ref('stg_customers') }}

{% endsnapshot %}