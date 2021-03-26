# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: login_flows {
  hidden: yes

  join: login_flows__fxa_uids {
    view_label: "Login Flows: Fxa Uids"
    sql: LEFT JOIN UNNEST(${login_flows.fxa_uids}) as login_flows__fxa_uids ;;
    relationship: one_to_many
  }
}

view: login_flows {
  sql_table_name: `mozdata.mozilla_vpn.login_flows`
    ;;

  dimension_group: flow_completed {
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
    sql: ${TABLE}.flow_completed ;;
  }

  dimension: flow_id {
    type: string
    sql: ${TABLE}.flow_id ;;
  }

  dimension_group: flow_started {
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
    sql: ${TABLE}.flow_started ;;
  }

  dimension: fxa_uids {
    hidden: yes
    sql: ${TABLE}.fxa_uids ;;
  }

  dimension: viewed_email_first_page {
    type: yesno
    sql: ${TABLE}.viewed_email_first_page ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: login_flows__fxa_uids {
  dimension: login_flows__fxa_uids {
    type: string
    sql: login_flows__fxa_uids ;;
  }
}
