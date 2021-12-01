view: merino_histograms {
  derived_table: {
    sql:
      SELECT *
      FROM `moz-fx-data-shared-prod.operational_monitoring.merino`
      WHERE histogram IS NOT NULL
      ;;
  }

  dimension: submission_date {
    type: date
    sql:  ${TABLE}.submission_date ;;
  }

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
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
