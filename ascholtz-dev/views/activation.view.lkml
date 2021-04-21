view: activation {
  derived_table: {
    sql:
      WITH clients_last_seen AS (
        SELECT client_id, submission_date, days_seen_bits
        FROM `mozdata.telemetry.clients_last_seen`
        WHERE submission_date >= DATE_ADD(DATE({% date_start submission_timestamp_date %}), INTERVAL 6 DAY) AND
          submission_date <= DATE_ADD(DATE({% date_end submission_timestamp_date %}), INTERVAL 6 DAY)
      ), profiles AS (
        SELECT
          new_profile.client_id,
          submission_timestamp,
          normalized_country_code,
          environment.settings.attribution.source AS attribution_source,
          environment.partner.distribution_id AS distribution_id,
          coalesce(environment.settings.attribution.ua, "") AS attribution_ua,
          normalized_channel AS channel,
          application.build_id AS build_id,
          normalized_os AS os,
          payload.processes.parent.scalars.startup_profile_selection_reason AS startup_profile_selection_reason,
          coalesce(BIT_COUNT(clients_last_seen.days_seen_bits & 0x7F), 0) >= 5 AS activated
        FROM `mozdata.telemetry.new_profile` AS new_profile
        LEFT JOIN clients_last_seen
        ON clients_last_seen.client_id = new_profile.client_id AND
          DATE_ADD(DATE(new_profile.submission_timestamp), INTERVAL 6 DAY) = clients_last_seen.submission_date
      )
      SELECT
        DATE(submission_timestamp) AS submission_date,
        normalized_country_code,
        COUNTIF(activated) AS activations
      FROM profiles
      WHERE
        DATE(submission_timestamp) > date(2020, 7 ,1) AND
        channel = "release" AND
        DATE_DIFF(  -- Only use builds from the last month
          DATE(submission_timestamp_date),
        SAFE.PARSE_DATE('%Y%m%d', SUBSTR(build_id, 0, 8)),
        MONTH
        ) <= 1 AND
        os = "Windows" AND
        attribution_source IS NOT NULL AND
        distribution_id IS NULL AND
        attribution_ua != "firefox" AND
        startup_profile_selection_reason = "firstrun-created-default";;
  }

  dimension: submission_date {
    type: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: normalized_country_code {
    hidden: yes
    type: string
    sql: ${TABLE}.normalized_country_code ;;
  }

  dimension: activation_count {
    hidden: yes
    type: number
    sql: ${TABLE}.activations ;;
  }

  measure: activations {
    type: sum
    sql: ${activation_count} ;;
  }
}
