{% macro calculate_profit(selling_price, cost_price, quantity) %}
  ({{ selling_price }} - {{ cost_price }}) * {{ quantity }}
{% endmacro %}