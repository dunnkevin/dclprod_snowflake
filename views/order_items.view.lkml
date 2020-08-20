view: order_items {
  sql_table_name: PUBLIC.ORDER_ITEMS
    ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }
  
  #heythere

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      quarter,
      quarter_of_year,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DELIVERED_AT" ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."INVENTORY_ITEM_ID" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."RETURNED_AT" ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}."SALE_PRICE" ;;
  }

  dimension: sale_price_tiers{
    type: tier
    tiers: [1, 2, 3, 4, 5, 10, 15, 20, 25, 30]
    style: integer
    sql: ${sale_price} ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SHIPPED_AT" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    type: count
  }

  measure: order_count {
    type: count_distinct
    sql: ${order_id} ;;
  }

  parameter:  currency {
    type: string
    allowed_value: {
      label: "USD"
      value: "USD"
    }
    allowed_value: {
      label: "GBP"
      value: "GBP"
    }
  }

  measure: converted_total_amount {
    type: sum
    hidden: no
    label: "Total Amount"
    value_format: "#,###.00"
    html: {% if order_items.currency._parameter_value == "'USD'" %} ${{ rendered_value }}
      {% elsif order_items.currency._parameter_value == "'GBP'" %} £{{ rendered_value }}
      {% elsif order_items.currency._parameter_value == "'EUR'" %} €{{ rendered_value }}
      {% elsif order_items.currency._parameter_value == "'CAD'" %} C${{ rendered_value }}
      {% endif %};;

      sql: ${sale_price};;
    }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.first_name,
      users.last_name,
      users.id,
      inventory_items.id,
      inventory_items.product_name
    ]
  }
}
