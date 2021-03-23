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

  dimension: normalized_country_code {
    type: string
    sql: ${TABLE}.normalized_country_code ;;
  }

  dimension: succeeded {
    type: yesno
    sql: ${TABLE}.succeeded ;;
  }

  dimension: silent {
    type: yesno
    sql: ${TABLE}.silent ;;
  }

  dimension: attribution_source {
    type: string
    sql: ${TABLE}.environment.settings.attribution.source ;;
  }

  dimension: distribution_id {
    type: number
    sql: ${TABLE}.environment.partner.distribution_id ;;
  }

  dimension: attribution_ua {
    type: string
    sql: coalesce(${TABLE}.environment.settings.attribution.ua, "")  ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.normalized_channel ;;
  }

  dimension: build_id {
    type: string
    sql: ${TABLE}.application.build_id ;;
  }

  dimension: os {
    type: string
    sql:  ${TABLE}.normalized_os ;;
  }

  dimension: startup_profile_selection_reason {
    hidden: yes
    type: string
    sql: ${TABLE}.payload.processes.parent.scalars.startup_profile_selection_reason  ;;
  }

  dimension: rn {
    type: number
    sql: SELECT ROW_NUMBER() OVER (PARTITION BY client_id) ;;
  }

  measure: new_profiles {
    type: count
    filters: [startup_profile_selection_reason: "firstrun-created-default"]
  }
}
