connection: "telemetry"

include: "views/*.view.lkml"
include: "dashboards/*.dashboard"

explore: install  {
  sql_always_where: ${submission_timestamp_date} > date(2020, 7 ,1) ;;
}

explore: new_profile {
  sql_always_where: ${submission_timestamp_date} > date(2020, 7, 1) ;;
}

explore: country_codes_v1 {
  hidden: yes
}
