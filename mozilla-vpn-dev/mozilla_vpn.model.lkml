connection: "telemetry"
label: "Mozilla VPN"

# include: "//looker-hub/mozilla_vpn/views/*.view"
include: "views/*.view"
include: "dashboards/*.dashboard"

explore: stripe_subscriptions {
  view_name: stripe_subscriptions
  always_join: [stripe_plans, stripe_products]

  join: stripe_plans {
    relationship: many_to_one
    sql_on: ${stripe_subscriptions.plan} = ${stripe_plans.id} ;;
  }
  join: stripe_products {
    relationship: many_to_one
    sql_on: ${stripe_plans.product} = ${stripe_products.id} ;;
  }
  join: stripe_subscriptions__metadata {
    view_label: "Stripe Subscriptions: Metadata"
    sql: LEFT JOIN UNNEST(${stripe_subscriptions.metadata}) as subscriptions__metadata ;;
    relationship: one_to_many
  }

  sql_always_where:
    ${stripe_subscriptions.status} NOT IN ("incomplete", "incomplete_expired")
    AND ${stripe_products.name} = "Mozilla VPN" ;;
}

explore: iap_subscriptions {
  view_name: subscriptions
  always_join: [subscriptions__apple_receipt__active_periods]
  join: subscriptions__apple_receipt__active_periods {
    view_label: "Subscriptions: Apple Receipt Active Periods"
    sql: CROSS JOIN UNNEST(${subscriptions.apple_receipt__active_periods}) as subscriptions__apple_receipt__active_periods ;;
    relationship: one_to_many
  }
  sql_always_where: ${subscriptions.apple_receipt__environment} = "Production" ;;

  ## redash sql fields
  # "APPLE" AS provider,
  # start_date,
  # LEAST(end_date, CURRENT_DATE) AS end_date,
  # -- differentiate start dates
  # MIN(start_date) OVER (PARTITION BY user_id) AS customer_start_date,
  # -- can't differentiate end dates,
  # CAST(NULL AS BOOL) AS cancelled_for_customer,
}
