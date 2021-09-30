connection: "telemetry"

include: "views/*.view.lkml"
include: "dashboards/*.dashboard"


explore: live_data {
  from:  live
}
