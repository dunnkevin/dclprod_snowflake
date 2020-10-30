view: derived_table {
    derived_table: {
      sql: select * from PUBLIC.{% parameter table_picker %} where {% condition date_filter %} ORDER_ITEMS.CREATED_AT {% endcondition %}
        ;;
    }
    parameter: table_picker {
      type: unquoted
      allowed_value: {
        label: "inventory items"
        value: "INVENTORY_ITEMS"
      }
      allowed_value: {
        label: "order itmes"
        value: "ORDER_ITEMS"
      }
    }
    dimension: id {}

    filter: date_filter {
      type: date
    }

}
