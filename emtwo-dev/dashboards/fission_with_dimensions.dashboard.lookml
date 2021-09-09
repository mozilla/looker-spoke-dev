- dashboard: fission_with_dimensions
  title: Fission with Dimensions
  layout: newspaper
  preferred_viewer: dashboards-next

  elements:
  - title: Child Process Launch MS
    name: Child Process Launch MS
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile_high, histograms.percentile_low,
      histograms.percentile]
    pivots: [histograms.branch]
    filters:
      histograms.probe: CHILD_PROCESS_LAUNCH_MS
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 2
    col: 12
    width: 12
    height: 8

  - title: Content Process Max
    name: Content Process Max
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: CONTENT_PROCESS_MAX
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 2
    col: 0
    width: 12
    height: 8

  - title: Checkerboard Severity
    name: Checkerboard Severity
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: CHECKERBOARD_SEVERITY
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 10
    col: 0
    width: 12
    height: 7

  - title: Content Process Count
    name: Content Process Count
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: CONTENT_PROCESS_COUNT
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 10
    col: 12
    width: 12
    height: 7

  - title: Content Frame Time VSync
    name: Content Frame Time VSync
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: CONTENT_FRAME_TIME_VSYNC
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 11
    col: 0
    width: 12
    height: 7

  - title: FX New Window MS
    name:  FX New Window MS
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: FX_NEW_WINDOW_MS
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 11
    col: 12
    width: 12
    height: 7

  - title: FX Tab Switch Composite E10S MS
    name:  FX Tab Switch Composite E10S MS
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: FX_TAB_SWITCH_COMPOSITE_E10S_MS
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 12
    col: 0
    width: 12
    height: 7

  - title: Keypress Latency MS
    name:  Keypress Latency MS
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: KEYPRESS_PRESENT_LATENCY_MS
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 12
    col: 12
    width: 12
    height: 7

  - title: Memory Total
    name:  Memory Total
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: MEMORY_TOTAL
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 13
    col: 0
    width: 12
    height: 7

  - title: Cycle Collector Max Pause
    name:  Cycle Collector Max Pause
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: CYCLE_COLLECTOR_MAX_PAUSE
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 13
    col: 12
    width: 12
    height: 7

  - title: Cycle Collector Max Pause Content
    name:  Cycle Collector Max Pause Content
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: CYCLE_COLLECTOR_MAX_PAUSE_CONTENT
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 14
    col: 0
    width: 12
    height: 7

  - title: GC Max Pause 2
    name:  GC Max Pause 2
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: GC_MAX_PAUSE_2
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 14
    col: 12
    width: 12
    height: 7

  - title: GC Max Pause 2 Content
    name:  GC Max Pause 2 Content
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: GC_MAX_PAUSE_2_CONTENT
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 15
    col: 0
    width: 12
    height: 7

  - title: GC MS
    name:  GC MS
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: GC_MS
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 15
    col: 12
    width: 12
    height: 7

  - title: GC MS Content
    name:  GC MS Content
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: GC_MS_CONTENT
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 16
    col: 0
    width: 12
    height: 7

  - title: GC Slice During Idle
    name:  GC Slice During Idle
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: GC_SLICE_DURING_IDLE
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 16
    col: 12
    width: 12
    height: 7

  - title: FGC Slice During Idle Content
    name:  GC Slice During Idle Content
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: GC_SLICE_DURING_IDLE_CONTENT
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 17
    col: 0
    width: 12
    height: 7

  - title: Memory Unique Content Startup
    name:  Memory Unique Content Startup
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: MEMORY_UNIQUE_CONTENT_STARTUP
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 17
    col: 12
    width: 12
    height: 7

  - title: Perf First Contentful Paint MS
    name:  Perf First Contentful Paint MS
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: PERF_FIRST_CONTENTFUL_PAINT_MS
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 18
    col: 0
    width: 12
    height: 7

  - title: Time to First Interaction MS
    name:  Time to First Interaction MS
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: TIME_TO_FIRST_INTERACTION_MS
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 18
    col: 12
    width: 12
    height: 7

  - title: Perf Page Load Time MS
    name:  Perf Page Load Time MS
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: PERF_PAGE_LOAD_TIME_MS
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 19
    col: 0
    width: 12
    height: 7

  - title: Loaded Tab Count
    name:  Loaded Tab Count
    model: fission
    explore: histograms
    type: looker_line
    fields: [histograms.build_id, histograms.branch, histograms.percentile, histograms.percentile_high,
      histograms.percentile_low]
    pivots: [histograms.branch]
    filters:
      histograms.probe: LOADED_TAB_COUNT
    listen:
      OS: histograms.os
      Cores: histograms.cores_count
      Percentile: histograms.percentile_conf
    row: 19
    col: 12
    width: 12
    height: 7

  - title: Session Length
    name: Session Length
    model: fission
    explore: scalars
    type: looker_line
    fields: [scalars.build_id, scalars.branch, scalars.percentile, scalars.percentile_high,
      scalars.percentile_low]
    pivots: [scalars.branch]
    filters:
      scalars.probe: SUBSESSION_LENGTH
    listen:
      OS: scalars.os
      Cores: scalars.cores_count
      Percentile: scalars.percentile_conf
    row: 35
    col: 12
    width: 12
    height: 8

  - title: URI Count
    name: URI Count
    model: fission
    explore: scalars
    type: looker_line
    fields: [scalars.build_id, scalars.branch, scalars.percentile, scalars.percentile_high,
      scalars.percentile_low]
    pivots: [scalars.branch]
    filters:
      scalars.probe: URI_COUNT
    listen:
      OS: scalars.os
      Cores: scalars.cores_count
      Percentile: scalars.percentile_conf
    row: 35
    col: 0
    width: 12
    height: 8

  - title: Active Hours
    name: Active Hours
    model: fission
    explore: scalars
    type: looker_line
    fields: [scalars.build_id, scalars.branch, scalars.percentile, scalars.percentile_high,
      scalars.percentile_low]
    pivots: [scalars.branch]
    filters:
      scalars.probe: ACTIVE_TICKS
    listen:
      OS: scalars.os
      Cores: scalars.cores_count
      Percentile: scalars.percentile_conf
    row: 36
    col: 0
    width: 12
    height: 8

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
