view: new_profile_overall {
  derived_table: {
    sql: SELECT
      DATE(submission_timestamp) AS submission_date,
      normalized_country_code,
      COUNT(*) AS new_profiles
    FROM mozdata.telemetry.new_profile
    WHERE
      DATE(submission_timestamp) > date(2020, 7 ,1) AND
      channel = "release" AND
      DATE_DIFF(  -- Only use builds from the last month
        DATE(submission_timestamp),
        SAFE.PARSE_DATE('%Y%m%d', SUBSTR(build_id, 0, 8)),
        MONTH
      ) <= 1 AND
      os = "Windows" AND
      attribution_source IS NOT NULL AND
      distribution_id IS NULL AND
      attribution_ua != "firefox" AND
      startup_profile_selection_reason = "firstrun-created-default"
    GROUP BY
      submission_date,
      normalized_country_code;;
  }

  dimension: submission_date {
    type: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: normalized_country_code {
    type: string
    sql: ${TABLE}.normalized_country_code ;;
  }

  dimension: new_profiles {
    type: number
    sql: ${TABLE}.new_profiles ;;
  }
}
