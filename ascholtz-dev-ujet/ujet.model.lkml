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
