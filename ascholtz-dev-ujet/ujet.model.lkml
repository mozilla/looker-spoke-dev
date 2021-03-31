connection: "telemetry"

include: "//looker-hub/user_journey/views/events_daily.view.lkml"
include: "views/*.view.lkml"

explore: funnel_analysis {
  view_label: " User-Day Funnels"
  join: days_of_use {
    view_label: "Days of Use"
    relationship: one_to_one
    type: left_outer
    sql_on: ${funnel_analysis.sample_id} = ${days_of_use.sample_id}
        AND ${funnel_analysis.client_id} = ${days_of_use.client_id}
        AND (${funnel_analysis.submission_date} = DATE_SUB(${days_of_use.submission_date}, INTERVAL 56 DAY)
              OR (${days_of_use.submission_date} = DATE_SUB(current_date, INTERVAL 2 DAY)
                  AND DATE_ADD(${funnel_analysis.submission_date}, INTERVAL 56 DAY) >  DATE_SUB(current_date, INTERVAL 2 DAY)));;
  }
  join: event_type_1 {
    relationship: many_to_one
    type: cross
  }
  join: event_type_2 {
    relationship: many_to_one
    type: cross
  }
  join: event_type_3 {
    relationship: many_to_one
    type: cross
  }
  join: event_type_4 {
    relationship: many_to_one
    type: cross
  }
  join: all_event_types {
    relationship: many_to_one
    type: cross
  }
  always_filter: {
    filters: [
      date: "14 days",
      # Caret tells Looker to use "Is Equal To" matching rather than "Matches (advanced)"
      event_type_1.message_id: "ABOUT^_WELCOME",
      event_type_1.event_type: "IMPRESSION",
    ]
  }

  query: about_welcome_click {
    filters: [
      funnel_analysis.submission_date: "14 days",
      event_type_1.event_type: "IMPRESSION",
      event_type_1.message_id: "ABOUT^_WELCOME",
      event_type_2.event_type: "CLICK^_BUTTON",
      event_type_2.message_id: "ABOUT^_WELCOME",
    ]
    pivots: []
    dimensions: [funnel_analysis.submission_date]
    measures: [funnel_analysis.count_user_days_event1, funnel_analysis.count_user_days_event2]
    label: "About Welcome Funnel: Impression to Click"
  }

  query: about_welcome_click_dou {
    filters: [
      funnel_analysis.submission_date: "14 days",
      event_type_1.event_type: "IMPRESSION",
      event_type_1.message_id: "ABOUT^_WELCOME",
      event_type_2.event_type: "CLICK^_BUTTON",
      event_type_2.message_id: "ABOUT^_WELCOME",
      funnel_analysis.completed_event_1: "yes",
      days_of_use.7_day_avg_days_of_use: ">0"
    ]
    pivots: [completed_event_2]
    dimensions: [funnel_analysis.submission_date, completed_event_2]
    measures: [days_of_use.7_day_avg_days_of_use]
    label: "About Welcome Funnel: 7-day DOU"
  }

  sql_always_where: funnel_analysis.submission_date > "2010-01-01" ;;
}

explore: all_event_types {
  join: event_type_1 {
    relationship: many_to_one
    type: cross
  }
  join: event_type_2 {
    relationship: many_to_one
    type: cross
  }
  join: event_type_3 {
    relationship: many_to_one
    type: cross
  }
  join: event_type_4 {
    relationship: many_to_one
    type: cross
  }
}

explore: event_names {
  hidden: yes
  from: raw_event_types
}

explore: events_daily_sample {
  hidden: yes
  from: events_daily
  sql_always_where:
    events_daily_sample.submission_date >= DATE_SUB(current_date, INTERVAL 7 DAY)
    AND events_daily_sample.sample_id = 42;;
}

explore: event_property_page {
  from: raw_event_types
  hidden: yes
  sql_always_where: property_name = 'page';;
}

explore: event_property_source {
  hidden: yes
  from: raw_event_types
  sql_always_where: property_name = 'source';;
}

explore: event_property_domState {
  hidden: yes
  from: raw_event_types
  sql_always_where: property_name = 'domState';;
}

explore: event_property_reason {
  hidden: yes
  from: raw_event_types
  sql_always_where: property_name = 'reason';;
}

explore: event_property_display {
  hidden: yes
  from: raw_event_types
  sql_always_where: property_name = 'display';;
}
