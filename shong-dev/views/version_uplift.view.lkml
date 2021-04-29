view: version_uplift {
  derived_table: {
    sql: SELECT
        submission_date,
        count(distinct client_id) as cc,
        count(distinct CASE when substr(app_version, 1, 2) >= '87' then client_id else null end) as cc_latest
      FROM
        clients_daily
      WHERE
        submission_date >= '2021-03-23' -- change this to real release date
        and normalized_channel = 'release'
      GROUP BY 1
       ;;
  }


######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

######################################################

  measure: cc {
    type:sum
    sql: ${TABLE}.cc;;
    drill_fields: [detail*]
  }

  measure: cc_latest {
    type: sum
    sql: ${TABLE}.cc_latest;;
    drill_fields: [detail*]
  }

  measure: uplift {
    type: number
    sql: ${cc_latest} / ${cc} * 100;;
    drill_fields: [detail*]
  }


######################################################


  set: detail {
    fields: [submission_date]
  }
}
