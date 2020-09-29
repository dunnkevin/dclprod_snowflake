view: filters {

  filter: date_filter {
    type: date_time
  }

  dimension: date_start {
    type: date_raw
    sql: {% date_start date_filter %} ;;
  }

  dimension: date_end {
    type: date_raw
    sql: {% date_end date_filter %} ;;
  }
}
