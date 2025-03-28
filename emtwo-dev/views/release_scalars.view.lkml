view: release_scalars {
  derived_table: {
    sql:
      SELECT *
      FROM `moz-fx-data-shared-prod.operational_monitoring.bug_1732206_rollout_fission_release_rollout_release_94_95_scalar`
      WHERE agg_type = "SUM"
      ;;
  }

  dimension: submission_date {
    type: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }

  dimension: os {
    type: string
    hidden: yes
    sql: ${TABLE}.os ;;
  }

  dimension: cores_count {
    type: string
    hidden: yes
    sql: ${TABLE}.cores_count ;;
  }

  dimension: probe {
    type: string
    hidden: yes
    sql: ${TABLE}.probe ;;
  }

  parameter: percentile_conf {
    label: "Percentile"
    type: number
    default_value: "50.0"
  }

  measure: percentile {
    type: number
    sql: `moz-fx-data-shared-prod`.udf_js.jackknife_percentile_ci(
      {% parameter percentile_conf %},
      STRUCT<values ARRAY<STRUCT<key FLOAT64, value FLOAT64>>>(mozfun.map.sum(
        ARRAY_AGG(STRUCT<key FLOAT64, value FLOAT64>(SAFE_CAST(COALESCE(${TABLE}.value, 0.0) AS FLOAT64), 1))
      ))
    ).percentile ;;
  }

  measure: percentile_low {
    type: number
    sql: `moz-fx-data-shared-prod`.udf_js.jackknife_percentile_ci(
      {% parameter percentile_conf %},
      STRUCT<values ARRAY<STRUCT<key FLOAT64, value FLOAT64>>>(mozfun.map.sum(
        ARRAY_AGG(STRUCT<key FLOAT64, value FLOAT64>(SAFE_CAST(COALESCE(${TABLE}.value, 0.0) AS FLOAT64), 1))
      ))
    ).low ;;
  }

  measure: percentile_high {
    type: number
    sql: `moz-fx-data-shared-prod`.udf_js.jackknife_percentile_ci(
      {% parameter percentile_conf %},
      STRUCT<values ARRAY<STRUCT<key FLOAT64, value FLOAT64>>>(mozfun.map.sum(
        ARRAY_AGG(STRUCT<key FLOAT64, value FLOAT64>(SAFE_CAST(COALESCE(${TABLE}.value, 0.0) AS FLOAT64), 1))
      ))
    ).high ;;
  }
}
