# - dashboard: ntm_test
#   title: NtM test
#   layout: newspaper
#   preferred_viewer: dashboards-next
#   elements:
#   - name: Numbers
#     title: Numbers
#     merged_queries:
#     - model: ntm
#       explore: install
#       type: table
#       fields: [install.submission_timestamp_date, install.new_installs]
#       fill_fields: [install.submission_timestamp_date]
#       sorts: [install.submission_timestamp_date desc]
#       limit: 500
#     - model: ntm
#       explore: new_profile
#       type: table
#       fields: [new_profile.new_profiles, new_profile.submission_timestamp_date]
#       fill_fields: [new_profile.submission_timestamp_date]
#       sorts: [new_profile.submission_timestamp_date desc]
#       limit: 500
#       join_fields:
#       - field_name: new_profile.submission_timestamp_date
#         source_field_name: install.submission_timestamp_date
#     - model: ntm
#       explore: session
#       type: table
#       fields: [session.date_date, session.total_non_fx_downloads, session.total_non_fx_sessions]
#       fill_fields: [session.date_date]
#       sorts: [session.date_date desc]
#       limit: 500
#       join_fields:
#       - field_name: session.date_date
#         source_field_name: install.submission_timestamp_date
#     - model: ntm
#       explore: activation
#       type: table
#       fields: [activation.activations, activation.submission_timestamp_date]
#       fill_fields: [activation.submission_timestamp_date]
#       sorts: [activation.submission_timestamp_date desc]
#       limit: 500
#       join_fields:
#       - field_name: activation.submission_timestamp_date
#         source_field_name: install.submission_timestamp_date
#     type: looker_line
#     listen:
#     - Countries: country_buckets.bucket
#       Submission Timestamp Date: install.submission_timestamp_date
#     - Countries: country_buckets.bucket
#       Submission Timestamp Date: new_profile.submission_timestamp_date
#     - Countries: country_buckets.bucket
#       Submission Timestamp Date: session.date_date
#     - Countries: country_buckets.bucket
#       Submission Timestamp Date: activation.submission_timestamp_date
#     row: 3
#     col: 10
#     width: 13
#     height: 8
#   - title: New Profiles
#     name: New Profiles
#     model: ntm
#     explore: new_profile
#     type: looker_line
#     fields: [new_profile.new_profiles, new_profile.submission_timestamp_date]
#     fill_fields: [new_profile.submission_timestamp_date]
#     sorts: [new_profile.submission_timestamp_date desc]
#     limit: 500
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     show_null_points: true
#     interpolation: linear
#     defaults_version: 1
#     listen:
#       Countries: country_buckets.bucket
#       Submission Timestamp Date: new_profile.submission_timestamp_date
#     row: 0
#     col: 12
#     width: 6
#     height: 3
#   - title: New Installs
#     name: New Installs
#     model: ntm
#     explore: install
#     type: single_value
#     fields: [install.new_installs, install.paveovers]
#     limit: 500
#     custom_color_enabled: true
#     show_single_value_title: true
#     show_comparison: true
#     comparison_type: change
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     enable_conditional_formatting: true
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
#         font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
#           palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
#         strikethrough: false, fields: !!null ''}]
#     series_types: {}
#     defaults_version: 1
#     listen:
#       Countries: country_buckets.bucket
#       Submission Timestamp Date: install.submission_timestamp_date
#     row: 0
#     col: 0
#     width: 6
#     height: 3
#   - title: Installs
#     name: Installs
#     model: ntm
#     explore: install
#     type: looker_line
#     fields: [install.submission_timestamp_date, install.new_installs]
#     fill_fields: [install.submission_timestamp_date]
#     sorts: [install.submission_timestamp_date desc]
#     limit: 500
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     show_null_points: true
#     interpolation: linear
#     defaults_version: 1
#     listen:
#       Countries: country_buckets.bucket
#       Submission Timestamp Date: install.submission_timestamp_date
#     row: 0
#     col: 18
#     width: 5
#     height: 3
#   - title: Re-installs
#     name: Re-installs
#     model: ntm
#     explore: install
#     type: single_value
#     fields: [install.paveovers]
#     limit: 500
#     custom_color_enabled: true
#     show_single_value_title: true
#     show_comparison: false
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     enable_conditional_formatting: false
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     series_types: {}
#     defaults_version: 1
#     note_state: collapsed
#     note_display: hover
#     note_text: A person who downloaded Firefox from the website using a non-Firefox
#       browser installs over an existing installation of Firefox.
#     listen:
#       Countries: country_buckets.bucket
#       Submission Timestamp Date: install.submission_timestamp_date
#     row: 0
#     col: 6
#     width: 6
#     height: 3
#   - name: Rates
#     title: Rates
#     merged_queries:
#     - model: ntm
#       explore: session
#       type: looker_line
#       fields: [session.date_date, session.total_non_fx_downloads, session.total_non_fx_sessions]
#       fill_fields: [session.date_date]
#       sorts: [session.date_date desc]
#       limit: 500
#       dynamic_fields: [{table_calculation: download_rate, label: Download Rate, expression: "${session.total_non_fx_downloads}\
#             \ / ${session.total_non_fx_sessions} ", value_format: !!null '', value_format_name: !!null '',
#           is_disabled: false, _kind_hint: measure, _type_hint: number}]
#       x_axis_gridlines: false
#       y_axis_gridlines: true
#       show_view_names: false
#       show_y_axis_labels: true
#       show_y_axis_ticks: true
#       y_axis_tick_density: default
#       y_axis_tick_density_custom: 5
#       show_x_axis_label: true
#       show_x_axis_ticks: true
#       y_axis_scale_mode: linear
#       x_axis_reversed: false
#       y_axis_reversed: false
#       plot_size_by_field: false
#       trellis: ''
#       stacking: ''
#       limit_displayed_rows: false
#       legend_position: center
#       point_style: none
#       show_value_labels: false
#       label_density: 25
#       x_axis_scale: auto
#       y_axis_combined: true
#       show_null_points: true
#       interpolation: linear
#       y_axes: [{label: '', orientation: left, series: [{axisId: download_rate, id: download_rate,
#               name: Download Rate}], showLabels: true, showValues: true, valueFormat: "#%",
#           unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
#       series_types: {}
#       ordering: none
#       show_null_labels: false
#       show_totals_labels: false
#       show_silhouette: false
#       totals_color: "#808080"
#       defaults_version: 1
#       hidden_fields: [session.total_non_fx_downloads, session.total_non_fx_sessions]
#     - model: ntm
#       explore: install
#       type: table
#       fields: [install.new_installs, install.submission_timestamp_date]
#       fill_fields: [install.submission_timestamp_date]
#       sorts: [install.submission_timestamp_date desc]
#       limit: 500
#       join_fields:
#       - field_name: install.submission_timestamp_date
#         source_field_name: session.date_date
#     - model: ntm
#       explore: new_profile
#       type: table
#       fields: [new_profile.new_profiles, new_profile.submission_timestamp_date]
#       fill_fields: [new_profile.submission_timestamp_date]
#       limit: 500
#       join_fields:
#       - field_name: new_profile.submission_timestamp_date
#         source_field_name: session.date_date
#     - model: ntm
#       explore: activation
#       type: table
#       fields: [activation.submission_timestamp_date, activation.activations]
#       fill_fields: [activation.submission_timestamp_date]
#       limit: 500
#       join_fields:
#       - field_name: activation.submission_timestamp_date
#         source_field_name: session.date_date
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     y_axes: [{label: '', orientation: left, series: [{axisId: download_rate, id: download_rate,
#             name: Download Rate}, {axisId: installation_rate, id: installation_rate,
#             name: Installation Rate}], showLabels: true, showValues: true, valueFormat: "#%",
#         unpinAxis: false, tickDensity: default, type: linear}]
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     show_null_points: true
#     interpolation: linear
#     hidden_fields: [install.new_installs, session.total_non_fx_sessions, session.total_non_fx_downloads,
#       new_profile.new_profiles, activation.activations]
#     type: looker_line
#     dynamic_fields: [{table_calculation: installation_rate, label: Installation Rate,
#         expression: "${install.new_installs} / ${session.total_non_fx_sessions}",
#         value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
#         _type_hint: number}, {table_calculation: first_run_rate, label: First Run
#           Rate, expression: "${new_profile.new_profiles} / ${session.total_non_fx_sessions}",
#         value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
#         _type_hint: number}, {table_calculation: activation_rate, label: Activation
#           Rate, expression: "${activation.activations} / ${session.total_non_fx_sessions}",
#         value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
#         _type_hint: number}]
#     listen:
#     - Countries: country_buckets.bucket
#       Submission Timestamp Date: session.date_date
#     - Countries: country_buckets.bucket
#       Submission Timestamp Date: install.submission_timestamp_date
#     - Countries: country_buckets.bucket
#       Submission Timestamp Date: new_profile.submission_timestamp_date
#     - Countries: country_buckets.bucket
#       Submission Timestamp Date: activation.submission_timestamp_date
#     row: 11
#     col: 10
#     width: 13
#     height: 7
#   - name: Funnel Overview
#     title: Funnel Overview
#     merged_queries:
#     - model: ntm
#       explore: session
#       type: looker_funnel
#       fields: [session.total_non_fx_sessions, session.total_non_fx_downloads, merge_field]
#       sorts: [session.total_non_fx_sessions desc]
#       limit: 500
#       dynamic_fields: [{dimension: merge_field, label: merge field, expression: 'yes',
#           value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
#           _type_hint: yesno}]
#       leftAxisLabelVisible: false
#       leftAxisLabel: ''
#       rightAxisLabelVisible: false
#       rightAxisLabel: ''
#       smoothedBars: true
#       orientation: rows
#       labelPosition: left
#       percentType: total
#       percentPosition: inline
#       valuePosition: Hidden
#       labelColorEnabled: false
#       labelColor: "#FFF"
#       color_application:
#         collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
#         palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
#         options:
#           steps: 5
#       x_axis_gridlines: false
#       y_axis_gridlines: true
#       show_view_names: false
#       show_y_axis_labels: true
#       show_y_axis_ticks: true
#       y_axis_tick_density: default
#       y_axis_tick_density_custom: 5
#       show_x_axis_label: true
#       show_x_axis_ticks: true
#       y_axis_scale_mode: linear
#       x_axis_reversed: false
#       y_axis_reversed: false
#       plot_size_by_field: false
#       trellis: ''
#       stacking: ''
#       limit_displayed_rows: false
#       legend_position: center
#       point_style: none
#       show_value_labels: false
#       label_density: 25
#       x_axis_scale: auto
#       y_axis_combined: true
#       ordering: none
#       show_null_labels: false
#       show_totals_labels: false
#       show_silhouette: false
#       totals_color: "#808080"
#       defaults_version: 1
#       series_types: {}
#     - model: ntm
#       explore: install
#       type: table
#       fields: [merge_field, install.new_installs]
#       limit: 500
#       dynamic_fields: [{dimension: merge_field, label: merge field, expression: 'yes',
#           value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
#           _type_hint: yesno}]
#       join_fields:
#       - field_name: merge_field
#         source_field_name: merge_field
#     - model: ntm
#       explore: new_profile
#       type: table
#       fields: [new_profile.new_profiles, merge_field]
#       limit: 500
#       dynamic_fields: [{dimension: merge_field, label: merge field, expression: 'yes',
#           value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
#           _type_hint: yesno}]
#       join_fields:
#       - field_name: merge_field
#         source_field_name: merge_field
#     - model: ntm
#       explore: activation
#       type: table
#       fields: [activation.activations, merge_field]
#       limit: 500
#       dynamic_fields: [{dimension: merge_field, label: merge field, expression: 'yes',
#           value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
#           _type_hint: yesno}]
#       join_fields:
#       - field_name: merge_field
#         source_field_name: merge_field
#     leftAxisLabelVisible: false
#     leftAxisLabel: ''
#     rightAxisLabelVisible: false
#     rightAxisLabel: ''
#     color_application:
#       collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
#       palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
#       options:
#         steps: 5
#     smoothedBars: true
#     orientation: automatic
#     labelPosition: left
#     percentType: total
#     percentPosition: inline
#     valuePosition: right
#     labelColorEnabled: false
#     labelColor: "#FFF"
#     hidden_fields: [merge_field]
#     type: looker_funnel
#     series_types: {}
#     listen:
#     - Countries: country_buckets.bucket
#       Submission Timestamp Date: session.date_date
#     - Countries: country_buckets.bucket
#       Submission Timestamp Date: install.submission_timestamp_date
#     - Countries: country_buckets.bucket
#       Submission Timestamp Date: new_profile.submission_timestamp_date
#     - Countries: country_buckets.bucket
#       Submission Timestamp Date: activation.submission_timestamp_date
#     row: 3
#     col: 0
#     width: 10
#     height: 15
#   filters:
#   - name: Countries
#     title: Countries
#     type: string_filter
#     default_value: Overall
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: dropdown_menu
#       display: inline
#       options:
#       - Overall
#       - non-tier-1
#       - tier-1
#       - US
#       - CA
#       - DE
#       - MX
#       - FR
#       - CN
#       - UK
#       - BR
