view: new_profile_overall {
  derived_table: {
    sql: SELECT
      DATE(submission_timestamp) AS submission_date,
      normalized_country_code,
      COUNT(*) AS new_profiles
    FROM mozdata.telemetry.new_profile
    WHERE
      DATE(submission_timestamp) > date(2020, 7 ,1) AND
      normalized_channel = "release" AND
      DATE_DIFF(  -- Only use builds from the last month
        DATE(submission_timestamp),
        SAFE.PARSE_DATE('%Y%m%d', SUBSTR(application.build_id, 0, 8)),
        MONTH
      ) <= 1 AND
      normalized_os = "Windows" AND
      environment.settings.attribution.source IS NOT NULL AND
      environment.partner.distribution_id IS NULL AND
      coalesce(environment.settings.attribution.ua, "") != "firefox" AND
      payload.processes.parent.scalars.startup_profile_selection_reason = "firstrun-created-default"
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

  measure: new_profiles_total {
    type: sum
    sql: ${new_profiles} ;;
  }
}
