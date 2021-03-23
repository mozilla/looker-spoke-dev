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

  dimension: bucket {
    type: string
    sql: ${TABLE}.bucket ;;
  }
}

explore: install  {
  sql_always_where: ${submission_timestamp_date} > date(2020, 7 ,1);;
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: ${country_buckets.bucket} = "Overall" OR (
      ${country_buckets.bucket} = "tier-1" AND ${install.normalized_country_code} IN ('US', 'CA', 'DE', 'FR', 'GB')
    ) ;;
  }
}


explore: new_profile {
  sql_always_where: ${submission_timestamp_date} > date(2020, 7, 1) ;;
}


explore: country_codes_v1 {
  hidden: yes
}

explore: country_buckets {}
