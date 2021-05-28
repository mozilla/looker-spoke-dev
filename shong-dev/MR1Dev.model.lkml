# figure out best way to access the KPI stuff...

connection: "telemetry"

# views in my folder
include: "./views/version_uplift.view.lkml"
include: "./views/surveys.view.lkml"
include: "./views/feature_usage.view.lkml"
include: "./views/gplay_downloads.view.lkml"
include: "./views/mozorg_ga.view.lkml"
include: "./views/mozblogs_ga.view.lkml"
include: "./views/forecasts_various.view.lkml"
include: "./views/dau_newprofile.view.lkml"

#include: "//spoke-default/KPI/kpi.model.lkml"
# figure out best way to access the KPI stuff...

explore: version_uplift {
  from: version_uplift
}


explore: version_uplift_mobile {
  from: version_uplift_mobile
}


explore: surveys {
  from: surveys
}


explore: feature_usage {
  from: feature_usage
}


explore: gplay_downloads {
  from: gplay_downloads
}


explore: mozorg_ga {
  from: mozorg_ga
}


explore: mozblogs_ga {
  from: mozblogs_ga
}


explore: forecast_desktopDAU {
  from: forecast_desktopDAU
}


explore: forecast_desktopNP {
  from: forecast_desktopNP
}

explore: dau_desktop {
  from: dau_desktop
}

explore: forecast_dls {
  from: forecast_dls
}

explore: dau_mobile {
  from: dau_mobile
}


explore: forecast_mobile_dau {
  from: forecast_mobile_dau
}


explore: install_android {
  from: install_android
}


explore: forecast_android_installs {
  from: forecast_android_installs
}

explore: install_ios {
  from: install_ios
}


explore: forecast_ios_installs {
  from: forecast_ios_installs
}
