view: derived_table {
    derived_table: {
      sql: SELECT app_key
        AND {% condition ts_group_date %} ts {% endcondition %}
        AND {% condition session_type %} event_type {% endcondition %}
        AND app_key = '{{ _user_attributes['city_name'] }}'
        AND CASE WHEN {{ _user_attributes['company'] }} = 3 THEN ts >= TIMESTAMP_SUB(current_timestamp, INTERVAL 124 DAY) ELSE ts >= TIMESTAMP_SUB(current_timestamp, INTERVAL 426 DAY) END
        ;;
    }
    dimension: session_type {
    }
    dimension: app_key {
    }
    dimension_group: ts_group {
      type: time
      timeframes: [
        raw,
        time,
        time_of_day,
        hour_of_day,
        day_of_week,
        date,
        week,
        month,
        week_of_year
      ]
      sql: ${TABLE}.ts ;;
    }
}
