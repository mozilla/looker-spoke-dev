

view: fission_with_dimensions {
  derived_table: {
    sql:
      SELECT *
      FROM `moz-fx-data-shared-prod.operational_monitoring.bug_1660366_pref_ongoing_fission_nightly_experiment_nightly_83_100`
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

  measure: median {
    type: number
    sql:
        mozfun.hist.percentiles(
          mozfun.hist.merge(
            ARRAY_AGG(
              ${TABLE}.histogram IGNORE NULLS
            )
          ),
          [0.5]
        )[SAFE_OFFSET(0)].value ;;
  }

  measure: percentile {
    type: number
    sql: `moz-fx-data-shared-prod`.udf_js.jackknife_percentile_ci(
      {% parameter percentile_conf %},
      STRUCT(
        mozfun.hist.merge(
          ARRAY_AGG(
            ${TABLE}.histogram IGNORE NULLS
          )
        ).values AS values
      )
    ).percentile ;;
  }

  measure: percentile_low {
    type: number
    sql: `moz-fx-data-shared-prod`.udf_js.jackknife_percentile_ci(
      {% parameter percentile_conf %},
      STRUCT(
        mozfun.hist.merge(
          ARRAY_AGG(
            ${TABLE}.histogram IGNORE NULLS
          )
        ).values AS values
      )
    ).low ;;
  }

  measure: percentile_high {
    type: number
    sql: `moz-fx-data-shared-prod`.udf_js.jackknife_percentile_ci(
      {% parameter percentile_conf %},
      STRUCT(
        mozfun.hist.merge(
          ARRAY_AGG(
            ${TABLE}.histogram IGNORE NULLS
          )
        ).values AS values
      )
    ).high ;;
  }
}
