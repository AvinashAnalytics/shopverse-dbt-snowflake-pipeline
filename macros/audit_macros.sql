{% macro log_model_run(model_name) %}
    INSERT INTO {{ target.database }}.PUBLIC.dbt_audit_log (
        model_name,
        run_started_at,
        run_completed_at,
        dbt_version,
        target_name,
        target_database,
        target_schema,
        target_warehouse,
        status
    ) VALUES (
        '{{ model_name }}',
        '{{ run_started_at }}',
        CURRENT_TIMESTAMP(),
        '{{ dbt_version }}',
        '{{ target.name }}',
        '{{ target.database }}',
        '{{ this.schema }}', 
        '{{ target.warehouse }}',
        'SUCCESS'
    )
{% endmacro %}