  label: "Numbers that Matter"

connection: "telemetry"

include: "views/*.view.lkml"
include: "dashboards/*.dashboard"

explore: country_buckets {
  hidden: yes
}

explore: releases {}

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
    sql_where: ${country_buckets.code} = ${install.normalized_country_code} ;;
  }
}

explore: new_profile {
  view_name: new_profile
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
    ${attribution_ua} != "firefox" AND
    ${startup_profile_selection_reason} = "firstrun-created-default";;
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: ${country_buckets.code} = ${new_profile.normalized_country_code} ;;
  }
  join: prev_new_profile {
    from:  new_profile
    type: full_outer
    relationship: one_to_one
    sql_on: ${new_profile.submission_timestamp_date} = DATE(DATE_ADD(${prev_new_profile.submission_timestamp_date}, INTERVAL DATE_DIFF(DATE({% date_start new_profile.submission_timestamp_date%}), DATE({% date_end new_profile.submission_timestamp_date%}), DAY) DAY)) AND
    ${new_profile.normalized_country_code} = ${prev_new_profile.normalized_country_code};;
    sql_where:
      DATE(${prev_new_profile.submission_timestamp_raw}) BETWEEN DATE({% date_start new_profile.submission_timestamp_date%}) AND DATE_ADD(DATE({% date_end new_profile.submission_timestamp_date%}), INTERVAL DATE_DIFF(DATE({% date_start new_profile.submission_timestamp_date%}), DATE({% date_end new_profile.submission_timestamp_date%}), DAY) DAY)  ;;
  }
}

explore: session {
  sql_always_where: ${operating_system} = "Windows" and ${browser} != "Mozilla" ;;
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: (
      (${session.standardized_country_name} = "USA" AND ${country_buckets.code} = "US") OR
      (${country_buckets.code} = "GB" AND ${session.standardized_country_name} = "United Kingdom") OR
      (${country_buckets.code} = "DE" AND ${session.standardized_country_name} = "Germany") OR
      (${country_buckets.code} = "FR" AND ${session.standardized_country_name} = "France") OR
      (${country_buckets.code} = "CA" AND ${session.standardized_country_name} = "Canada") OR
      (${country_buckets.code} = "BR" AND ${session.standardized_country_name} = "Brazil") OR
      (${country_buckets.code} = "MX" AND ${session.standardized_country_name} = "Mexico") OR
      (${country_buckets.code} = "CN" AND ${session.standardized_country_name} = "China") OR
      (${session.standardized_country_name} NOT IN ("USA", "Germany", "United Kingdom", "France", "Canada", "Mexico", "China", "Brazil") AND ${country_buckets.bucket} IN ("non-tier-1", "Overall") AND ${country_buckets.code} = "OTHER" ));;
  }
}

explore: activation {
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
    ${attribution_ua} != "firefox" AND
    ${startup_profile_selection_reason} = "firstrun-created-default";;
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: ${country_buckets.code} = ${activation.normalized_country_code} ;;
  }
}
