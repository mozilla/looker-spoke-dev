connection: "telemetry"

include: "./views/version_uplift.view.lkml"                # include all views in the views/ folder in this project
include: "./views/surveys.view.lkml"
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: version_uplift {
  from: version_uplift
}


explore: surveys {
  from: surveys
}
