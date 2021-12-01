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

explore: release_histograms {
  from:  release_histograms

  always_filter: {
    filters: [
      os: "Windows",
      branch: "enabled, disabled",
    ]
  }
}

explore: merino_histograms {
  from:  merino_histograms

  always_filter: {
    filters: [
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

explore: release_scalars {
  from:  release_scalars

  always_filter: {
    filters: [
      os: "Windows",
      branch: "enabled, disabled",
    ]
  }
}
