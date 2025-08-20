{% macro test() %}

{% set tables = [
    dict(name='bronze_orders', stage_path='@shopverse_stage/orders/'),
    dict(name='bronze_customers', stage_path='@shopverse_stage/customers/'),
    dict(name='bronze_products', stage_path='@shopverse_stage/products/'),
    dict(name='bronze_payments', stage_path='@shopverse_stage/payments/')
] %}

{% for table in tables %}
    {% set table_name = table.name %}
    {% set stage_path = table.stage_path %}

    {% do log("🔧 Creating " ~ table_name ~ "...", info=True) %}
    {% set create_sql %}
    CREATE OR REPLACE TABLE {{ target.database }}.{{ target.schema }}.{{ table_name }}
    USING TEMPLATE (
      SELECT ARRAY_AGG(OBJECT_CONSTRUCT(*)) 
      FROM TABLE(
        INFER_SCHEMA(
          LOCATION => '{{ stage_path }}',
          FILE_FORMAT => 'shopverse_csv',
          ignore_case => true
        )
      )
    )
    {% endset %}
    {% do run_query(create_sql) %}

    {% do log("📦 Loading " ~ table_name ~ "...", info=True) %}
    {% set copy_sql %}
    COPY INTO {{ target.database }}.{{ target.schema }}.{{ table_name }}
    FROM {{ stage_path }}
    FILE_FORMAT = (FORMAT_NAME = 'shopverse_csv')
    MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE
    {% endset %}
    {% do run_query(copy_sql) %}
{% endfor %}

{% do log("✅ All Bronze tables created and loaded successfully!", info=True) %}

{% endmacro %}