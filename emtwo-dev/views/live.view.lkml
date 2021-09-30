view: live {
  derived_table: {
    sql:
      select
          timestamp_millis(cast(unix_millis(window_start) / 1800000 as int64)*1800000) as time,
          enroll_count
      from `moz-fx-data-shared-prod.telemetry_derived.experiment_enrollment_aggregates_live_v1`
      where experiment = "user-messaging-trackers-blocked-notification"
      and
        (`type` = 'preference_rollout' OR `type` = 'addon_study' OR (`type` != 'preference_rollout' AND branch is not null))
      order by 1
      ;;
    }

    dimension: time {
      type: date_time
      sql: ${TABLE}.time ;;
    }

    measure: enroll_count {
      type: number
      sql: SUM(${TABLE}.enroll_count) ;;
    }
}
