# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: stripe_customers {
  hidden: yes

  join: stripe_customers__metadata {
    view_label: "Customers: Metadata"
    sql: LEFT JOIN UNNEST(${stripe_customers.metadata}) as customers__metadata ;;
    relationship: one_to_many
  }
}

view: stripe_customers {
  sql_table_name: `mozdata.stripe.customers`
    ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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
    sql: ${TABLE}.created ;;
  }

  dimension: metadata {
    hidden: yes
    sql: ${TABLE}.metadata ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}

view: stripe_customers__metadata {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
