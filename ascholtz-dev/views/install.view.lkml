view: install {
  sql_table_name: `mozdata.firefox_installer.install`
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

  filter: date {
    type: date
  }

  dimension: had_old_install {
    hidden: yes
    type: yesno
    sql: ${TABLE}.had_old_install ;;
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

  dimension: attribution {
    hidden: yes
    type: string
    sql: IF(${TABLE}.attribution IS NULL, "Unknown", SPLIT(SPLIT(${TABLE}.attribution, '26ua%3D')[SAFE_OFFSET(1)], '%')[SAFE_OFFSET(0)]) ;;
  }

  dimension: build_channel {
    hidden: yes
    type: string
    sql: ${TABLE}.build_channel ;;
  }

  dimension: build_id {
    hidden: yes
    type: string
    sql: ${TABLE}.build_id ;;
  }

  parameter: previous_time_period {
    type: yesno
    description: "Flag to determine whether data from the previous time period should be used. This is to improve filtering."
    default_value: "no"
  }

  dimension: period_date {
    description: "Date of the relevant time period."
    type: date
    sql: IF({% parameter previous_time_period %}, DATE(DATE_ADD(${submission_timestamp_date}, INTERVAL DATE_DIFF(DATE({% date_start submission_timestamp_date%}), DATE({% date_end submission_timestamp_date%}), DAY) DAY)), ${submission_timestamp_date}) ;;
  }

  measure: new_installs {
    type: count
    filters: [had_old_install: "no"]
  }

  measure: paveovers {
    type: count
    filters: [had_old_install: "yes"]
  }
}
