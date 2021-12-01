- dashboard: merino
  title: Merino
  layout: newspaper
  preferred_viewer: dashboards-next

  elements:
  - title: Quick Suggest Latency
    name: Quick Suggest Latency
    model: fission
    explore: merino_histograms
    type: looker_line
    fields: [merino_histograms.submission_date, merino_histograms.branch, merino_histograms.percentile_high, merino_histograms.percentile_low,
      merino_histograms.percentile]
    pivots: [merino_histograms.branch]
    filters:
      merino_histograms.probe: QUICK_SUGGEST_LATENCY
    listen:
      Percentile: merino_histograms.percentile_conf
    row: 0
    col: 0
    width: 12
    height: 8
  - title: Merino Latency
    name: Merino Latency
    model: fission
    explore: merino_histograms
    type: looker_line
    fields: [merino_histograms.submission_date, merino_histograms.branch, merino_histograms.percentile_high, merino_histograms.percentile_low,
      merino_histograms.percentile]
    pivots: [merino_histograms.branch]
    filters:
      merino_histograms.probe: MERINO_LATENCY
    listen:
      Percentile: merino_histograms.percentile_conf
    row: 0
    col: 12
    width: 12
    height: 8


  filters:
  - name: Percentile
    title: Percentile
    type: number_filter
    default_value: '50'
    allow_multiple_values: false
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
