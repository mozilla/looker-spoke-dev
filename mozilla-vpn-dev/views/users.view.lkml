# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: users {
  hidden: yes

  join: users__attribution {
    view_label: "Users: Attribution"
    sql: LEFT JOIN UNNEST(${users.attribution}) as users__attribution ;;
    relationship: one_to_many
  }
}

view: users {
  sql_table_name: `mozdata.mozilla_vpn.users`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: attribution {
    hidden: yes
    sql: ${TABLE}.attribution ;;
  }

  dimension: attribution_category {
    type: string
    sql: ${TABLE}.attribution_category ;;
  }

  dimension: coarse_attribution_category {
    type: string
    sql: ${TABLE}.coarse_attribution_category ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: fxa_uid {
    type: string
    sql: ${TABLE}.fxa_uid ;;
  }

  measure: count {
    type: count
    drill_fields: [id, devices.count, mozdata_mozilla_vpn_subscriptions.count]
  }
}

view: users__attribution {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
