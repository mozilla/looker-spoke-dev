- dashboard: mozilla_vpn_redux
  title: Mozilla VPN
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 1 day
  elements:
  - title: Granular Subscription Events
    name: Granular Subscription Events
    model: mozilla_vpn
    explore: combined_subscriptions
    type: looker_line
    fields: [events.event_date, events.delta, events.granular_type]
    pivots: [events.granular_type]
    fill_fields: [events.event_date]
    sorts: [events.event_date desc, events.granular_type]
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
      subscription_periods_.cancelled: "#FC2E31"
      subscription_periods_.new: "#08B248"
      New - events.delta: "#08B248"
      Cancelled - events.delta: "#FC2E31"
      Net Paid Subscribers - events.delta: "#3D52B9"
      Resurrected - events.delta: "#C9DC10"
      Cancelled by Customer - events.delta: "#FC2E31"
      Cancelled by IAP - events.delta: "#fa2f90"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      Provider: subscription_periods.provider
    row: 9
    col: 12
    width: 12
    height: 9
  - title: Subscription Events
    name: Subscription Events
    model: mozilla_vpn
    explore: combined_subscriptions
    type: looker_line
    fields: [events.event_date, events.delta, events.type]
    pivots: [events.type]
    fill_fields: [events.event_date]
    sorts: [events.event_date desc, events.type]
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
      subscription_periods_.cancelled: "#FC2E31"
      subscription_periods_.new: "#08B248"
      New - events.delta: "#08B248"
      Cancelled - events.delta: "#FC2E31"
      Net Paid Subscribers - events.delta: "#3D52B9"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      Provider: subscription_periods.provider
    row: 0
    col: 12
    width: 12
    height: 9
  - title: Active Subscriptions
    name: Active Subscriptions
    model: mozilla_vpn
    explore: combined_subscriptions
    type: looker_line
    fields: [active.active_count, active.active_date]
    fill_fields: [active.active_date]
    sorts: [active.active_date desc]
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
      subscription_periods_.cancelled: "#FC2E31"
      subscription_periods_.new: "#08B248"
      New - events.delta: "#08B248"
      Cancelled - events.delta: "#FC2E31"
      Net Paid Subscribers - events.delta: "#3D52B9"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      Provider: subscription_periods.provider
    row: 3
    col: 0
    width: 12
    height: 6
  - title: Most Recent Active Subscriptions
    name: Most Recent Active Subscriptions
    model: mozilla_vpn
    explore: combined_subscriptions
    type: single_value
    fields: [active.active_count, active.active_date]
    fill_fields: [active.active_date]
    sorts: [active.active_date desc]
    limit: 500
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
    series_colors:
      subscription_periods_.cancelled: "#FC2E31"
      subscription_periods_.new: "#08B248"
      New - events.delta: "#08B248"
      Cancelled - events.delta: "#FC2E31"
      Net Paid Subscribers - events.delta: "#3D52B9"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      Provider: subscription_periods.provider
    row: 0
    col: 0
    width: 12
    height: 3
  - title: Active Subscriptions by Start Month
    name: Active Subscriptions by Start Month
    model: mozilla_vpn
    explore: combined_subscriptions
    type: looker_line
    fields: [active.active_count, active.active_date, subscription_periods.start_month]
    pivots: [subscription_periods.start_month]
    fill_fields: [active.active_date, subscription_periods.start_month]
    sorts: [active.active_date desc, subscription_periods.start_month]
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
    series_colors:
      subscription_periods_.cancelled: "#FC2E31"
      subscription_periods_.new: "#08B248"
      New - events.delta: "#08B248"
      Cancelled - events.delta: "#FC2E31"
      Net Paid Subscribers - events.delta: "#3D52B9"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    listen:
      Provider: subscription_periods.provider
    row: 9
    col: 0
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
    explore: combined_subscriptions
    listens_to_filters: []
    field: subscription_periods.provider
