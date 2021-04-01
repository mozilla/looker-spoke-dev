connection: "telemetry"

include: "views/*.view.lkml"
include: "dashboards/*.dashboard"

view: country_buckets {
  derived_table: {
    sql:
      WITH buckets AS (SELECT bucket
        FROM UNNEST([
          "Overall", "tier-1", "non-tier-1", "US", "CA", "DE", "FR", "GB", "MX", "BR", "CN"
        ]) AS bucket
      )
      SELECT * FROM
        mozdata.static.country_codes_v1 c
      CROSS JOIN buckets
      WHERE
      bucket = "Overall" OR (
        bucket = "tier-1" AND code IN ('US', 'CA', 'DE', 'FR', 'GB')
      ) OR (
        bucket = "non-tier-1" AND code NOT IN ('US', 'CA', 'DE', 'FR', 'GB')
      ) OR bucket = code;;
  }

  dimension: bucket {
    type: string
    sql: ${TABLE}.bucket ;;
  }

  dimension: code {
    type: string
    sql:  ${TABLE}.code ;;
  }
}

explore: country_buckets {}

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
    type: left_outer
    relationship: one_to_many
    sql_on: ${country_buckets.code} = ${install.normalized_country_code} ;;
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
    type: left_outer
    relationship: one_to_many
    sql_on: ${country_buckets.code} = ${new_profile.normalized_country_code} ;;
  }
}

explore: session {}

explore: country_codes_v1 {
  hidden: yes
}
