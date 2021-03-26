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
      fields: [install.submission_timestamp_date, install.new_installs]
      fill_fields: [install.submission_timestamp_date]
      sorts: [install.submission_timestamp_date desc]
      limit: 500
    - model: ntm
      explore: new_profile
      type: table
      fields: [new_profile.new_profiles, new_profile.submission_timestamp_date]
      fill_fields: [new_profile.submission_timestamp_date]
      sorts: [new_profile.submission_timestamp_date desc]
      limit: 500
      join_fields:
      - field_name: new_profile.submission_timestamp_date
        source_field_name: install.submission_timestamp_date
    type: looker_line
    listen:
    - Countries: country_buckets.bucket
      Submission Timestamp Date: install.submission_timestamp_date
    - Submission Timestamp Date: new_profile.submission_timestamp_date
    row: 3
    col: 0
    width: 18
    height: 8
  - title: New Profiles
    name: New Profiles
    model: ntm
    explore: new_profile
    type: looker_line
    fields: [new_profile.new_profiles, new_profile.submission_timestamp_date]
    fill_fields: [new_profile.submission_timestamp_date]
    sorts: [new_profile.submission_timestamp_date desc]
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
    defaults_version: 1
    listen:
      Submission Timestamp Date: new_profile.submission_timestamp_date
    row: 11
    col: 0
    width: 6
    height: 4
  - title: New Installs
    name: New Installs
    model: ntm
    explore: install
    type: single_value
    fields: [install.new_installs, install.paveovers]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Countries: country_buckets.bucket
      Submission Timestamp Date: install.submission_timestamp_date
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Installs
    name: Installs
    model: ntm
    explore: install
    type: looker_line
    fields: [install.submission_timestamp_date, install.new_installs]
    fill_fields: [install.submission_timestamp_date]
    sorts: [install.submission_timestamp_date desc]
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
    defaults_version: 1
    listen:
      Countries: country_buckets.bucket
      Submission Timestamp Date: install.submission_timestamp_date
    row: 11
    col: 6
    width: 6
    height: 4
  - title: Re-installs
    name: Re-installs
    model: ntm
    explore: install
    type: single_value
    fields: [install.paveovers]
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
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: A person who downloaded Firefox from the website using a non-Firefox
      browser installs over an existing installation of Firefox.
    listen:
      Submission Timestamp Date: install.submission_timestamp_date
    row: 0
    col: 6
    width: 6
    height: 3
  filters:
  - name: Submission Timestamp Date
    title: Submission Timestamp Date
    type: field_filter
    default_value: 7 day
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
