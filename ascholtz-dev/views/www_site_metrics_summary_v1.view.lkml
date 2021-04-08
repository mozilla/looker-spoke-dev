view: www_site_metrics_summary_v1 {
  sql_table_name: `moz-fx-data-marketing-prod.ga_derived.www_site_metrics_summary_v1`
    ;;

  dimension: ad_content {
    type: string
    sql: ${TABLE}.ad_content ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: downloads {
    type: number
    sql: ${TABLE}.downloads ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: non_fx_downloads {
    type: number
    sql: ${TABLE}.non_fx_downloads ;;
  }

  dimension: non_fx_sessions {
    type: number
    sql: ${TABLE}.non_fx_sessions ;;
  }

  dimension: operating_system {
    type: string
    sql: ${TABLE}.operating_system ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: standardized_country_name {
    type: string
    sql: ${TABLE}.standardized_country_name ;;
  }

  measure: count {
    type: count
    drill_fields: [standardized_country_name]
  }
}
