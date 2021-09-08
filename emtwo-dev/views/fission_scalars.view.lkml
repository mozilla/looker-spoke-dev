view: fission_scalars {
  derived_table: {
    sql:
      SELECT *
      FROM `moz-fx-data-shared-prod.operational_monitoring.bug_1660366_pref_ongoing_fission_nightly_experiment_nightly_83_100_scalar`
      WHERE agg_type = "SUM"
      ;;
  }

  dimension: build_id {
    type: date
    sql:
    PARSE_DATE('%Y%m%d', CAST(${TABLE}.build_id AS STRING));;
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
      STRUCT<values ARRAY<STRUCT<key INT64, value FLOAT64>>>(mozfun.map.sum(
        ARRAY_AGG(STRUCT<key INT64, value FLOAT64>(COALESCE(${TABLE}.value, 0), 1))
      ))
    ).percentile ;;
  }

  measure: percentile_low {
    type: number
    sql: `moz-fx-data-shared-prod`.udf_js.jackknife_percentile_ci(
      {% parameter percentile_conf %},
      STRUCT<values ARRAY<STRUCT<key INT64, value FLOAT64>>>(mozfun.map.sum(
        ARRAY_AGG(STRUCT<key INT64, value FLOAT64>(COALESCE(${TABLE}.value, 0), 1))
      ))
    ).low ;;
  }

  measure: percentile_high {
    type: number
    sql: `moz-fx-data-shared-prod`.udf_js.jackknife_percentile_ci(
      {% parameter percentile_conf %},
      STRUCT<values ARRAY<STRUCT<key INT64, value FLOAT64>>>(mozfun.map.sum(
        ARRAY_AGG(STRUCT<key INT64, value FLOAT64>(COALESCE(${TABLE}.value, 0), 1))
      ))
    ).high ;;
  }
}
