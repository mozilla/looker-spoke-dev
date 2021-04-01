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
  sql_always_where: ${submission_timestamp_date} > date(2020, 7 ,1) AND
    ${succeeded} AND
    (${silent} = FALSE OR ${silent} IS NULL) AND
    ${build_channel} = "release" AND
    DATE_DIFF(  -- Only use builds from the last month
        ${submission_timestamp_date},
        SAFE.PARSE_DATE('%Y%m%d', SUBSTR(${build_id}, 0, 8)),
        MONTH
    ) <= 1 AND
    ${attribution} IN ("chrome", "ie", "edge");;
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: ${country_buckets.bucket} = "Overall" OR (
      ${country_buckets.bucket} = "tier-1" AND ${install.normalized_country_code} IN ('US', 'CA', 'DE', 'FR', 'GB')
    ) OR (
      ${country_buckets.bucket} = "non-tier-1" AND ${install.normalized_country_code} NOT IN ('US', 'CA', 'DE', 'FR', 'GB')
    ) OR ${country_buckets.bucket} = ${install.normalized_country_code} ;;
  }
}


explore: new_profile {
  sql_always_where: ${submission_timestamp_date} > date(2020, 7 ,1) AND
    ${channel} = "release" AND
    DATE_DIFF(  -- Only use builds from the last month
      ${submission_timestamp_date},
      SAFE.PARSE_DATE('%Y%m%d', SUBSTR(${build_id}, 0, 8)),
      MONTH
    ) <= 1 AND
    ${os} = "Windows" AND
    ${attribution_source} IS NOT NULL AND
    ${distribution_id} IS NULL AND
    ${attribution_ua} != "firefox";;
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: ${country_buckets.bucket} = "Overall" OR (
      ${country_buckets.bucket} = "tier-1" AND ${new_profile.normalized_country_code} IN ('US', 'CA', 'DE', 'FR', 'GB')
    ) OR (
      ${country_buckets.bucket} = "non-tier-1" AND ${new_profile.normalized_country_code} NOT IN ('US', 'CA', 'DE', 'FR', 'GB')
    ) OR ${country_buckets.bucket} = ${new_profile.normalized_country_code} ;;
  }
}

explore: session {}

explore: country_codes_v1 {
  hidden: yes
}

explore: country_buckets {}
