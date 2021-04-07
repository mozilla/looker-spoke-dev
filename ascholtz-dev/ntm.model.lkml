connection: "telemetry"

include: "views/*.view.lkml"
include: "dashboards/*.dashboard"

view: country_buckets {
  derived_table: {
    sql:
      WITH country_codes AS (
        SELECT * FROM
            mozdata.static.country_codes_v1 c
          UNION ALL
          SELECT "OTHER" AS name, "OTHER" as code
      ),
      buckets AS (SELECT bucket
        FROM UNNEST([
          "Overall", "tier-1", "non-tier-1", "US", "CA", "DE", "FR", "GB", "MX", "BR", "CN"
        ]) AS bucket
      )
      SELECT * FROM
        country_codes c
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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
    type: cross
    relationship: many_to_one
    sql_where: ${country_buckets.code} = ${install.normalized_country_code} ;;
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
    ${attribution_ua} != "firefox" AND
    ${startup_profile_selection_reason} = "firstrun-created-default";;
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: ${country_buckets.code} = ${new_profile.normalized_country_code} ;;
  }
  join: clients_last_seen {
    type: left_outer
    relationship: one_to_one
    sql_where: ${clients_last_seen.submission_date} > date(2020, 7 ,1) ;;
    sql_on: ${clients_last_seen.client_id} = ${new_profile.client_id} AND
    ${clients_last_seen.submission_date} = DATE_ADD(${new_profile.submission_timestamp_date}, INTERVAL 6 day);;
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

explore: country_codes_v1 {
  hidden: yes
}

explore: clients_last_seen {
  hidden: yes
}
