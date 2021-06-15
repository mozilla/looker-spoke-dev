- dashboard: fission
  title: Fission
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  elements:
  - title: Content Process Max
    name: Content Process Max
    model: fission
    explore: monitoring
    type: looker_boxplot
    fields: [monitoring.low, monitoring.est, monitoring.high, monitoring.branch, monitoring.build_id]
    filters:
      monitoring.probe: CONTENT_PROCESS_MAX
    listen:
      OS: monitoring.os
    layout: grid
    row: 0
    col: 0
    width: 12
    height: 8

  - title: Content Process Count
    name: Content Process Count
    model: fission
    explore: monitoring
    type: looker_line
    fields: [monitoring.low, monitoring.est, monitoring.high, monitoring.build_id]
    pivots:
    - monitoring.branch
    filters:
      monitoring.probe: CONTENT_PROCESS_COUNT
    listen:
      OS: monitoring.os
    layout: grid
    colors: [red, red, red, blue, blue, blue]
    row: 0
    col: 12
    width: 12
    height: 8

  - title: Checkerboard Severity
    name: Checkerboard Severity
    model: fission
    explore: monitoring
    type: looker_line
    fields: [monitoring.est, monitoring.build_id]
    pivots:
    - monitoring.branch
    filters:
      monitoring.probe: CHECKERBOARDING_SEVERITY
    listen:
      OS: monitoring.os
    layout: grid
    row: 0
    col: 0
    width: 12
    height: 8

  - title: Child Process Launch MS
    name: Child Process Launch MS
    model: fission
    explore: monitoring
    type: looker_line
    fields: [monitoring.est, monitoring.build_id]
    pivots:
    - monitoring.branch
    filters:
      monitoring.probe: CHILD_PROCESS_LAUNCH_MS
    listen:
      OS: monitoring.os
    layout: grid
    row: 0
    col: 12
    width: 12
    height: 8

  filters:
  - name: OS
    title: OS
    type: string_filter
    default_value: All
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - All
      - Windows
      - Linux
      - Mac
