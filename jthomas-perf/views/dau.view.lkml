view: dau {
  sql_table_name: `moz-fx-data-bq-performance.ysod.dau`
    ;;

  dimension: app_name {
    type: string
    sql: ${TABLE}.app_name ;;
  }

  dimension: app_version {
    type: string
    sql: ${TABLE}.app_version ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: dau {
    type: number
    sql: ${TABLE}.dau ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: mau {
    type: number
    sql: ${TABLE}.mau ;;
  }

  dimension: normalized_channel {
    type: string
    sql: ${TABLE}.normalized_channel ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.os_version ;;
  }

  dimension_group: submission {
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
    sql: ${TABLE}.submission_date ;;
  }

  dimension: visited_5_uri_dau {
    type: number
    sql: ${TABLE}.visited_5_uri_dau ;;
  }

  dimension: visited_5_uri_mau {
    type: number
    sql: ${TABLE}.visited_5_uri_mau ;;
  }

  dimension: visited_5_uri_wau {
    type: number
    sql: ${TABLE}.visited_5_uri_wau ;;
  }

  dimension: wau {
    type: number
    sql: ${TABLE}.wau ;;
  }

  measure: count {
    type: count
    drill_fields: [app_name]
  }
}
