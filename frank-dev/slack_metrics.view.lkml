view: slack_metrics {
  sql_table_name: `mozdata.analysis.slack_metrics`
    ;;

  dimension: account_created {
    type: string
    sql: ${TABLE}.Account_created ;;
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}.Account_type ;;
  }

  dimension: days_active {
    type: string
    sql: ${TABLE}.Days_active ;;
  }

  dimension: messages_posted {
    type: number
    sql: ${TABLE}.Messages_posted ;;
  }

  dimension: messages_posted_in_channels {
    type: string
    sql: ${TABLE}.Messages_posted_in_channels ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: reactions_added {
    type: string
    sql: ${TABLE}.Reactions_added ;;
  }

  dimension: what_i_do {
    type: string
    sql: ${TABLE}.What_I_Do ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
