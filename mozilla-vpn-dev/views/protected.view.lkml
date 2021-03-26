view: protected {
  sql_table_name: `mozdata.mozilla_vpn.protected`
    ;;

  dimension_group: first_protected {
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
    sql: ${TABLE}.first_protected ;;
  }

  dimension: fxa_uid {
    type: string
    sql: ${TABLE}.fxa_uid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
