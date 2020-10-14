- dashboard: automagic_heatmap_dash
  title: Automagic heatmap dash
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
    model: kd_snowflake
    explore: order_items
    type: looker_map
    fields: [users.location, order_items.count]
    filters:
      users.location_bin_level: '6'
      users.location: inside box from 85.0511287798066, -360 to 0, 180
    sorts: [order_items.count desc]
    limit: 5000
    query_timezone: America/Los_Angeles
    map_plot_mode: automagic_heatmap
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 49.26780455063753
    map_longitude: -73.30078125000001
    map_zoom: 2
    series_types: {}
    defaults_version: 1
    row: 0
    col: 0
    width: 8
    height: 6
  - title: New Tile
    name: New Tile (2)
    model: system__activity
    explore: history
    type: looker_column
    fields: [history.query_run_count, history.created_day_of_week, user_query_rank.user_name]
    pivots: [user_query_rank.user_name]
    fill_fields: [history.created_day_of_week]
    filters:
      history.created_date: 7 days
    sorts: [history.created_day_of_week, user_query_rank.user_name desc]
    limit: 500
    column_limit: 15
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
    limit_displayed_rows: true
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
    y_axes: []
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_labels:
      history.created_day_of_week: Created
      zz_user_query_rank.user_query_rank: Rank
      user_query_rank.user_query_rank: Rank
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_column_widths:
      history.created_day_of_week: 83
    series_cell_visualizations:
      history.query_run_count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null '', color_application: {collection_id: legacy, custom: {id: 85ebde76-7c6b-6970-071e-79fda2ac49b3,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true}}}]
    truncate_column_names: false
    subtotals_at_bottom: false
    hidden_fields: []
    defaults_version: 1
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 6
  - title: New Tile
    name: New Tile (3)
    model: system__activity
    explore: history
    type: looker_area
    fields: [history.query_run_count, history.created_day_of_week, user_query_rank.user_name]
    pivots: [user_query_rank.user_name]
    fill_fields: [history.created_day_of_week]
    filters:
      history.created_date: 7 days
    sorts: [history.created_day_of_week, user_query_rank.user_name desc]
    limit: 500
    column_limit: 15
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
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      history.created_day_of_week: Created
      zz_user_query_rank.user_query_rank: Rank
      user_query_rank.user_query_rank: Rank
    series_column_widths:
      history.created_day_of_week: 83
    series_cell_visualizations:
      history.query_run_count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null '', color_application: {collection_id: legacy, custom: {id: 85ebde76-7c6b-6970-071e-79fda2ac49b3,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true}}}]
    truncate_column_names: false
    subtotals_at_bottom: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen: {}
    row: 0
    col: 16
    width: 8
    height: 6
  - title: New Tile (copy)
    name: New Tile (copy)
    model: system__activity
    explore: history
    type: looker_line
    fields: [history.query_run_count, history.created_day_of_week, user_query_rank.user_name]
    pivots: [user_query_rank.user_name]
    fill_fields: [history.created_day_of_week]
    filters:
      history.created_date: 7 days
    sorts: [history.created_day_of_week, user_query_rank.user_name desc]
    limit: 500
    column_limit: 15
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
    show_null_points: true
    interpolation: linear
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      history.created_day_of_week: Created
      zz_user_query_rank.user_query_rank: Rank
      user_query_rank.user_query_rank: Rank
    series_column_widths:
      history.created_day_of_week: 83
    series_cell_visualizations:
      history.query_run_count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null '', color_application: {collection_id: legacy, custom: {id: 85ebde76-7c6b-6970-071e-79fda2ac49b3,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true}}}]
    truncate_column_names: false
    subtotals_at_bottom: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen: {}
    row: 6
    col: 0
    width: 8
    height: 6
