view: session {
  sql_table_name: `moz-fx-data-marketing-prod.ga_derived.www_site_metrics_summary_v1`
    ;;

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: downloads {
    hidden: yes
    type: number
    sql: ${TABLE}.downloads ;;
  }

  dimension: non_fx_downloads {
    hidden: yes
    type: number
    sql: ${TABLE}.non_fx_downloads ;;
  }

  dimension: non_fx_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.non_fx_sessions ;;
  }

  dimension: operating_system {
    hidden: yes
    type: string
    sql: ${TABLE}.operating_system ;;
  }

  dimension: sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: standardized_country_name {
    hidden: yes
    type: string
    sql: ${TABLE}.standardized_country_name ;;
  }

  dimension: previous_period_date {
    type: date
    sql: DATE(DATE_ADD(${date_date}, INTERVAL DATE_DIFF(DATE({% date_start date_date%}), DATE({% date_end date_date%}), DAY) DAY)) ;;
  }

  measure: total_non_fx_sessions {
    type: sum
    sql: ${TABLE}.non_fx_sessions ;;
  }

  measure: total_non_fx_downloads {
    type: sum
    sql: ${TABLE}.non_fx_downloads ;;
  }
}
