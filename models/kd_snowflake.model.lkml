connection: "snowflakelooker"

# include all the views
include: "/views/**/*.view"
include: "/*.dashboard"

datagroup: kd_snowflake_default_datagroup {
  sql_trigger: SELECT CURRENT_TIMESTAMP();;
  max_cache_age: "1 hour"
}

#comment

persist_with: kd_snowflake_default_datagroup

# explore: order_items_for_pop {}

# boopity bop


explore: derived_table {}

explore: order_items {
  join: users {
    view_label: "Order Status"
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
    sql_where: ${users.city} = 'Santa Cruz' ;;
  }
  join: user_status {
    from: users
    sql_on: ${user_status.id} = ${order_items.user_id} ;;
    relationship: many_to_one
    type: left_outer
    # view_label: "user_status"
  }

  join: company_status {
    from: users
    sql_on: ${company_status.id} = ${order_items.user_id} ;;
    relationship: many_to_one
    type: left_outer
  }


  # join: status {
  #   view_label: "Order Status"
  #   sql_on: ${company_order.status_id} = ${status.status_id} ;;
  #   relationship: many_to_one
  # }

  # join: user_status {
  #   from: status
  #   foreign_key: user.status_id
  # }

  # join: company_status {
  #   from: status
  #   sql_on: ${company_status.status_id} = ${company.status_id} ;;
  #   relationship: many_to_one
  # }

  # join: company_order_status {
  #   from: status
  #   sql_on: ${company_order_status.status_id} = ${company_order.status_id} ;;
  #   relationship: many_to_one
  # }

  # join: status {
  #   view_label: "Order Status"
  #   sql_on: ${company_order.status_id} = ${status.status_id} ;;
  #   relationship: many_to_one
  # }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}





explore: union_test {}
explore: union_test_number {}




explore: payments {
  from: order_items
  join: users {
    type: left_outer
    sql_on: ${payments.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${payments.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}


explore: users {}
