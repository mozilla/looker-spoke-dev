view: clients_last_seen {
  sql_table_name: `mozdata.telemetry.clients_last_seen`
    ;;

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: days_seen_bits {
    type: number
    sql: ${TABLE}.days_seen_bits ;;
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

  dimension_group: submission_timestamp_min {
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
    sql: ${TABLE}.submission_timestamp_min ;;
  }

  dimension: activated {
    type: yesno
    sql: coalesce(BIT_COUNT(${TABLE}.days_seen_bits & 0x7F), 0) >= 5 ;;
  }

  measure: total_activated {
    type: count
    filters: [activated: "yes"]
  }
}
