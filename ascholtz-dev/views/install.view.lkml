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

  dimension: previous_period_date {
    type: date
    sql: DATE(DATE_ADD(${submission_timestamp_date}, INTERVAL DATE_DIFF(DATE({% date_start submission_timestamp_date%}), DATE({% date_end submission_timestamp_date%}), DAY) DAY)) ;;
  }

  dimension: next_period_date {
    type: date
    sql: DATE(DATE_SUB(${submission_timestamp_date}, INTERVAL DATE_DIFF(DATE({% date_start submission_timestamp_date%}), DATE({% date_end submission_timestamp_date%}), DAY) DAY)) ;;
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
