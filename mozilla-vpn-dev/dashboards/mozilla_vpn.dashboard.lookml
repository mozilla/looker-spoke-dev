- dashboard: mozilla_vpn
  title: Mozilla VPN
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 1 day
  elements:
  - title: Granular Subscription Events
    name: Granular Subscription Events
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [all_subscriptions__events.event_date, all_subscriptions__events.delta, all_subscriptions__events.granular_type]
    pivots: [all_subscriptions__events.granular_type]
    fill_fields: [all_subscriptions__events.event_date]
    sorts: [all_subscriptions__events.event_date desc, all_subscriptions__events.granular_type]
    limit: 500
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
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_colors:
      New - all_subscriptions__events.delta: "#08B248"
      Net Paid Subscribers - all_subscriptions__events.delta: "#3D52B9"
      Resurrected - all_subscriptions__events.delta: "#C9DC10"
      Cancelled by Customer - all_subscriptions__events.delta: "#FC2E31"
      Cancelled by IAP - all_subscriptions__events.delta: "#FA2F90"
      Payment Failed = all_subscriptions__events.delta: "FA9200"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      Provider: all_subscriptions.provider
    row: 18
    col: 12
    width: 12
    height: 9
  - title: Subscription Events
    name: Subscription Events
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [all_subscriptions__events.event_date, all_subscriptions__events.delta, all_subscriptions__events.type]
    pivots: [all_subscriptions__events.type]
    fill_fields: [all_subscriptions__events.event_date]
    sorts: [all_subscriptions__events.event_date desc, all_subscriptions__events.type]
    limit: 500
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
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_colors:
      New - all_subscriptions__events.delta: "#08B248"
      Cancelled - all_subscriptions__events.delta: "#FC2E31"
      Net Paid Subscribers - all_subscriptions__events.delta: "#3D52B9"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      Provider: all_subscriptions.provider
    row: 9
    col: 12
    width: 12
    height: 9
  - title: Active Subscriptions
    name: Active Subscriptions
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [all_subscriptions__active.count, all_subscriptions__active.active_date]
    fill_fields: [all_subscriptions__active.active_date]
    sorts: [all_subscriptions__active.active_date desc]
    limit: 500
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
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_colors:
      all_subscriptions__active.count: "#3D52B9"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      Provider: all_subscriptions.provider
    row: 3
    col: 0
    width: 12
    height: 6
  - title: Most Recent Active Subscriptions
    name: Most Recent Active Subscriptions
    model: mozilla_vpn
    explore: subscriptions
    type: single_value
    fields: [all_subscriptions__active.count, all_subscriptions__active.active_date]
    fill_fields: [all_subscriptions__active.active_date]
    sorts: [all_subscriptions__active.active_date desc]
    limit: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      Provider: all_subscriptions.provider
    row: 0
    col: 0
    width: 12
    height: 3
  - title: Active Subscriptions by Start Month
    name: Active Subscriptions by Start Month
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [all_subscriptions__active.count, all_subscriptions__active.active_date, all_subscriptions.start_month]
    pivots: [all_subscriptions.start_month]
    fill_fields: [all_subscriptions__active.active_date, all_subscriptions.start_month]
    sorts: [all_subscriptions__active.active_date desc, all_subscriptions.start_month]
    limit: 500
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      Provider: all_subscriptions.provider
    row: 0
    col: 12
    width: 12
    height: 9
  - title: 7-day Sum of Subscription Events
    name: 7-day Sum of Subscription Events
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [all_subscriptions__events.event_date, all_subscriptions__events.type, all_subscriptions__events.delta]
    pivots: [all_subscriptions__events.type]
    fill_fields: [all_subscriptions__events.event_date]
    filters:
      all_subscriptions.provider: ''
    sorts: [all_subscriptions__events.event_date, all_subscriptions__events.type]
    limit: 500
    dynamic_fields:
    - table_calculation: 7_day_sum
      label: 7-day Sum
      expression: sum(offset_list(${all_subscriptions__events.delta}, -6, 7))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
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
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_colors:
      New - 7_day_sum: "#08B248"
      Cancelled - 7_day_sum: "#FC2E31"
      Net Paid Subscribers - 7_day_sum: "#3D52B9"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [all_subscriptions__events.delta]
    listen: {}
    row: 9
    col: 0
    width: 12
    height: 9
  - title: Active Subscriptions by Attribution
    name: Active Subscriptions by Attribution
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [all_subscriptions__active.count, all_subscriptions__active.active_date, users.attribution_category]
    pivots: [users.attribution_category]
    fill_fields: [all_subscriptions__active.active_date]
    filters:
      all_subscriptions.provider: ''
    sorts: [all_subscriptions__active.active_date desc, users.attribution_category]
    limit: 500
    column_limit: 50
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
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen: {}
    row: 36
    col: 0
    width: 12
    height: 9
  - title: 28-day Sum of New Subscriptions by Attribution
    name: 28-day Sum of New Subscriptions by Attribution
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [all_subscriptions__events.event_date, all_subscriptions__events.delta, users.attribution_category]
    pivots: [users.attribution_category]
    fill_fields: [all_subscriptions__events.event_date]
    filters:
      all_subscriptions.provider: ''
      all_subscriptions__events.type: New
    sorts: [all_subscriptions__events.event_date, users.attribution_category]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: 28_day_sum
      label: 28-day Sum
      expression: sum(offset_list(${all_subscriptions__events.delta}, -27, 28))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
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
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen: {}
    row: 27
    col: 0
    width: 12
    height: 9
  - title: 28-day Sum of New Subscriptions by Coarse Attribution
    name: 28-day Sum of New Subscriptions by Coarse Attribution
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [all_subscriptions__events.event_date, all_subscriptions__events.delta, users.coarse_attribution_category]
    pivots: [users.coarse_attribution_category]
    fill_fields: [all_subscriptions__events.event_date]
    filters:
      all_subscriptions.provider: ''
      all_subscriptions__events.type: New
    sorts: [all_subscriptions__events.event_date, users.coarse_attribution_category]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: 28_day_sum
      label: 28-day Sum
      expression: sum(offset_list(${all_subscriptions__events.delta}, -27, 28))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
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
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen: {}
    row: 27
    col: 12
    width: 12
    height: 9
  - title: Speedy Renewal Rates (1 Day Lag)
    name: Speedy Renewal Rates (1 Day Lag)
    model: mozilla_vpn
    explore: subscriptions
    type: single_value
    fields: [renewal_rates]
    sorts: [renewal_rates]
    dynamic_fields:
    - dimension: renewal_rates
      label: Renewal Rates
      expression: '"Renewal Rates"'
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      Provider: all_subscriptions.provider
    row: 45
    col: 0
    width: 12
    height: 9
  - title: Conversion Rates
    name: Conversion Rates
    model: mozilla_vpn
    explore: subscriptions
    type: single_value
    fields: [converstion_rates]
    limit: 500
    dynamic_fields:
    - dimension: converstion_rates
      label: Conversion Rates
      expression: '"Conversion Rates"'
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      Provider: all_subscriptions.provider
    row: 18
    col: 0
    width: 12
    height: 9
  - title: Average Devices per User
    name: Average Devices per User
    model: mozilla_vpn
    explore: subscriptions
    type: single_value
    fields: [average_devices]
    sorts: [average_devices]
    dynamic_fields:
    - dimension: average_devices
      label: Average Devices
      expression: '"Average Devices"'
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    row: 36
    col: 12
    width: 12
    height: 9
  filters:
  - name: Provider
    title: Provider
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: all_subscriptions.provider
