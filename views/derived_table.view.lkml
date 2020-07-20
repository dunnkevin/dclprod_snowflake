view: derived_table {
  derived_table: {
    explore_source: order_items {
      column: id {}
    }
  datagroup_trigger: kd_snowflake_default_datagroup
  }
  dimension: id {
    type: number
  }
}
