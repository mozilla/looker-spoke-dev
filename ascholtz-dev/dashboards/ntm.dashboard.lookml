- dashboard: ntm_test
  title: NtM test
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: Numbers
    title: Numbers
    merged_queries:
    - model: ntm
      explore: install
      type: table
      fields: [install.submission_timestamp_date, install.new_installs, country_buckets.bucket]
      sorts: [install.submission_timestamp_date desc]
      limit: 500
    - model: ntm
      explore: new_profile
      type: table
      fields: [new_profile.new_profiles, new_profile.submission_timestamp_date, country_buckets.bucket]
      sorts: [new_profile.submission_timestamp_date desc]
      limit: 500
      join_fields:
      - field_name: new_profile.submission_timestamp_date
        source_field_name: install.submission_timestamp_date
      - field_name: country_buckets.bucket
        source_field_name: country_buckets.bucket
    - model: ntm
      explore: session
      type: table
      fields: [session.date_date, session.total_non_fx_downloads, session.total_non_fx_sessions,
        country_buckets.bucket]
      sorts: [session.date_date desc]
      limit: 500
      join_fields:
      - field_name: session.date_date
        source_field_name: install.submission_timestamp_date
      - field_name: country_buckets.bucket
        source_field_name: country_buckets.bucket
    - model: ntm
      explore: activation
      type: table
      fields: [activation.activations, activation.submission_timestamp_date, country_buckets.bucket]
      sorts: [activation.submission_timestamp_date desc]
      limit: 500
      join_fields:
      - field_name: activation.submission_timestamp_date
        source_field_name: install.submission_timestamp_date
      - field_name: country_buckets.bucket
        source_field_name: country_buckets.bucket
    - model: ntm
      explore: releases
      type: table
      fields: [releases.version, releases.date_date]
      filters:
        releases.category: major
      sorts: [releases.version]
      limit: 500
      join_fields:
      - field_name: releases.date_date
        source_field_name: install.submission_timestamp_date
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: install.new_installs,
            id: install.new_installs, name: New Installs}, {axisId: new_profile.new_profiles,
            id: new_profile.new_profiles, name: New Profiles}, {axisId: session.total_non_fx_downloads,
            id: session.total_non_fx_downloads, name: Total Non Fx Downloads}, {axisId: session.total_non_fx_sessions,
            id: session.total_non_fx_sessions, name: Total Non Fx Sessions}, {axisId: activation.activations,
            id: activation.activations, name: Activations}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: release, id: release,
            name: Release}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types:
      install.new_installs: line
      new_profile.new_profiles: line
      session.total_non_fx_downloads: line
      session.total_non_fx_sessions: line
      activation.activations: line
    point_style: none
    series_colors:
      release: "#909494"
      install.new_installs: "#E52592"
      new_profile.new_profiles: "#E8710A"
      session.total_non_fx_downloads: "#12B5CB"
      session.total_non_fx_sessions: "#1A73E8"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    column_group_spacing_ratio: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    type: looker_column
    hidden_fields: [releases.version, country_buckets.bucket]
    dynamic_fields: [{table_calculation: release, label: Release, expression: 'if(is_null(${releases.version}),
          null, ${session.total_non_fx_sessions} / ${session.total_non_fx_sessions})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: install.date
      Countries: country_buckets.bucket
      Shift N Days: install.date_shift
    - Date Range: new_profile.date
      Countries: country_buckets.bucket
      Shift N Days: new_profile.date_shift
    - Date Range: session.date
      Countries: country_buckets.bucket
      Shift N Days: session.date_shift
    - Date Range: activation.date
      Countries: country_buckets.bucket
      Shift N Days: activation.date_shift
    -
    row: 8
    col: 8
    width: 13
    height: 7
  - name: Rates
    title: Rates
    merged_queries:
    - model: ntm
      explore: session
      type: looker_line
      fields: [session.date_date, session.total_non_fx_downloads, session.total_non_fx_sessions,
        country_buckets.bucket]
      sorts: [session.date_date desc]
      limit: 500
      dynamic_fields: [{table_calculation: download_rate, label: Download Rate, expression: "${session.total_non_fx_downloads}\
            \ / ${session.total_non_fx_sessions} ", value_format: !!null '', value_format_name: !!null '',
          is_disabled: false, _kind_hint: measure, _type_hint: number}]
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
      y_axes: [{label: '', orientation: left, series: [{axisId: download_rate, id: download_rate,
              name: Download Rate}], showLabels: true, showValues: true, valueFormat: "#%",
          unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
      series_types: {}
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      hidden_fields: [session.total_non_fx_downloads, session.total_non_fx_sessions]
    - model: ntm
      explore: install
      type: table
      fields: [install.new_installs, install.submission_timestamp_date, country_buckets.bucket]
      sorts: [install.submission_timestamp_date desc]
      limit: 500
      join_fields:
      - field_name: install.submission_timestamp_date
        source_field_name: session.date_date
      - field_name: country_buckets.bucket
        source_field_name: country_buckets.bucket
    - model: ntm
      explore: new_profile
      type: table
      fields: [new_profile.new_profiles, new_profile.submission_timestamp_date, country_buckets.bucket]
      limit: 500
      join_fields:
      - field_name: new_profile.submission_timestamp_date
        source_field_name: session.date_date
      - field_name: country_buckets.bucket
        source_field_name: country_buckets.bucket
    - model: ntm
      explore: activation
      type: table
      fields: [activation.submission_timestamp_date, activation.activations, country_buckets.bucket]
      limit: 500
      join_fields:
      - field_name: activation.submission_timestamp_date
        source_field_name: session.date_date
      - field_name: country_buckets.bucket
        source_field_name: country_buckets.bucket
    - model: ntm
      explore: releases
      type: table
      fields: [releases.version, releases.date_date]
      filters:
        releases.category: major
      sorts: [releases.version]
      limit: 500
      join_fields:
      - field_name: releases.date_date
        source_field_name: session.date_date
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: download_rate, id: download_rate,
            name: Download Rate}, {axisId: installation_rate, id: installation_rate,
            name: Installation Rate}, {axisId: first_run_rate, id: first_run_rate,
            name: First Run Rate}, {axisId: activation_rate, id: activation_rate,
            name: Activation Rate}], showLabels: true, showValues: true, valueFormat: "#%",
        unpinAxis: false, tickDensity: default, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: release, id: release, name: Release}],
        showLabels: false, showValues: false, valueFormat: "#%", unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types:
      download_rate: line
      installation_rate: line
      first_run_rate: line
      activation_rate: line
    point_style: none
    series_colors:
      release: "#80868B"
      download_rate: "#12B5CB"
      installation_rate: "#E52592"
      first_run_rate: "#E8710A"
      activation_rate: "#F9AB00"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    column_spacing_ratio: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    hidden_fields: [install.new_installs, session.total_non_fx_sessions, session.total_non_fx_downloads,
      new_profile.new_profiles, activation.activations, releases.version, country_buckets.bucket]
    type: looker_column
    sorts: [country_buckets.bucket desc]
    dynamic_fields: [{table_calculation: installation_rate, label: Installation Rate,
        expression: "${install.new_installs} / ${session.total_non_fx_sessions}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: first_run_rate, label: First Run
          Rate, expression: "${new_profile.new_profiles} / ${session.total_non_fx_sessions}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: activation_rate, label: Activation
          Rate, expression: "${activation.activations} / ${session.total_non_fx_sessions}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: release, label: Release, expression: 'if(is_null(${releases.version}),
          null, ${session.total_non_fx_sessions} / ${session.total_non_fx_sessions})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: session.date
      Countries: country_buckets.bucket
      Shift N Days: session.date_shift
    - Date Range: install.date
      Countries: country_buckets.bucket
      Shift N Days: install.date_shift
    - Date Range: new_profile.date
      Countries: country_buckets.bucket
      Shift N Days: new_profile.date_shift
    - Date Range: activation.date
      Countries: country_buckets.bucket
      Shift N Days: activation.date_shift
    -
    row: 15
    col: 8
    width: 13
    height: 7
  - name: Funnel Overview
    title: Funnel Overview
    merged_queries:
    - model: ntm
      explore: session
      type: looker_funnel
      fields: [session.total_non_fx_sessions, session.total_non_fx_downloads, merge_field]
      sorts: [session.total_non_fx_sessions desc]
      limit: 500
      dynamic_fields: [{dimension: merge_field, label: merge field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
      leftAxisLabelVisible: false
      leftAxisLabel: ''
      rightAxisLabelVisible: false
      rightAxisLabel: ''
      smoothedBars: true
      orientation: rows
      labelPosition: left
      percentType: total
      percentPosition: inline
      valuePosition: Hidden
      labelColorEnabled: false
      labelColor: "#FFF"
      color_application:
        collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
        palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
        options:
          steps: 5
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
      defaults_version: 1
      series_types: {}
    - model: ntm
      explore: install
      type: table
      fields: [merge_field, install.new_installs]
      limit: 500
      dynamic_fields: [{dimension: merge_field, label: merge field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
      join_fields:
      - field_name: merge_field
        source_field_name: merge_field
    - model: ntm
      explore: new_profile
      type: table
      fields: [new_profile.new_profiles, merge_field]
      limit: 500
      dynamic_fields: [{dimension: merge_field, label: merge field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
      join_fields:
      - field_name: merge_field
        source_field_name: merge_field
    - model: ntm
      explore: activation
      type: table
      fields: [activation.activations, merge_field]
      limit: 500
      dynamic_fields: [{dimension: merge_field, label: merge field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
      join_fields:
      - field_name: merge_field
        source_field_name: merge_field
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    hidden_fields: [merge_field]
    type: looker_funnel
    series_types: {}
    listen:
    - Date Range: session.date
      Countries: country_buckets.bucket
      Shift N Days: session.date_shift
    - Date Range: install.date
      Countries: country_buckets.bucket
      Shift N Days: install.date_shift
    - Date Range: new_profile.date
      Countries: country_buckets.bucket
      Shift N Days: new_profile.date_shift
    - Date Range: activation.date
      Countries: country_buckets.bucket
      Shift N Days: activation.date_shift
    row: 8
    col: 0
    width: 8
    height: 14
  - name: New Installs
    title: New Installs
    merged_queries:
    - model: ntm
      explore: install
      type: table
      fields: [install.new_installs, join_field]
      sorts: [install.new_installs desc]
      limit: 500
      dynamic_fields: [{dimension: join_field, label: Join Field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
    - model: ntm
      explore: install
      type: table
      fields: [install.new_installs, join_field]
      filters:
        install.previous_time_period: 'Yes'
      sorts: [install.new_installs desc]
      limit: 500
      dynamic_fields: [{dimension: join_field, label: Join Field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
      join_fields:
      - field_name: join_field
        source_field_name: join_field
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: New Installs
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "% From Previous Time Period"
    enable_conditional_formatting: true
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [q1_install.new_installs, join_field]
    dynamic_fields: [{table_calculation: from_previous, label: From Previous, expression: 'round((1
          - ${q1_install.new_installs} / ${install.new_installs}) * 100, 1)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    listen:
    - Date Range: install.date
      Countries: country_buckets.bucket
      Shift N Days: install.date_shift
    - Date Range: install.date
      Countries: country_buckets.bucket
      Shift N Days: install.date_shift
    row: 0
    col: 14
    width: 7
    height: 4
  - name: Re-Installs
    title: Re-Installs
    merged_queries:
    - model: ntm
      explore: install
      type: table
      fields: [install.paveovers, join_field]
      limit: 500
      dynamic_fields: [{dimension: join_field, label: Join Field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
    - model: ntm
      explore: install
      type: table
      fields: [install.paveovers, join_field]
      filters:
        install.previous_time_period: 'Yes'
      limit: 500
      dynamic_fields: [{dimension: join_field, label: Join Field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
      join_fields:
      - field_name: join_field
        source_field_name: join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "% From Previous Time Period"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [q1_install.paveovers]
    series_types: {}
    type: single_value
    dynamic_fields: [{table_calculation: from_previous, label: From Previous, expression: 'round((1-${q1_install.paveovers}/${install.paveovers})
          * 100, 1)', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: install.date
      Countries: country_buckets.bucket
      Shift N Days: install.date_shift
    - Date Range: install.date
      Countries: country_buckets.bucket
      Shift N Days: install.date_shift
    row: 4
    col: 0
    width: 7
    height: 4
  - name: First Runs
    title: First Runs
    merged_queries:
    - model: ntm
      explore: new_profile
      type: table
      fields: [new_profile.new_profiles, join_field]
      sorts: [new_profile.new_profiles desc]
      limit: 500
      dynamic_fields: [{dimension: join_field, label: Join Field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
    - model: ntm
      explore: new_profile
      type: table
      fields: [new_profile.new_profiles, join_field]
      filters:
        new_profile.previous_time_period: 'Yes'
      limit: 500
      dynamic_fields: [{dimension: join_field, label: Join Field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
      join_fields:
      - field_name: join_field
        source_field_name: join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "% From Previous Time Period"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [join_field, q1_new_profile.new_profiles]
    series_types: {}
    type: single_value
    dynamic_fields: [{table_calculation: from_previous, label: From Previous, expression: 'round((1
          - ${q1_new_profile.new_profiles} / ${new_profile.new_profiles}) * 100, 1)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: new_profile.date
      Countries: country_buckets.bucket
      Shift N Days: new_profile.date_shift
    - Date Range: new_profile.date
      Countries: country_buckets.bucket
      Shift N Days: new_profile.date_shift
    row: 4
    col: 7
    width: 7
    height: 4
  - name: Downloads
    title: Downloads
    merged_queries:
    - model: ntm
      explore: session
      type: table
      fields: [join_field, session.total_non_fx_downloads]
      limit: 500
      dynamic_fields: [{dimension: join_field, label: Join Field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
    - model: ntm
      explore: session
      type: table
      fields: [session.total_non_fx_downloads, join_field]
      filters:
        session.previous_time_period: 'Yes'
      limit: 500
      dynamic_fields: [{dimension: join_field, label: Join Field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
      join_fields:
      - field_name: join_field
        source_field_name: join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "% From Previous Time Period"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [q1_session.total_non_fx_downloads, join_field]
    type: single_value
    series_types: {}
    dynamic_fields: [{table_calculation: from_previous, label: From Previous, expression: 'round((1
          - ${q1_session.total_non_fx_downloads} / ${session.total_non_fx_downloads})
          * 100, 1)', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: session.date
      Countries: country_buckets.bucket
      Shift N Days: session.date_shift
    - Date Range: session.date
      Countries: country_buckets.bucket
      Shift N Days: session.date_shift
    row: 0
    col: 7
    width: 7
    height: 4
  - name: Visits
    title: Visits
    merged_queries:
    - model: ntm
      explore: session
      type: table
      fields: [session.total_non_fx_sessions, join_field]
      limit: 500
      dynamic_fields: [{dimension: join_field, label: Join Field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
    - model: ntm
      explore: session
      type: table
      fields: [session.total_non_fx_sessions, join_field]
      filters:
        session.previous_time_period: 'Yes'
      limit: 500
      dynamic_fields: [{dimension: join_field, label: Join Field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
      join_fields:
      - field_name: join_field
        source_field_name: join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "% From Previous Time Period"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [join_field, q1_session.total_non_fx_sessions]
    type: single_value
    series_types: {}
    dynamic_fields: [{table_calculation: from_previous, label: From Previous, expression: 'round((1
          - ${q1_session.total_non_fx_sessions} / ${session.total_non_fx_sessions})
          * 100, 1)', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: session.date
      Countries: country_buckets.bucket
      Shift N Days: session.date_shift
    - Date Range: session.date
      Countries: country_buckets.bucket
      Shift N Days: session.date_shift
    row: 0
    col: 0
    width: 7
    height: 4
  - name: 7 Day Activated
    title: 7 Day Activated
    merged_queries:
    - model: ntm
      explore: activation
      type: table
      fields: [activation.activations, join_field]
      limit: 500
      dynamic_fields: [{dimension: join_field, label: Join Field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
    - model: ntm
      explore: activation
      type: table
      fields: [join_field, activation.activations]
      filters:
        activation.previous_time_period: 'Yes'
      limit: 500
      dynamic_fields: [{dimension: join_field, label: Join Field, expression: 'yes',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: yesno}]
      join_fields:
      - field_name: join_field
        source_field_name: join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "% From Previous Time Period"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [join_field, q1_activation.activations]
    series_types: {}
    type: single_value
    dynamic_fields: [{table_calculation: from_previous, label: From Previous, expression: 'round((1
          - ${q1_activation.activations} / ${activation.activations}) * 100, 1)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: activation.date
      Countries: country_buckets.bucket
      Shift N Days: activation.date_shift
    - Date Range: activation.date
      Countries: country_buckets.bucket
      Shift N Days: activation.date_shift
    row: 4
    col: 14
    width: 7
    height: 4
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 28 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: ntm
    explore: new_profile
    listens_to_filters: []
    field: new_profile.submission_timestamp_date
  - name: Countries
    title: Countries
    type: string_filter
    default_value: Overall
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Overall
      - non-tier-1
      - tier-1
      - US
      - CA
      - DE
      - MX
      - FR
      - CN
      - UK
      - BR
  - name: Shift N Days
    title: Shift N Days
    type: field_filter
    default_value: '8'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - '1'
      - '2'
      - '3'
    model: ntm
    explore: install
    listens_to_filters: []
    field: install.date_shift
