connection: "telemetry"

include: "views/*.view.lkml"
include: "dashboards/*.dashboard"


explore: monitoring {
  from: fission_monitoring

  always_filter: {
    filters: [
      os: "All",
      branch: "enabled, disabled",
      probe: "CONTENT_PROCESS_MAX, CONTENT_PROCESS_COUNT"
    ]
  }
}

explore: dimensions {
  from:  fission_with_dimensions

  always_filter: {
    filters: [
      os: "Windows",
      branch: "fission-enabled, fission-disabled",
    ]
  }
}
