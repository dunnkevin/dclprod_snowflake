- dashboard: color_dash
  title: Color Dash
  layout: newspaper
  elements:
  - title: Color Dash
    name: Color Dash
    model: kd_snowflake
    explore: order_items
    type: looker_pie
    fields: [products.category, order_items.count]
    sorts: [order_items.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    series_colors:
      Men - order_items.count: "#66d629"
      Women - order_items.count: "#405cb0"
      Blazers & Jackets: "#5aeb90"
      Sleep & Lounge: "#000000"
      Accessories: "#000000"
      Jeans: "#000000"
      Tops & Tees: "#000000"
      Shorts: "#000000"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    row: 0
    col: 0
    width: 8
    height: 6
  - title: New Tile
    name: New Tile
    model: kd_snowflake
    explore: order_items
    type: looker_column
    fields: [products.category, order_items.count, products.department]
    pivots: [products.department]
    sorts: [order_items.count desc 0, products.department]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      Men - order_items.count: "#000000"
      Women - order_items.count: "#405cb0"
      Blazers & Jackets: "#5aeb90"
      Sleep & Lounge: "#000000"
      Accessories: "#000000"
      Jeans: "#000000"
      Tops & Tees: "#000000"
      Shorts: "#000000"
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    row: 0
    col: 8
    width: 8
    height: 6
