connection: "telemetry"

include: "views/*.view.lkml"
include: "dashboards/*.dashboard"


explore: histograms {
  from:  fission_histograms

  always_filter: {
    filters: [
      os: "Windows",
      branch: "enabled, disabled",
    ]
  }
}

explore: scalars {
  from:  fission_scalars

  always_filter: {
    filters: [
      os: "Windows",
      branch: "enabled, disabled",
    ]
  }
}
