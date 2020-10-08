connection: "snowflakelooker"

# include all the views
include: "/views/**/*.view"
include: "/colors.dashboard"

datagroup: kd_snowflake_default_datagroup {
  sql_trigger: SELECT CURRENT_TIMESTAMP();;
  max_cache_age: "1 hour"
}

explore: orders {
  view_name: products
}

#comment

persist_with: kd_snowflake_default_datagroup

# explore: order_items_for_pop {}


explore: derived_table {
  access_filter: {
    field: derived_table.app_key
    user_attribute: city_name
  }
}


explore: order_items {
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
    sql_where: ${users.city} = 'Santa Cruz' ;;
  }

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
