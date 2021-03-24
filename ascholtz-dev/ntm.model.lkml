connection: "telemetry"

include: "views/*.view.lkml"
include: "dashboards/*.dashboard"

view: country_buckets {
  derived_table: {
    sql:
      SELECT bucket
      FROM UNNEST([
        "Overall", "tier-1", "non-tier-1", "US", "CA", "DE", "FR", "GB", "MX", "BR", "CN"
      ]) AS bucket;;
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
    ) OR (
      ${country_buckets.bucket} = "non-tier-1" AND ${install.normalized_country_code} NOT IN ('US', 'CA', 'DE', 'FR', 'GB')
    ) OR ${country_buckets.bucket} == ${install.normalized_country_code} ;;
  }
}


explore: new_profile {
  sql_always_where: ${submission_timestamp_date} > date(2020, 7, 1) ;;
}


explore: country_codes_v1 {
  hidden: yes
}

explore: country_buckets {}
