view: country_codes_v1 {
  sql_table_name: `mozdata.static.country_codes_v1`
    ;;

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}
