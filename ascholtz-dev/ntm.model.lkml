connection: "telemetry"

include: "views/*.view.lkml"
include: "dashboards/*.dashboard"

view: country_buckets {
  derived_table: {
    sql: SELECT
      code,
      name,
      bucket
      FROM country_codes_v1
      CROSS JOIN UNNEST(["Overall"]) AS bucket;;
  }
}

explore: country_buckets {}

explore: install  {
  sql_always_where: ${submission_timestamp_date} > date(2020, 7 ,1)
}


explore: new_profile {
  sql_always_where: ${submission_timestamp_date} > date(2020, 7, 1) ;;
}


explore: country_codes_v1 {
  hidden: yes
}
