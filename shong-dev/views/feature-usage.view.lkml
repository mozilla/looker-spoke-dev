view: feature_usage {
  derived_table: {
    sql: SELECT
          submission_date,
          CASE WHEN scalar_parent_os_environment_is_taskbar_pinned = true THEN 1 ELSE 0 END as browser_pinned,
          CASE WHEN is_default_browser = true THEN 1 ELSE 0 END as browser_default
        FROM
          `moz-fx-data-shared-prod.telemetry.clients_daily`
        WHERE
          normalized_channel = 'release'
          AND submission_date >= '2021-03-23'
         ;;
  }

######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

######################################################

  measure: browser_pinned {
    type:sum
    sql: ${TABLE}.browser_pinned;;
    drill_fields: [detail*]
  }

  measure: browser_default {
    type:sum
    sql: ${TABLE}.browser_default;;
    drill_fields: [detail*]
  }

######################################################

  set: detail {
    fields: [submission_date]
  }
}
