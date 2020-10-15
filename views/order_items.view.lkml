view: order_items {
  sql_table_name: PUBLIC.ORDER_ITEMS
    ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
    html: <a href="/looks/106?">{{value}} </a>;;
  }

  set: field_set {
    fields: [created_date,sale_price]
  }

  # dimension: testy_date {
  #   type: string
  #   sql: {{ filters.date_start._sql }} ;;
  # }



  parameter: date_param {
    type: date
  }

  dimension: dummy_field_for_breaking_search {
    sql:lower(${TABLE}."broken_search") ;;
  }

  dimension: param_dim {
    type: string
    sql: {% parameter date_param %} ;;
  }


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

  dimension_group: shipping {
    type: duration
    sql_start: ${created_raw};;
    sql_end: ${delivered_raw} ;;
    intervals: [
      minute,
      hour,
      day,
      month
    ]
  }


  dimension: max_shipping {
    sql: (select max(${created_raw}) from ${TABLE})  ;;
  }

  dimension: dynamic_shipping {
    sql: CASE WHEN ${days_shipping} < 7 THEN ${hours_shipping} || ' hours' ELSE ${days_shipping} || ' days' END ;;
    order_by_field: dynamic_shipping_ordering
    html: {{ dynamic_shipping._sql }} ;;
  }

  dimension: dynamic_shipping_ordering {
    type: number
    sql: CASE WHEN ${days_shipping} < 7 THEN ${hours_shipping}  ELSE ${days_shipping} * 168 END ;;
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
    drill_fields: [created_year, status]
    link: {
      label: "Drill Down Here"
      url: "{{link}}&f[order_items.status]=8%2C6&f[products.department]=expansion&limit=5000&total=on"
    }
  }

  measure: boop {
    label: "1-3"
    type: number
    sql: sum(null) ;;
  }

  measure: boop1 {
    label: "2-3"
    type: number
    sql: sum(null) ;;
  }

  measure: boop2 {
    label: "3-3"
    type: number
    sql: sum(null) ;;
  }

  measure: boop3 {
    label: "4-3"
    type: number
    sql: sum(null) ;;
  }

  measure: order_count {
    type: count_distinct
    sql: ${order_id} ;;
    filters: [
      products.department: "whatever"
    ]
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
    sql: ${sale_price};;
    filters: [
      products.department: "whatever"
    ]
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
