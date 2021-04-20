view: new_profile {
  sql_table_name: `mozdata.telemetry.new_profile`
    ;;

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
    hidden: yes
    type: string
    sql:${TABLE}.client_id ;;
  }

  dimension: normalized_country_code {
    hidden: yes
    type: string
    sql: ${TABLE}.normalized_country_code ;;
  }

  dimension: succeeded {
    hidden: yes
    type: yesno
    sql: ${TABLE}.succeeded ;;
  }

  dimension: silent {
    hidden: yes
    type: yesno
    sql: ${TABLE}.silent ;;
  }

  dimension: attribution_source {
    hidden: yes
    type: string
    sql: ${TABLE}.environment.settings.attribution.source ;;
  }

  dimension: distribution_id {
    hidden: yes
    type: number
    sql: ${TABLE}.environment.partner.distribution_id ;;
  }

  dimension: attribution_ua {
    hidden: yes
    type: string
    sql: coalesce(${TABLE}.environment.settings.attribution.ua, "")  ;;
  }

  dimension: channel {
    hidden: yes
    type: string
    sql: ${TABLE}.normalized_channel ;;
  }

  dimension: build_id {
    hidden: yes
    type: string
    sql: ${TABLE}.application.build_id ;;
  }

  dimension: os {
    hidden: yes
    type: string
    sql:  ${TABLE}.normalized_os ;;
  }

  dimension: startup_profile_selection_reason {
    hidden: yes
    type: string
    sql: ${TABLE}.payload.processes.parent.scalars.startup_profile_selection_reason  ;;
  }

  dimension: rn {
    hidden: yes
    type: number
    sql: SELECT ROW_NUMBER() OVER (PARTITION BY client_id) ;;
  }

  filter: date_filter {
    type: date
  }

  dimension: previous_period_date {
    type: date
    sql: DATE(DATE_DD(${submission_timestamp_date}, INTERVAL DATE_DIFF(DATE({% date_start date_filter%}), DATE({% date_end date_filter%}), DAY) DAY)) ;;
  }

  measure: new_profiles {
    type: count
    filters: [startup_profile_selection_reason: "firstrun-created-default"]
  }
}
