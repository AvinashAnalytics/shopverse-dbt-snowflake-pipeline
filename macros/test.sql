{% macro test1() %}

{% set results = run_query("LIST @shopverse_stage") %}
{% set rows = results.columns[0].values %}

{% set folders = [] %}
{% for path in rows %}
    {% set folder = path.split('/')[0] %}
    {% if folder not in folders %}
        {% do folders.append(folder) %}
    {% endif %}
{% endfor %}

{# Sort and loop through folder names #}
{% for n in folders | sort %}
    {% set name = 'bronze_' ~ n %}
    {% set path = '@shopverse_stage/' ~ n ~ '/' %}
    {% set sql %}
CREATE OR REPLACE TABLE {{ target.database }}.{{ target.schema }}.{{ name }}
USING TEMPLATE (
    SELECT ARRAY_AGG(OBJECT_CONSTRUCT(*))
    FROM TABLE(INFER_SCHEMA(
        LOCATION => '{{ path }}',
        FILE_FORMAT => 'shopverse_csv',
        IGNORE_CASE => TRUE
    ))
);
COPY INTO {{ target.database }}.{{ target.schema }}.{{ name }}
FROM {{ path }}
FILE_FORMAT = (FORMAT_NAME = 'shopverse_csv')
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;
    {% endset %}
    {% do run_query(sql) %}
{% endfor %}

{% endmacro %}