view: forecast_desktopDAU {
  derived_table: {
    sql: SELECT
      a.*,
      b.* EXCEPT (date),
      CASE when a.dau > b.yhat_upper THEN 'above trend'
           when a.dau < b.yhat_lower THEN 'below trend'
           when a.dau BETWEEN b.yhat_lower AND b.yhat_upper THEN 'within trend'
           else 'error'
          END
            as status,
      (a.dau - b.yhat_lower) / b.yhat_lower * 100 as lower_diff_pct,
      (a.dau - b.yhat_upper) / b.yhat_upper * 100 as upper_diff_pct

    FROM

    (SELECT
          submission_date,
          sum(dau) as dau
      FROM
          `mozdata.telemetry.firefox_desktop_usage_2021`
      GROUP BY 1) a

    LEFT JOIN

    (SELECT
          date,
          yhat_lower,
          yhat_upper
        FROM
          `mozdata.analysis.loines_desktop_dau_forecast_2021-05-13`) b

    ON (a.submission_date = b.date)
         ;;
  }

######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: status {
    type:string
    sql: ${TABLE}.status;;
  }

######################################################

  measure: dau {
    type:sum
    sql: ${TABLE}.dau;;
    drill_fields: [detail*]
  }

  measure: yhat_lower {
    type:sum
    sql: ${TABLE}.yhat_lower;;
    drill_fields: [detail*]
  }

  measure: yhat_upper {
    type:sum
    sql: ${TABLE}.yhat_upper;;
    drill_fields: [detail*]
  }


  measure: lower_diff_pct {
    type:sum
    sql: ${TABLE}.lower_diff_pct;;
    value_format: "#.00"
    precision: 2
    drill_fields: [detail*]
  }

  measure: upper_diff_pct {
  type:sum
  sql: ${TABLE}.upper_diff_pct;;
    value_format: "#.00"
    precision: 2
  drill_fields: [detail*]
}


######################################################

  set: detail {
    fields: [submission_date]
  }
}


######################################################
######################################################
######################################################


view: forecast_desktopNP {
  derived_table: {
    sql: SELECT
      a.*,
      b.* EXCEPT (date),
      CASE when a.new_profiles > b.yhat_upper THEN 'above trend'
           when a.new_profiles < b.yhat_lower THEN 'below trend'
           when a.new_profiles BETWEEN b.yhat_lower AND b.yhat_upper THEN 'within trend'
           else 'error'
          END
            as status,
      (a.new_profiles - b.yhat_lower) / b.yhat_lower * 100 as lower_diff_pct,
      (a.new_profiles - b.yhat_upper) / b.yhat_upper * 100 as upper_diff_pct
    FROM

    (SELECT
          submission_date,
          sum(new_profiles) as new_profiles
      FROM
          `mozdata.telemetry.firefox_desktop_usage_2021`
      GROUP BY 1) a

    LEFT JOIN

    (SELECT
          date,
          yhat_lower,
          yhat_upper
        FROM
          `mozdata.analysis.loines_desktop_new_profiles_forecast_2021-05-13`) b

    ON (a.submission_date = b.date)

         ;;
  }

######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: status {
    type:string
    sql: ${TABLE}.status;;
  }

######################################################

  measure: new_profiles {
    type:sum
    sql: ${TABLE}.new_profiles;;
    drill_fields: [detail*]
  }

  measure: yhat_lower {
    type:sum
    sql: ${TABLE}.yhat_lower;;
    drill_fields: [detail*]
  }

  measure: yhat_upper {
    type:sum
    sql: ${TABLE}.yhat_upper;;
    drill_fields: [detail*]
  }

  measure: lower_diff_pct {
    type:sum
    sql: ${TABLE}.lower_diff_pct;;
    value_format: "#.00"
    precision: 2
    drill_fields: [detail*]
  }

  measure: upper_diff_pct {
    type:sum
    sql: ${TABLE}.upper_diff_pct;;
    value_format: "#.00"
    precision: 2
    drill_fields: [detail*]
  }



######################################################

  set: detail {
    fields: [submission_date]
  }
}
