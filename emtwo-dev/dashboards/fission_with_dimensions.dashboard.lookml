- dashboard: fission_with_dimensions
  title: Fission with Dimensions
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Content Process Max
    name: Content Process Max
    model: fission
    explore: dimensions
    type: looker_line
    fields: [dimensions.median, dimensions.build_id, dimensions.branch]
    pivots: [dimensions.branch]
    filters:
      dimensions.probe: CONTENT_PROCESS_MAX
    layout: grid
    listen:
      OS: dimensions.os
      Cores: dimensions.cores_count
      Percentile: dimensions.percentile_conf
    row: 19
    col: 0
    width: 12
    height: 8
  - title: Content Process Count
    name: Content Process Count
    model: fission
    explore: dimensions
    type: looker_line
    fields: [dimensions.median, dimensions.build_id, dimensions.branch]
    pivots: [dimensions.branch]
    filters:
      dimensions.probe: CONTENT_PROCESS_COUNT
    layout: grid
    listen:
      OS: dimensions.os
      Cores: dimensions.cores_count
      Percentile: dimensions.percentile_conf
    row: 19
    col: 12
    width: 12
    height: 8
  - title: Checkerboard Severity
    name: Checkerboard Severity
    model: fission
    explore: dimensions
    type: looker_line
    fields: [dimensions.median, dimensions.build_id, dimensions.branch]
    pivots: [dimensions.branch]
    filters:
      dimensions.probe: CHECKERBOARD_SEVERITY
    layout: grid
    listen:
      OS: dimensions.os
      Cores: dimensions.cores_count
      Percentile: dimensions.percentile_conf
    row: 27
    col: 0
    width: 12
    height: 8
  - title: Child Process Launch MS
    name: Child Process Launch MS
    model: fission
    explore: dimensions
    type: looker_line
    fields: [dimensions.median, dimensions.build_id, dimensions.branch]
    pivots: [dimensions.branch]
    filters:
      dimensions.probe: CHILD_PROCESS_LAUNCH_MS
    layout: grid
    listen:
      OS: dimensions.os
      Cores: dimensions.cores_count
      Percentile: dimensions.percentile_conf
    row: 27
    col: 12
    width: 12
    height: 8
  - title: Child Process Launch MS
    name: Child Process Launch MS (2)
    model: fission
    explore: dimensions
    type: looker_line
    fields: [dimensions.build_id, dimensions.branch, dimensions.percentile_high, dimensions.percentile_low,
      dimensions.percentile]
    pivots: [dimensions.branch]
    filters:
      dimensions.probe: CHILD_PROCESS_LAUNCH_MS
      dimensions.os: Windows
      dimensions.cores_count: '4'
      dimensions.branch: fission-enabled,fission-disabled
    sorts: [dimensions.build_id desc, dimensions.branch]
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
    series_colors:
      fission-disabled - dimensions.percentile: "#1A73E8"
      fission-enabled - dimensions.percentile: "#E8710A"
      fission-enabled - dimensions.percentile_high: "#fac014"
      fission-disabled - dimensions.percentile_high: "#12B5CB"
    layout: grid
    defaults_version: 1
    listen:
      Percentile: dimensions.percentile_conf
    row: 2
    col: 12
    width: 12
    height: 8
  - title: Content Process Max
    name: Content Process Max (2)
    model: fission
    explore: dimensions
    type: looker_line
    fields: [dimensions.build_id, dimensions.branch, dimensions.percentile, dimensions.percentile_high,
      dimensions.percentile_low]
    pivots: [dimensions.branch]
    filters:
      dimensions.probe: CONTENT_PROCESS_MAX
      dimensions.branch: fission-enabled,fission-disabled
    sorts: [dimensions.build_id desc, dimensions.branch]
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
    series_colors:
      fission-disabled - dimensions.percentile: "#1A73E8"
      fission-disabled - dimensions.percentile_low: "#12B5CB"
      fission-enabled - dimensions.percentile_low: "#F9AB00"
    layout: grid
    defaults_version: 1
    listen:
      OS: dimensions.os
      Cores: dimensions.cores_count
      Percentile: dimensions.percentile_conf
    row: 2
    col: 0
    width: 12
    height: 8
  - title: Checkerboard Severity
    name: Checkerboard Severity (2)
    model: fission
    explore: dimensions
    type: looker_line
    fields: [dimensions.build_id, dimensions.branch, dimensions.percentile, dimensions.percentile_high,
      dimensions.percentile_low]
    pivots: [dimensions.branch]
    filters:
      dimensions.probe: CHECKERBOARD_SEVERITY
      dimensions.branch: fission-enabled,fission-disabled
    sorts: [dimensions.build_id desc, dimensions.branch]
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
    series_colors:
      fission-disabled - dimensions.percentile_low: "#12B5CB"
      fission-enabled - dimensions.percentile_low: "#F9AB00"
    layout: grid
    defaults_version: 1
    listen:
      OS: dimensions.os
      Cores: dimensions.cores_count
      Percentile: dimensions.percentile_conf
    row: 10
    col: 0
    width: 12
    height: 7
  - title: Content Process Count
    name: Content Process Count (2)
    model: fission
    explore: dimensions
    type: looker_line
    fields: [dimensions.build_id, dimensions.branch, dimensions.percentile, dimensions.percentile_high,
      dimensions.percentile_low]
    pivots: [dimensions.branch]
    filters:
      dimensions.probe: CONTENT_PROCESS_COUNT
      dimensions.branch: fission-enabled,fission-disabled
    sorts: [dimensions.build_id desc, dimensions.branch]
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
    series_colors:
      fission-disabled - dimensions.percentile_low: "#12B5CB"
      fission-enabled - dimensions.percentile_low: "#F9AB00"
    layout: grid
    defaults_version: 1
    listen:
      OS: dimensions.os
      Cores: dimensions.cores_count
      Percentile: dimensions.percentile_conf
    row: 10
    col: 12
    width: 12
    height: 7
  - name: Median
    type: text
    title_text: Median
    subtitle_text: ''
    body_text: ''
    row: 17
    col: 0
    width: 24
    height: 2
  - name: Percentiles
    type: text
    title_text: Percentiles
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: OS
    title: OS
    type: string_filter
    default_value: Windows
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Windows
      - Linux
      - Mac
  - name: Cores
    title: Cores
    type: string_filter
    default_value: '4'
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - '2'
      - '4'
      - '6'
      - '8'
      - '10'
      - '12'
      - '14'
      - '16'
  - name: Percentile
    title: Percentile
    type: field_filter
    default_value: '50'
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - '10'
      - '20'
      - '30'
      - '40'
      - '50'
      - '60'
      - '70'
      - '80'
      - '90'
      - '95'
      - '99'
    model: fission
    explore: dimensions
    listens_to_filters: []
    field: dimensions.percentile_conf
