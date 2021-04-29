view: aws_concurrent_ec2 {
  sql_table_name: `moz-fx-data-billing-prod-9147.test.aws_concurrent_ec2`
    ;;

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: instance_type {
    type: string
    sql: ${TABLE}.instance_type ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: running_instances {
    type: number
    sql: ${TABLE}.running_instances ;;
  }

  dimension_group: usage_start {
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
    sql: ${TABLE}.usage_start_time ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name]
  }
}
