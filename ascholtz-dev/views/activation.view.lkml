view: activation {
  derived_table: {
    sql:
      WITH clients_last_seen AS (
        SELECT client_id, submission_date, days_seen_bits
        FROM `mozdata.telemetry.clients_last_seen`
        WHERE submission_date >= DATE_ADD(DATE({% date_start date_filter %}), INTERVAL 6 DAY) AND
          submission_date <= DATE_ADD(DATE({% date_end date_filter %}), INTERVAL 6 DAY)
      )
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
      ;;
  }
  filter: date_filter {
    type: date
  }

  dimension_group: submission_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.submission_timestamp ;;
  }

  dimension: client_id {
    type: string
    sql:${TABLE}.client_id ;;
  }

  dimension: normalized_country_code {
    type: string
    sql: ${TABLE}.normalized_country_code ;;
  }

  dimension: attribution_source {
    type: string
    sql: ${TABLE}.attribution_source ;;
  }

  dimension: distribution_id {
    type: number
    sql: ${TABLE}.distribution_id ;;
  }

  dimension: attribution_ua {
    type: string
    sql: ${TABLE}.attribution_ua ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: build_id {
    type: string
    sql: ${TABLE}.build_id ;;
  }

  dimension: os {
    type: string
    sql:  ${TABLE}.os ;;
  }

  dimension: startup_profile_selection_reason {
    hidden: yes
    type: string
    sql: ${TABLE}.startup_profile_selection_reason  ;;
  }

  dimension: activated {
    type: yesno
    sql: ${TABLE}.activated ;;
  }

  measure: activations {
    type: count
    filters: [startup_profile_selection_reason: "firstrun-created-default", activated: "yes"]
  }
}
