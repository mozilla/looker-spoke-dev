# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: stripe_plans {
  hidden: yes

  join: stripe_plans__tiers {
    view_label: "Plans: Tiers"
    sql: LEFT JOIN UNNEST(${stripe_plans.tiers}) as plans__tiers ;;
    relationship: one_to_many
  }

  join: stripe_plans__metadata {
    view_label: "Plans: Metadata"
    sql: LEFT JOIN UNNEST(${stripe_plans.metadata}) as plans__metadata ;;
    relationship: one_to_many
  }
}

view: stripe_plans {
  sql_table_name: `mozdata.stripe.plans`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: aggregate_usage {
    type: string
    sql: ${TABLE}.aggregate_usage ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_decimal {
    type: string
    sql: ${TABLE}.amount_decimal ;;
  }

  dimension: billing_scheme {
    type: string
    sql: ${TABLE}.billing_scheme ;;
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

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension_group: event_timestamp {
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
    sql: ${TABLE}.event_timestamp ;;
  }

  dimension: interval {
    type: string
    sql: ${TABLE}.`interval` ;;
  }

  dimension: interval_count {
    type: number
    sql: ${TABLE}.interval_count ;;
  }

  dimension: livemode {
    type: yesno
    sql: ${TABLE}.livemode ;;
  }

  dimension: metadata {
    hidden: yes
    sql: ${TABLE}.metadata ;;
  }

  dimension: nickname {
    type: string
    sql: ${TABLE}.nickname ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}.object ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: tiers {
    hidden: yes
    sql: ${TABLE}.tiers ;;
  }

  dimension: tiers_mode {
    type: string
    sql: ${TABLE}.tiers_mode ;;
  }

  dimension: transform_usage__divide_by {
    type: number
    sql: ${TABLE}.transform_usage.divide_by ;;
    group_label: "Transform Usage"
    group_item_label: "Divide By"
  }

  dimension: transform_usage__round {
    type: string
    sql: ${TABLE}.transform_usage.round ;;
    group_label: "Transform Usage"
    group_item_label: "Round"
  }

  dimension: trial_period_days {
    type: number
    sql: ${TABLE}.trial_period_days ;;
  }

  dimension: usage_type {
    type: string
    sql: ${TABLE}.usage_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, nickname]
  }
}

view: stripe_plans__tiers {
  dimension: flat_amount {
    type: number
    sql: ${TABLE}.flat_amount ;;
  }

  dimension: flat_amount_decimal {
    type: string
    sql: ${TABLE}.flat_amount_decimal ;;
  }

  dimension: unit_amount {
    type: number
    sql: ${TABLE}.unit_amount ;;
  }

  dimension: unit_amount_decimal {
    type: string
    sql: ${TABLE}.unit_amount_decimal ;;
  }

  dimension: up_to {
    type: number
    sql: ${TABLE}.up_to ;;
  }
}

view: stripe_plans__metadata {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
