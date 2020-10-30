include: "/views/order_items.view"
view: order_items_for_pop {
  extends: [order_items]

  # Parameter for choosing what period of time to look at
  parameter: period_chooser {
    type: string
    allowed_value: {
      label: "Quarter"
      value: "quarter"
    }
    allowed_value: {
      label: "Month"
      value: "month"
    }
    allowed_value: {
      label: "Week"
      value: "week"
    }
    allowed_value: {
      label: "Day"
      value: "day"
    }
  }

  #comment 1

  #comment 2

  # Prameter for choosing what to compare
  parameter: compare_chooser {
    type: string
    allowed_value: {
      label: "Year"
      value: "year"
    }
    allowed_value: {
      label: "Quarter"
      value: "quarter"
    }
    allowed_value: {
      label: "Month"
      value: "month"
    }
    allowed_value: {
      label: "Week"
      value: "week"
    }
  }

  dimension: dynamic_period {
    label_from_parameter: period_chooser
    type: string
    sql:
        {% if period_chooser._parameter_value == "'quarter'" %}
        ${created_quarter_of_year}
        {% elsif period_chooser._parameter_value == "'month'" %}
        ${created_month_name}
        {% elsif period_chooser._parameter_value == "'week'" %}
        ${created_week_of_year}
        {% elsif period_chooser._parameter_value == "'day'" %}
        ${created_day_of_year}
        {% else %}
        null
        {% endif %}
        ;;
  }

  dimension: period_sorter {
    type: string
    hidden: yes
    sql:
    {% if period_chooser._parameter_value == "'quarter'" %}
    ${created_quarter}
    {% elsif period_chooser._parameter_value == "'month'" %}
    ${created_month}
    {% elsif period_chooser._parameter_value == "'week'" %}
    ${created_week_of_year}
    {% elsif period_chooser._parameter_value == "'day'" %}
    ${created_day_of_year}
    {% else %}
    null
    {% endif %}
    ;;

  }

  dimension: dynamic_compare {
    label_from_parameter: compare_chooser
    type: string
    sql:
        {% if compare_chooser._parameter_value == "'year'" %}
        ${created_year}
        {% elsif compare_chooser._parameter_value == "'quarter'" %}
        ${created_quarter_of_year}
        {% elsif compare_chooser._parameter_value == "'month'" %}
        ${created_month_name}
        {% elsif compare_chooser._parameter_value == "'week'" %}
        ${created_week_of_year}
        {% else %}
        null
        {% endif %}
        ;;
  }

}
