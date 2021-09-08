connection: "telemetry"

include: "views/*.view.lkml"
include: "dashboards/*.dashboard"


explore: histograms {
  from:  fission_histograms

  always_filter: {
    filters: [
      os: "Windows",
      branch: "fission-enabled, fission-disabled",
    ]
  }
}

explore: scalars {
  from:  fission_scalars

  always_filter: {
    filters: [
      os: "Windows",
      branch: "fission-enabled, fission-disabled",
    ]
  }
}
