# figure out best way to access the KPI stuff...

connection: "telemetry"

# views in my folder
include: "./views/version_uplift.view.lkml"
include: "./views/surveys.view.lkml"
include: "./views/feature_usage.view.lkml"

#include: "//spoke-default/KPI/kpi.model.lkml"
# figure out best way to access the KPI stuff...

explore: version_uplift {
  from: version_uplift
}


explore: surveys {
  from: surveys
}


explore: feature_usage {
  from: feature_usage
}
