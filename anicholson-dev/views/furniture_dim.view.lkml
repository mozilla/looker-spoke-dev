view: furniture_dim {
  sql_table_name: anich-sandbox-2.test_dataset.furniture_dim ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: price {
    type: sum
    sql: ${TABLE}.price ;;
  }
}
