explore: combined_subscriptions {
  view_name:subscription_periods

  join: active {
    view_label: "Subscription Counts"
    sql: CROSS JOIN UNNEST(${subscription_periods.active_dates}) AS active;;
    relationship:  one_to_many
    sql_where:
      {% if active.active_count._is_selected %}
        ${active.active_date} BETWEEN DATE "2020-07-01" AND CURRENT_DATE - 1
      {% else %}
        TRUE
      {% endif %};;
  }
  join: events {
    view_label: "Subscription Events"
    sql: CROSS JOIN UNNEST(${subscription_periods.events}) AS events;;
    relationship:  one_to_many
    sql_where:
      {% if events.delta._is_selected %}
        ${events.event_date} BETWEEN DATE "2020-07-01" AND CURRENT_DATE - 1
      {% else %}
        TRUE
      {% endif %};;

  }
  join: last_7_days {
    view_label: "Last 7 Days"
    required_joins: [events]
    # to make the result sum values over the *last* week, explode event_date to impact the *next* week
    sql: CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(${events.event_date}, ${events.event_date} + 6)) AS last_7_days;;
    relationship:  one_to_many
    sql_where:
      {% if last_7_days.delta._is_selected %}
        ${last_7_days.event_date} BETWEEN DATE "2020-07-01" AND CURRENT_DATE - 1
      {% else %}
        TRUE
      {% endif %};;
  }
}

view: subscription_periods {

  derived_table: {
    sql:
      SELECT
        "FXA" AS provider,
        -- hide trials, which are currently only used for dev work
        COALESCE(DATE(trial_end), DATE(start_date)) AS start_date,
        COALESCE(DATE(ended_at), CURRENT_DATE) AS end_date,
        -- differentiate start dates
        MIN(DATE(start_date)) OVER (PARTITION BY customer) AS customer_start_date,
        -- differentiate end dates
        IF(
          cancel_at_period_end
          OR "cancelled_for_customer_at" IN (SELECT key FROM UNNEST(subscriptions.metadata)),
          "Cancelled by Customer",
          "Payment Failed"
        ) AS cancel_reason,
      FROM
        mozdata.stripe.subscriptions
      LEFT JOIN
        mozdata.stripe.plans
      ON
        (subscriptions.plan = plans.id)
      LEFT JOIN
        mozdata.stripe.products
      ON
        (plans.product = products.id)
      WHERE
        status NOT IN ("incomplete", "incomplete_expired")
        AND products.name = "Mozilla VPN"
      UNION ALL
      SELECT
        "APPLE" AS provider,
        start_date,
        LEAST(end_date, CURRENT_DATE) AS end_date,
        -- differentiate start dates
        MIN(start_date) OVER (PARTITION BY user_id) AS customer_start_date,
        -- can't differentiate end dates,
        "Cancelled by IAP" AS cancel_reason,
      FROM
        mozdata.mozilla_vpn.subscriptions
      CROSS JOIN
        UNNEST(apple_receipt.active_periods)
      WHERE
        apple_receipt.environment = "Production";;
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.provider;;
  }
  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: TIMESTAMP(${TABLE}.start_date);;
  }
  dimension_group: customer_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: TIMESTAMP(${TABLE}.customer_start_date);;
  }
  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: TIMESTAMP(${TABLE}.end_date);;
  }

  dimension: cancel_reason {
    type: string
    sql: ${TABLE}.cancel_reason;;
  }

  dimension: events {
    hidden: yes
    sql: [
      STRUCT(
        ${start_date} AS date,
        "New" AS type,
        IF(${start_raw} = ${customer_start_raw}, "New", "Resurrected") AS granular_type,
        1 AS delta
      ),
      STRUCT(
        ${end_date} AS date,
        "Cancelled" AS type,
        ${cancel_reason} AS granular_type,
        -1 AS delta
      ),
      -- repeat events for displaying net change
      STRUCT(
        ${start_date} AS date,
        "Net Paid Subscribers" AS type,
        "Net Paid Subscribers" AS granular_type,
        1 AS delta
      ),
      STRUCT(
        ${end_date} AS date,
        "Net Paid Subscribers" AS type,
        "Net Paid Subscribers" AS granular_type,
        -1 AS delta
      )
    ];;
  }

  dimension: active_dates {
    hidden: yes
    sql: GENERATE_DATE_ARRAY(
      ${subscription_periods.start_date},
      ${subscription_periods.end_date} - 1
    );;
  }
}

view: active {
  dimension_group: active {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: TIMESTAMP(${TABLE});;
  }

  measure: active_count {
    label: "Active"
    type: count
  }

}

view: events {

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: TIMESTAMP(${TABLE}.date);;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type;;
  }

  dimension: granular_type {
    type: string
    sql: ${TABLE}.granular_type;;
  }

  dimension: raw_delta {
    type: string
    hidden: yes
    sql: ${TABLE}.delta;;
  }

  measure: delta {
    type: sum
    sql: ${raw_delta};;
  }
}

view: last_7_days {

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: TIMESTAMP(${TABLE});;
  }

  filter: event_date_filter {
    default_value: "after 2020-07-01"
  }

  measure: delta {
    type: sum
    sql: ${events.raw_delta};;
  }
}
