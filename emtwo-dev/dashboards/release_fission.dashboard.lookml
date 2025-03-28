- dashboard: fission_release
  title: Fission Release Rollout
  layout: newspaper
  preferred_viewer: dashboards-next

  elements:
  - title: Child Process Launch MS
    name: Child Process Launch MS
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile_high, release_histograms.percentile_low,
      release_histograms.percentile]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: CHILD_PROCESS_LAUNCH_MS
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 0
    col: 12
    width: 12
    height: 8

  - title: Content Process Max
    name: Content Process Max
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: CONTENT_PROCESS_MAX
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 0
    col: 0
    width: 12
    height: 8

  - title: Checkerboard Severity
    name: Checkerboard Severity
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: CHECKERBOARD_SEVERITY
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 10
    col: 0
    width: 12
    height: 7

  - title: Content Process Count
    name: Content Process Count
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: CONTENT_PROCESS_COUNT
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 10
    col: 12
    width: 12
    height: 7

  - title: Content Frame Time VSync
    name: Content Frame Time VSync
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: CONTENT_FRAME_TIME_VSYNC
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 20
    col: 0
    width: 12
    height: 7

  - title: FX New Window MS
    name:  FX New Window MS
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: FX_NEW_WINDOW_MS
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 20
    col: 12
    width: 12
    height: 7

  - title: FX Tab Switch Composite E10S MS
    name:  FX Tab Switch Composite E10S MS
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: FX_TAB_SWITCH_COMPOSITE_E10S_MS
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 30
    col: 0
    width: 12
    height: 7

  - title: Keypress Latency MS
    name:  Keypress Latency MS
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: KEYPRESS_PRESENT_LATENCY_MS
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 30
    col: 12
    width: 12
    height: 7

  - title: Memory Total
    name:  Memory Total
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: MEMORY_TOTAL
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 40
    col: 0
    width: 12
    height: 7

  - title: Cycle Collector Max Pause
    name:  Cycle Collector Max Pause
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: CYCLE_COLLECTOR_MAX_PAUSE
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 40
    col: 12
    width: 12
    height: 7

  - title: Cycle Collector Max Pause Content
    name:  Cycle Collector Max Pause Content
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: CYCLE_COLLECTOR_MAX_PAUSE_CONTENT
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 50
    col: 0
    width: 12
    height: 7

  - title: GC Max Pause 2
    name:  GC Max Pause 2
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: GC_MAX_PAUSE_2
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 50
    col: 12
    width: 12
    height: 7

  - title: GC Max Pause 2 Content
    name:  GC Max Pause 2 Content
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: GC_MAX_PAUSE_2_CONTENT
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 60
    col: 0
    width: 12
    height: 7

  - title: GC MS
    name:  GC MS
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: GC_MS
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 60
    col: 12
    width: 12
    height: 7

  - title: GC MS Content
    name:  GC MS Content
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: GC_MS_CONTENT
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 70
    col: 0
    width: 12
    height: 7

  - title: GC Slice During Idle
    name:  GC Slice During Idle
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: GC_SLICE_DURING_IDLE
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 70
    col: 12
    width: 12
    height: 7

  - title: FGC Slice During Idle Content
    name:  GC Slice During Idle Content
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: GC_SLICE_DURING_IDLE_CONTENT
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 80
    col: 0
    width: 12
    height: 7

  - title: Memory Unique Content Startup
    name:  Memory Unique Content Startup
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: MEMORY_UNIQUE_CONTENT_STARTUP
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 80
    col: 12
    width: 12
    height: 7

  - title: Perf First Contentful Paint MS
    name:  Perf First Contentful Paint MS
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: PERF_FIRST_CONTENTFUL_PAINT_MS
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 90
    col: 0
    width: 12
    height: 7

  - title: Time to First Interaction MS
    name:  Time to First Interaction MS
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: TIME_TO_FIRST_INTERACTION_MS
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 90
    col: 12
    width: 12
    height: 7

  - title: Perf Page Load Time MS
    name:  Perf Page Load Time MS
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: PERF_PAGE_LOAD_TIME_MS
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 100
    col: 0
    width: 12
    height: 7

  - title: Loaded Tab Count
    name:  Loaded Tab Count
    model: fission
    explore: release_histograms
    type: looker_line
    fields: [release_histograms.submission_date, release_histograms.branch, release_histograms.percentile, release_histograms.percentile_high,
      release_histograms.percentile_low]
    pivots: [release_histograms.branch]
    filters:
      release_histograms.probe: LOADED_TAB_COUNT
    listen:
      OS: release_histograms.os
      Cores: release_histograms.cores_count
      Percentile: release_histograms.percentile_conf
    row: 100
    col: 12
    width: 12
    height: 7

  - title: Gmplugin Crashes
    name: Gmplugin Crashes
    explore: release_scalars
    type: "looker_line"
    fields: [
      release_scalars.submission_date,
      release_scalars.branch,
      release_scalars.percentile_high,
      release_scalars.percentile_low,
      release_scalars.percentile
    ]
    pivots: [release_scalars.branch]
    filters:
      release_scalars.probe: GMPLUGIN_CRASHES
    row: 110
    col: 0
    width: 12
    height: 8
    listen:
      Percentile: release_scalars.percentile_conf
      Cores: release_scalars.cores_count
      OS: release_scalars.os

  - title: Subsession Length
    name: Subsession Length
    explore: release_scalars
    type: "looker_line"
    fields: [
      release_scalars.submission_date,
      release_scalars.branch,
      release_scalars.percentile_high,
      release_scalars.percentile_low,
      release_scalars.percentile
    ]
    pivots: [release_scalars.branch]
    filters:
      release_scalars.probe: SUBSESSION_LENGTH
    row: 110
    col: 12
    width: 12
    height: 8
    listen:
      Percentile: release_scalars.percentile_conf
      Cores: release_scalars.cores_count
      OS: release_scalars.os

  - title: Content Shutdown Crashes
    name: Content Shutdown Crashes
    explore: release_scalars
    type: "looker_line"
    fields: [
      release_scalars.submission_date,
      release_scalars.branch,
      release_scalars.percentile_high,
      release_scalars.percentile_low,
      release_scalars.percentile
    ]
    pivots: [release_scalars.branch]
    filters:
      release_scalars.probe: CONTENT_SHUTDOWN_CRASHES
    row: 120
    col: 0
    width: 12
    height: 8
    listen:
      Percentile: release_scalars.percentile_conf
      Cores: release_scalars.cores_count
      OS: release_scalars.os

  - title: Active Ticks
    name: Active Ticks
    explore: release_scalars
    type: "looker_line"
    fields: [
      release_scalars.submission_date,
      release_scalars.branch,
      release_scalars.percentile_high,
      release_scalars.percentile_low,
      release_scalars.percentile
    ]
    pivots: [release_scalars.branch]
    filters:
      release_scalars.probe: ACTIVE_TICKS
    row: 120
    col: 12
    width: 12
    height: 8
    listen:
      Percentile: release_scalars.percentile_conf
      Cores: release_scalars.cores_count
      OS: release_scalars.os

  - title: Plugin Crashes
    name: Plugin Crashes
    explore: release_scalars
    type: "looker_line"
    fields: [
      release_scalars.submission_date,
      release_scalars.branch,
      release_scalars.percentile_high,
      release_scalars.percentile_low,
      release_scalars.percentile
    ]
    pivots: [release_scalars.branch]
    filters:
      release_scalars.probe: PLUGIN_CRASHES
    row: 130
    col: 0
    width: 12
    height: 8
    listen:
      Percentile: release_scalars.percentile_conf
      Cores: release_scalars.cores_count
      OS: release_scalars.os

  - title: Gpu Crashes
    name: Gpu Crashes
    explore: release_scalars
    type: "looker_line"
    fields: [
      release_scalars.submission_date,
      release_scalars.branch,
      release_scalars.percentile_high,
      release_scalars.percentile_low,
      release_scalars.percentile
    ]
    pivots: [release_scalars.branch]
    filters:
      release_scalars.probe: GPU_CRASHES
    row: 130
    col: 12
    width: 12
    height: 8
    listen:
      Percentile: release_scalars.percentile_conf
      Cores: release_scalars.cores_count
      OS: release_scalars.os

  - title: Shutdown Hangs
    name: Shutdown Hangs
    explore: release_scalars
    type: "looker_line"
    fields: [
      release_scalars.submission_date,
      release_scalars.branch,
      release_scalars.percentile_high,
      release_scalars.percentile_low,
      release_scalars.percentile
    ]
    pivots: [release_scalars.branch]
    filters:
      release_scalars.probe: SHUTDOWN_HANGS
    row: 140
    col: 0
    width: 12
    height: 8
    listen:
      Percentile: release_scalars.percentile_conf
      Cores: release_scalars.cores_count
      OS: release_scalars.os

  - title: Content Crashes
    name: Content Crashes
    explore: release_scalars
    type: "looker_line"
    fields: [
      release_scalars.submission_date,
      release_scalars.branch,
      release_scalars.percentile_high,
      release_scalars.percentile_low,
      release_scalars.percentile
    ]
    pivots: [release_scalars.branch]
    filters:
      release_scalars.probe: CONTENT_CRASHES
    row: 140
    col: 12
    width: 12
    height: 8
    listen:
      Percentile: release_scalars.percentile_conf
      Cores: release_scalars.cores_count
      OS: release_scalars.os

  - title: Uri Count
    name: Uri Count
    explore: release_scalars
    type: "looker_line"
    fields: [
      release_scalars.submission_date,
      release_scalars.branch,
      release_scalars.percentile_high,
      release_scalars.percentile_low,
      release_scalars.percentile
    ]
    pivots: [release_scalars.branch]
    filters:
      release_scalars.probe: URI_COUNT
    row: 150
    col: 0
    width: 12
    height: 8
    listen:
      Percentile: release_scalars.percentile_conf
      Cores: release_scalars.cores_count
      OS: release_scalars.os

  - title: Startup Crashes
    name: Startup Crashes
    explore: release_scalars
    type: "looker_line"
    fields: [
      release_scalars.submission_date,
      release_scalars.branch,
      release_scalars.percentile_high,
      release_scalars.percentile_low,
      release_scalars.percentile
    ]
    pivots: [release_scalars.branch]
    filters:
      release_scalars.probe: STARTUP_CRASHES
    row: 150
    col: 12
    width: 12
    height: 8
    listen:
      Percentile: release_scalars.percentile_conf
      Cores: release_scalars.cores_count
      OS: release_scalars.os

  - title: Main Crashes
    name: Main Crashes
    explore: release_scalars
    type: "looker_line"
    fields: [
      release_scalars.submission_date,
      release_scalars.branch,
      release_scalars.percentile_high,
      release_scalars.percentile_low,
      release_scalars.percentile
    ]
    pivots: [release_scalars.branch]
    filters:
      release_scalars.probe: MAIN_CRASHES
    row: 160
    col: 0
    width: 12
    height: 8
    listen:
      Percentile: release_scalars.percentile_conf
      Cores: release_scalars.cores_count
      OS: release_scalars.os

  - title: Oom Crashes
    name: Oom Crashes
    explore: release_scalars
    type: "looker_line"
    fields: [
      release_scalars.submission_date,
      release_scalars.branch,
      release_scalars.percentile_high,
      release_scalars.percentile_low,
      release_scalars.percentile
    ]
    pivots: [release_scalars.branch]
    filters:
      release_scalars.probe: OOM_CRASHES
    row: 160
    col: 12
    width: 12
    height: 8
    listen:
      Percentile: release_scalars.percentile_conf
      Cores: release_scalars.cores_count
      OS: release_scalars.os

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
