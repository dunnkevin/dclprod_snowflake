- dashboard: test_table_vis
  preferred_viewer: dashboards-next
  title: Test Table Vis
  layout: newspaper
  elements:
  - title: test table vis
    name: test table vis
    model: kd_snowflake
    explore: order_items
    type: looker_grid
    fields: [order_items.created_date, order_items.count, order_items.status]
    filters:
      order_items.created_date: 10 days
    sorts: [order_items.created_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: growth, label: "% Growth", expression: 'sum(offset_list(${order_items.count},-4,5))',
        _kind_hint: measure, _type_hint: number, is_disabled: true}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      order_items.count:
        is_active: true
    series_labels:
      order_items.status: "@{color}"
    series_text_format:
      order_items.status:
        fg_color: "@{color}"
        bg_color: "#999999"
    header_font_color: "#9174F0"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    row: 0
    col: 0
    width: 8
    height: 6
