connection: "telemetry"

include: "views/*.view.lkml"
include: "dashboards/*.dashboard"

view: country_buckets {
  derived_table: {
    sql:
      SELECT "Overall" AS bucket
      UNION ALL
      SELECT "tier-1" AS bucket;;
  }
}

explore: install  {
  sql_always_where: ${submission_timestamp_date} > date(2020, 7 ,1);;
}


explore: new_profile {
  sql_always_where: ${submission_timestamp_date} > date(2020, 7, 1) ;;
}


explore: country_codes_v1 {
  hidden: yes
}

explore: country_buckets {}
