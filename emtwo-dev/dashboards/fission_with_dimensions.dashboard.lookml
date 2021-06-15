- dashboard: fission_with_dimensions
  title: Fission with Dimensions
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

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
    default_value: 4
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
        - "2"
        - "4"
        - "6"
        - "8"
        - "10"
        - "12"
        - "14"
        - "16"

  elements:
  - title: Content Process Max
    name: Content Process Max
    model: fission
    explore: dimensions
    type: looker_line
    fields: [dimensions.median, dimensions.build_id]
    filters:
      dimensions.probe: 'CONTENT_PROCESS_MAX'
    pivots:
    - dimensions.branch
    listen:
      OS: dimensions.os
      Cores: dimensions.cores_count
    layout: grid
    row: 0
    col: 0
    width: 12
    height: 8

  - title: Content Process Count
    name: Content Process Count
    model: fission
    explore: dimensions
    type: looker_line
    fields: [dimensions.median, dimensions.build_id]
    filters:
      dimensions.probe: 'CONTENT_PROCESS_COUNT'
    pivots:
    - dimensions.branch
    listen:
      OS: dimensions.os
      Cores: dimensions.cores_count
    layout: grid
    row: 0
    col: 12
    width: 12
    height: 8

  - title: Checkerboard Severity
    name: Checkerboard Severity
    model: fission
    explore: dimensions
    type: looker_line
    fields: [dimensions.median, dimensions.build_id]
    filters:
      dimensions.probe: 'CHECKERBOARD_SEVERITY'
    pivots:
    - dimensions.branch
    listen:
      OS: dimensions.os
      Cores: dimensions.cores_count
    layout: grid
    row: 0
    col: 0
    width: 12
    height: 8

  - title: Child Process Launch MS
    name: Child Process Launch MS
    model: fission
    explore: dimensions
    type: looker_line
    fields: [dimensions.median, dimensions.build_id]
    filters:
      dimensions.probe: 'CHILD_PROCESS_LAUNCH_MS'
    pivots:
    - dimensions.branch
    listen:
      OS: dimensions.os
      Cores: dimensions.cores_count
    layout: grid
    row: 0
    col: 12
    width: 12
    height: 8
