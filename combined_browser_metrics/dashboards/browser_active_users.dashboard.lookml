---
- dashboard: browser_active_users
  title: Browser Active Users
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  refresh: 1 hour
  preferred_slug: Qeuimt5jWZV6p5ePAcGUQo
  elements:
  - title: Mobile DAU (Fenix, Firefox iOS, Focus Android, Focus iOS)
    name: Mobile DAU (Fenix, Firefox iOS, Focus Android, Focus iOS)
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.daily_active_users, active_users_aggregates.submission_date]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Fenix,Firefox iOS,Focus Android,Focus iOS
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: active_users_aggregates.daily_active_users,
            id: active_users_aggregates.daily_active_users, name: DAU}, {axisId: dau_28_day_moving_average,
            id: dau_28_day_moving_average, name: DAU 28-Day Moving Average}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#9059FF"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    listen: {}
    row: 16
    col: 0
    width: 12
    height: 6
  - title: Desktop DAU
    name: Desktop DAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.daily_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Firefox Desktop
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: active_users_aggregates.daily_active_users,
            id: active_users_aggregates.daily_active_users, name: DAU}, {axisId: dau_28_day_moving_average,
            id: dau_28_day_moving_average, name: DAU 28-Day Moving Average}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#FF7139"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients that have at least one mouse/keyboard interaction and visit at least one URI.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 10
    col: 0
    width: 12
    height: 6
  - title: Fenix DAU
    name: Fenix DAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.daily_active_users, active_users_aggregates.submission_date]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Fenix
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: active_users_aggregates.daily_active_users,
            id: active_users_aggregates.daily_active_users, name: DAU}, {axisId: dau_28_day_moving_average,
            id: dau_28_day_moving_average, name: DAU 28-Day Moving Average}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#3FE1B0"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    listen: {}
    row: 22
    col: 0
    width: 12
    height: 6
  - title: Firefox iOS DAU
    name: Firefox iOS DAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.daily_active_users, active_users_aggregates.submission_date]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Firefox iOS
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: active_users_aggregates.daily_active_users,
            id: active_users_aggregates.daily_active_users, name: DAU}, {axisId: dau_28_day_moving_average,
            id: dau_28_day_moving_average, name: DAU 28-Day Moving Average}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#0060E0"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    listen: {}
    row: 28
    col: 0
    width: 12
    height: 6
  - title: Focus iOS DAU
    name: Focus iOS DAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.daily_active_users, active_users_aggregates.submission_date]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Focus iOS
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: active_users_aggregates.daily_active_users,
            id: active_users_aggregates.daily_active_users, name: DAU}, {axisId: dau_28_day_moving_average,
            id: dau_28_day_moving_average, name: DAU 28-Day Moving Average}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#073072"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    listen: {}
    row: 40
    col: 0
    width: 12
    height: 6
  - title: Focus Android DAU
    name: Focus Android DAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.daily_active_users, active_users_aggregates.submission_date]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Focus Android
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: active_users_aggregates.daily_active_users,
            id: active_users_aggregates.daily_active_users, name: DAU}, {axisId: dau_28_day_moving_average,
            id: dau_28_day_moving_average, name: DAU 28-Day Moving Average}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#005E5D"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    listen: {}
    row: 34
    col: 0
    width: 12
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-radius:5px;padding:5px;background:#e8e8e8;height: 60px;">

      <nav style="font-size: 15px;">

      <a style="padding:5px 25px; float: left; line-height: 40px; color: #f7f2f2; font-weight: bold; background:#090808; border-radius:5px;" href="https://mozilla.cloud.looker.com/dashboards/1178">
      Browser Active Users
      </a>

      <a style="padding:5px 25px; float: left; line-height: 40px; color: #8a8888;" href="https://mozilla.cloud.looker.com/dashboards/1784">
      Browser Active Users By Geo
      </a>

      <a style="padding:5px 25px; float: left; line-height: 40px; color: #8a8888;" href="https://mozilla.cloud.looker.com/dashboards/1245">
      Browser KPI Forecasts
      </a>


      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div id="top">

      <p style="float: left; font-size: 16px">
      Jump to:
      <a href="https://mozilla.cloud.looker.com/dashboards/1178#dau">
      DAU
      </a> |
      <a href="https://mozilla.cloud.looker.com/dashboards/1178#mau">
      MAU
      </a> |
      <a href="https://mozilla.cloud.looker.com/dashboards/1178#wau">
      WAU
      </a>
      </p>

      <!--
      <a
      style="padding:5px 20px; float: right; line-height: 20px; color: #a646e4; border-radius:5px; border: 1px solid #a646e4; margin: 5px;"
      target="_blank"
      href="https://forms.gle/76nACVQYgnw7FP7s8">
      Dashboard Feedback
      </a>
      -->

      </div>
    row: 6
    col: 0
    width: 24
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div>
      <nav style="font-size: 12px;">

      <a
      style="padding:5px 20px; float: right; line-height: 20px; color: #a646e4; border-radius:5px; border: 1px solid #a646e4; margin: 5px;"
      target="_blank"
      href="https://forms.gle/76nACVQYgnw7FP7s8">
      Dashboard Feedback
      </a>


      </nav>
      </div>
    row: 140
    col: 0
    width: 24
    height: 2
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div id=\"dau\" style=\"display: flex; align-items: center; justify-content:\
      \ space-between; background-color: #333; padding: 0px 20px; border-radius: 5px;\"\
      >\n\n<h2 style=\"color: #FFF\">DAU (Daily Active Users)</h2>\n\n<a\nstyle=\"\
      font-size: 12px; padding: 10px 20px; color: #222; border-radius: 5px; border:\
      \ 1px solid #222; margin: 5px; margin-left: auto; background-color: #FFF;\"\n\
      target=\"_blank\" \nhref=\"https://mozilla-hub.atlassian.net/wiki/spaces/DATA/pages/314704478/Daily+Active+Users+DAU+Metric#DAU-KPI\"\
      >\nDAU Definition\n</a>\n\n</div>"
    row: 8
    col: 0
    width: 24
    height: 2
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      ## 🚀 Recent updates
      - #### **Combined DAU, WAU, and MAU:** This dashboard now features "Combined" metrics, which sum the Desktop and Mobile DAU/WAU/MAU metrics. While these metrics may double-count users who are active on both platforms, they are reliable indicators of overall growth across Firefox products.

      *Questions or Suggestions? We’d love to hear from you! [Fill out a survey here](https://docs.google.com/forms/d/e/1FAIpQLSeAQTFBnThMY4HGzTj7WoSV1F51bclrQNFSwKAewrcvUhPYtQ/viewform) or reach out to [#data-help](https://mozilla.slack.com/archives/C4D5ZA91B).*
    row: 2
    col: 1
    width: 22
    height: 4
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div id="mau" style="display: flex; align-items: center; justify-content: space-between; background-color: #333; padding: 0px 20px; border-radius: 5px;">
        <h2 style="color: #FFF">MAU (Monthly Active Users)</h2>
        <div style="margin-left: auto; display: flex;">
          <a
            style="font-size: 12px; padding: 10px 20px; color: #222; border-radius: 5px; border: 1px solid #222; background-color: #FFF; margin-right: 10px;"
            href="https://mozilla-hub.atlassian.net/wiki/spaces/DATA/pages/314704478/Daily+Active+Users+DAU+Metric#WAU-and-MAU">
            MAU Definition
          </a>
          <a
            style="font-size: 12px; padding: 10px 20px; color: #222; border-radius: 5px; border: 1px solid #222; background-color: #FFF;"
            href="https://mozilla.cloud.looker.com/dashboards/1178#top">
            Jump to Top
          </a>
        </div>
      </div>
    row: 52
    col: 0
    width: 24
    height: 2
  - title: Desktop MAU
    name: Desktop MAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.monthly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Firefox Desktop
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.monthly_active_users,
            id: active_users_aggregates.monthly_active_users, name: MAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#FF7139"
      active_users_aggregates.monthly_active_users: "#FF7139"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients in a 28-day periodthat have at least one mouse/keyboard interaction and visit at least one URI.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
          useHTML: true,
          align: "left",
          x: 50,
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'MAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 54
    col: 0
    width: 24
    height: 6
  - title: Fenix MAU
    name: Fenix MAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.monthly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Fenix
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.monthly_active_users,
            id: active_users_aggregates.monthly_active_users, name: MAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#3FE1B0"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients in a 28-day period that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'MAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 66
    col: 0
    width: 24
    height: 6
  - title: Focus Android MAU
    name: Focus Android MAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.monthly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Focus Android
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.monthly_active_users,
            id: active_users_aggregates.monthly_active_users, name: MAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#005E5D"
      active_users_aggregates.monthly_active_users: "#005E5D"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients in a 28-day period that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'MAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 78
    col: 0
    width: 24
    height: 6
  - title: Mobile MAU (Fenix, Firefox iOS, Focus Android, Focus iOS)
    name: Mobile MAU (Fenix, Firefox iOS, Focus Android, Focus iOS)
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.monthly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Fenix,Firefox iOS,Focus Android,Focus iOS
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.monthly_active_users,
            id: active_users_aggregates.monthly_active_users, name: MAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#9059FF"
      active_users_aggregates.monthly_active_users: "#9059FF"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients in a 28-day period that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'MAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 60
    col: 0
    width: 24
    height: 6
  - title: Firefox iOS MAU
    name: Firefox iOS MAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.monthly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Firefox iOS
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.monthly_active_users,
            id: active_users_aggregates.monthly_active_users, name: MAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#0060E0"
      active_users_aggregates.monthly_active_users: "#0060E0"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients in a 28-day period that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'MAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 72
    col: 0
    width: 24
    height: 6
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div id="wau" style="display: flex; align-items: center; justify-content: space-between; background-color: #333; padding: 0px 20px; border-radius: 5px;">

      <h2 style="color: #FFF">WAU (Weekly Active Users)</h2>
        <div style="margin-left: auto; display: flex;">
          <a
            style="font-size: 12px; padding: 10px 20px; color: #222; border-radius: 5px; border: 1px solid #222; background-color: #FFF; margin-right: 10px;"
            href="https://mozilla-hub.atlassian.net/wiki/spaces/DATA/pages/314704478/Daily+Active+Users+DAU+Metric#WAU-and-MAU">
            WAU Definition
          </a>
          <a
            style="font-size: 12px; padding: 10px 20px; color: #222; border-radius: 5px; border: 1px solid #222; background-color: #FFF;"
            href="https://mozilla.cloud.looker.com/dashboards/1178#top">
            Jump to Top
          </a>
        </div>
      </div>
    row: 96
    col: 0
    width: 24
    height: 2
  - title: Firefox iOS WAU
    name: Firefox iOS WAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.weekly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Firefox iOS
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.weekly_active_users,
            id: active_users_aggregates.weekly_active_users, name: WAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#0060E0"
      active_users_aggregates.monthly_active_users: "#0060E0"
      active_users_aggregates.weekly_active_users: "#0060E0"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients in a 7-day period that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'WAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 116
    col: 0
    width: 24
    height: 6
  - title: Focus Android WAU
    name: Focus Android WAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.weekly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Focus Android
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.weekly_active_users,
            id: active_users_aggregates.weekly_active_users, name: WAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#005E5D"
      active_users_aggregates.monthly_active_users: "#005E5D"
      active_users_aggregates.weekly_active_users: "#005E5D"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients in a 7-day period that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'WAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 122
    col: 0
    width: 24
    height: 6
  - title: Desktop WAU
    name: Desktop WAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.weekly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Firefox Desktop
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.weekly_active_users,
            id: active_users_aggregates.weekly_active_users, name: WAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#FF7139"
      active_users_aggregates.monthly_active_users: "#FF7139"
      active_users_aggregates.weekly_active_users: "#FF7139"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients in a 28-day periodthat have at least one mouse/keyboard interaction and visit at least one URI.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'WAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 98
    col: 0
    width: 24
    height: 6
  - title: Fenix WAU
    name: Fenix WAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.weekly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Fenix
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.weekly_active_users,
            id: active_users_aggregates.weekly_active_users, name: WAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#3FE1B0"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients in a 7-day period that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'WAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 110
    col: 0
    width: 24
    height: 6
  - title: Focus iOS MAU
    name: Focus iOS MAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.monthly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Focus iOS
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.monthly_active_users,
            id: active_users_aggregates.monthly_active_users, name: MAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#073072"
      active_users_aggregates.monthly_active_users: "#073072"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients in a 28-day period that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'MAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 84
    col: 0
    width: 24
    height: 6
  - title: Focus iOS WAU
    name: Focus iOS WAU
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.weekly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Focus iOS
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.weekly_active_users,
            id: active_users_aggregates.weekly_active_users, name: WAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#073072"
      active_users_aggregates.monthly_active_users: "#073072"
      active_users_aggregates.weekly_active_users: "#073072"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients in a 7-day period that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'WAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 128
    col: 0
    width: 24
    height: 6
  - title: Mobile WAU (Fenix, Firefox iOS, Focus Android, Focus iOS)
    name: Mobile WAU (Fenix, Firefox iOS, Focus Android, Focus iOS)
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.weekly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Fenix,Firefox iOS,Focus Android,Focus iOS
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.weekly_active_users,
            id: active_users_aggregates.weekly_active_users, name: WAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#9059FF"
      active_users_aggregates.monthly_active_users: "#9059FF"
      active_users_aggregates.weekly_active_users: "#9059FF"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients in a 7-day period that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'WAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 104
    col: 0
    width: 24
    height: 6
  - title: Focus iOS DAU 28-Day Moving Average YoY%
    name: Focus iOS DAU 28-Day Moving Average YoY%
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.daily_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Focus iOS
      active_users_aggregates.submission_date: after 115 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
      _type_hint: number
    - category: table_calculation
      description: Calculates the YoY value using a 365-day offset
      expression: |-
        ${dau_28_day_moving_average} /
        offset(
          ${dau_28_day_moving_average},
          if(extract_years(${active_users_aggregates.submission_date}) = 2024
            AND ${active_users_aggregates.submission_date} >= date(2024, 2, 29),
            366, 365)
        ) - 1
      label: DAU YoY
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: dau_yoy
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: dau_yoy,
            id: dau_yoy, name: DAU YoY}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '392'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#FF7139"
      dau_yoy: "#073072"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients that have at least one mouse/keyboard interaction and visit at least one URI.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [active_users_aggregates.daily_active_users, dau_28_day_moving_average]
    listen: {}
    row: 40
    col: 12
    width: 12
    height: 6
  - title: Firefox iOS DAU 28-Day Moving Average YoY%
    name: Firefox iOS DAU 28-Day Moving Average YoY%
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.daily_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Firefox iOS
      active_users_aggregates.submission_date: after 115 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
      _type_hint: number
    - category: table_calculation
      description: Calculates the YoY value using a 365-day offset
      expression: |-
        ${dau_28_day_moving_average} /
        offset(
          ${dau_28_day_moving_average},
          if(extract_years(${active_users_aggregates.submission_date}) = 2024
            AND ${active_users_aggregates.submission_date} >= date(2024, 2, 29),
            366, 365)
        ) - 1
      label: DAU YoY
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: dau_yoy
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: active_users_aggregates.daily_active_users,
            id: active_users_aggregates.daily_active_users, name: DAU}, {axisId: dau_28_day_moving_average,
            id: dau_28_day_moving_average, name: DAU 28-Day Moving Average}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '392'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#FF7139"
      dau_yoy: "#0060E0"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients that have at least one mouse/keyboard interaction and visit at least one URI.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [active_users_aggregates.daily_active_users, dau_28_day_moving_average]
    listen: {}
    row: 28
    col: 12
    width: 12
    height: 6
  - title: Fenix DAU 28-Day Moving Average YoY%
    name: Fenix DAU 28-Day Moving Average YoY%
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.daily_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Fenix
      active_users_aggregates.submission_date: after 115 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
      _type_hint: number
    - category: table_calculation
      description: Calculates the YoY value using a 365-day offset
      expression: |-
        ${dau_28_day_moving_average} /
        offset(
          ${dau_28_day_moving_average},
          if(extract_years(${active_users_aggregates.submission_date}) = 2024
            AND ${active_users_aggregates.submission_date} >= date(2024, 2, 29),
            366, 365)
        ) - 1
      label: DAU YoY
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: dau_yoy
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: active_users_aggregates.daily_active_users,
            id: active_users_aggregates.daily_active_users, name: DAU}, {axisId: dau_28_day_moving_average,
            id: dau_28_day_moving_average, name: DAU 28-Day Moving Average}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '392'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#FF7139"
      dau_yoy: "#3FE1B0"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients that have at least one mouse/keyboard interaction and visit at least one URI.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [active_users_aggregates.daily_active_users, dau_28_day_moving_average]
    listen: {}
    row: 22
    col: 12
    width: 12
    height: 6
  - title: Mobile DAU 28-Day Moving Average YoY% (Fenix, Firefosx iOS, Focus Android,
      Focus iOS)
    name: Mobile DAU 28-Day Moving Average YoY% (Fenix, Firefosx iOS, Focus Android,
      Focus iOS)
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.daily_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Fenix,Firefox iOS,Focus Android,Focus iOS
      active_users_aggregates.submission_date: after 115 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
      _type_hint: number
    - category: table_calculation
      description: Calculates the YoY value using a 365-day offset
      expression: |-
        ${dau_28_day_moving_average} /
        offset(
          ${dau_28_day_moving_average},
          if(extract_years(${active_users_aggregates.submission_date}) = 2024
            AND ${active_users_aggregates.submission_date} >= date(2024, 2, 29),
            366, 365)
        ) - 1
      label: DAU YoY
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: dau_yoy
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: active_users_aggregates.daily_active_users,
            id: active_users_aggregates.daily_active_users, name: DAU}, {axisId: dau_28_day_moving_average,
            id: dau_28_day_moving_average, name: DAU 28-Day Moving Average}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '392'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#FF7139"
      dau_yoy: "#9059FF"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients that have at least one mouse/keyboard interaction and visit at least one URI.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [active_users_aggregates.daily_active_users, dau_28_day_moving_average]
    listen: {}
    row: 16
    col: 12
    width: 12
    height: 6
  - title: Desktop DAU 28-Day Moving Average YoY%
    name: Desktop DAU 28-Day Moving Average YoY%
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.daily_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Firefox Desktop
      active_users_aggregates.submission_date: after 115 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
      _type_hint: number
    - category: table_calculation
      description: Calculates the YoY value using a 365-day offset
      expression: |-
        ${dau_28_day_moving_average} /
        offset(
          ${dau_28_day_moving_average},
          if(extract_years(${active_users_aggregates.submission_date}) = 2024
            AND ${active_users_aggregates.submission_date} >= date(2024, 2, 29),
            366, 365)
        ) - 1
      label: DAU YoY
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: dau_yoy
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: active_users_aggregates.daily_active_users,
            id: active_users_aggregates.daily_active_users, name: DAU}, {axisId: dau_28_day_moving_average,
            id: dau_28_day_moving_average, name: DAU 28-Day Moving Average}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '392'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#FF7139"
      dau_yoy: "#FF7139"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients that have at least one mouse/keyboard interaction and visit at least one URI.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [active_users_aggregates.daily_active_users, dau_28_day_moving_average]
    listen: {}
    row: 10
    col: 12
    width: 12
    height: 6
  - title: Focus Android DAU 28-Day Moving Average YoY%
    name: Focus Android DAU 28-Day Moving Average YoY%
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.daily_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Focus Android
      active_users_aggregates.submission_date: after 115 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
      _type_hint: number
    - category: table_calculation
      description: Calculates the YoY value using a 365-day offset
      expression: |-
        ${dau_28_day_moving_average} /
        offset(
          ${dau_28_day_moving_average},
          if(extract_years(${active_users_aggregates.submission_date}) = 2024
            AND ${active_users_aggregates.submission_date} >= date(2024, 2, 29),
            366, 365)
        ) - 1
      label: DAU YoY
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: dau_yoy
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: active_users_aggregates.daily_active_users,
            id: active_users_aggregates.daily_active_users, name: DAU}, {axisId: dau_28_day_moving_average,
            id: dau_28_day_moving_average, name: DAU 28-Day Moving Average}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '392'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#FF7139"
      dau_yoy: "#005E5D"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients that have at least one mouse/keyboard interaction and visit at least one URI.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [active_users_aggregates.daily_active_users, dau_28_day_moving_average]
    listen: {}
    row: 34
    col: 12
    width: 12
    height: 6
  - title: Combined MAU (Desktop + Mobile)
    name: Combined MAU (Desktop + Mobile)
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.monthly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Fenix,Firefox iOS,Focus Android,Focus iOS,Firefox
        Desktop
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.monthly_active_users,
            id: active_users_aggregates.monthly_active_users, name: MAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#9059FF"
      active_users_aggregates.monthly_active_users: "#ff1203"
    advanced_vis_config: |-
      {
        chart: {},
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'MAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 90
    col: 0
    width: 24
    height: 6
  - title: Combined WAU (Desktop + Mobile)
    name: Combined WAU (Desktop + Mobile)
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.weekly_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Fenix,Firefox iOS,Focus Android,Focus iOS,Firefox
        Desktop
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_users_aggregates.weekly_active_users,
            id: active_users_aggregates.weekly_active_users, name: WAU}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#9059FF"
      active_users_aggregates.monthly_active_users: "#9059FF"
      active_users_aggregates.weekly_active_users: "#ff1203"
    advanced_vis_config: |-
      {
        chart: {},
        caption: {
          text: 'The number of unique clients in a 7-day period that have <a href="https://docs.google.com/document/d/1-sP8F0XskeyVIXApXjWn26mpTLjvW9CQ6bQsZZoS5B4/edit#heading=h.qdndw0yzycur">a nonzero session length</a>.<br/>Excludes known sources of bot activity and Mozilla Online (<a href="https://docs.google.com/document/d/1l00C8JnjTYrwo9tqZdmFrL8OTHMvAorBKZ0tbFzkR-w/edit">decision brief</a>).',
          useHTML: true,
          align: "left",
          x: 50,
          style: {
            color: "#555",
            fontSize: "1.0em",
          },
        },
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'WAU'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 134
    col: 0
    width: 24
    height: 6
  - title: Combined DAU 28-Day Moving Average YoY%
    name: Combined DAU 28-Day Moving Average YoY%
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.submission_date, active_users_aggregates.daily_active_users]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Fenix,Firefox iOS,Focus Android,Focus iOS,Firefox
        Desktop
      active_users_aggregates.submission_date: after 115 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
      _type_hint: number
    - category: table_calculation
      description: Calculates the YoY value using a 365-day offset
      expression: |-
        ${dau_28_day_moving_average} /
        offset(
          ${dau_28_day_moving_average},
          if(extract_years(${active_users_aggregates.submission_date}) = 2024
            AND ${active_users_aggregates.submission_date} >= date(2024, 2, 29),
            366, 365)
        ) - 1
      label: DAU YoY
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: dau_yoy
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: active_users_aggregates.daily_active_users,
            id: active_users_aggregates.daily_active_users, name: DAU}, {axisId: dau_28_day_moving_average,
            id: dau_28_day_moving_average, name: DAU 28-Day Moving Average}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '392'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#FF7139"
      dau_yoy: "#ff1203"
    advanced_vis_config: |-
      {
        chart: {},
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [active_users_aggregates.daily_active_users, dau_28_day_moving_average]
    listen: {}
    row: 46
    col: 12
    width: 12
    height: 6
  - title: Combined DAU (Desktop + Mobile)
    name: Combined DAU (Desktop + Mobile)
    model: combined_browser_metrics
    explore: active_users_aggregates
    type: looker_line
    fields: [active_users_aggregates.daily_active_users, active_users_aggregates.submission_date]
    fill_fields: [active_users_aggregates.submission_date]
    filters:
      active_users_aggregates.app_name: Fenix,Firefox iOS,Focus Android,Focus iOS,Firefox
        Desktop
      active_users_aggregates.submission_date: after 60 weeks ago
    sorts: [active_users_aggregates.submission_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${active_users_aggregates.daily_active_users},
        0, 28))
      label: DAU 28-Day Moving Average
      value_format: "#,##0"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: dau_28_day_moving_average
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Daily Active Users, orientation: left, series: [{axisId: active_users_aggregates.daily_active_users,
            id: active_users_aggregates.daily_active_users, name: DAU}, {axisId: dau_28_day_moving_average,
            id: dau_28_day_moving_average, name: DAU 28-Day Moving Average}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '31'
    series_colors:
      active_users_aggregates.daily_active_users: "#CCC"
      dau_28_day_moving_average: "#ff1203"
    advanced_vis_config: |-
      {
        chart: {},
        legend: {
          align: "right",
          verticalAlign: "top",
          layout: "horizontal",
          floating: false,
        },
        series: [{
          name: 'DAU'
        }, {
          name: 'DAU 28-Day Moving Average'
        }]
      }
    defaults_version: 1
    listen: {}
    row: 46
    col: 0
    width: 12
    height: 6
