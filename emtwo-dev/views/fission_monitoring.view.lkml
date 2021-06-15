view: fission_monitoring {
  sql_table_name: `mozdata.analysis.fission_monitoring_analyzed_v1` ;;

  dimension: build_id {
     type: date
     sql:
      PARSE_DATE('%Y%m%d', CAST(${TABLE}.build_id AS STRING));;
  }

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }

  dimension: probe {
    type: string
    sql: ${TABLE}.probe ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  measure: est {
    type: sum
    sql: ${TABLE}.est ;;
  }

  measure: low {
    type: sum
    sql: ${TABLE}.low ;;
  }

  measure: high {
    type: sum
    sql: ${TABLE}.high ;;
  }

}

# view: fission_monitoring {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
