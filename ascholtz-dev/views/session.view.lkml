view: session {
  derived_table: {
    sql:
      SELECT
        DATE(date) AS submission_date,
        CASE standardized_country_name
          WHEN "USA" THEN "US"
          WHEN "United Kingdom" THEN "GB"
          WHEN "Germany" THEN "DE"
          WHEN "France" THEN "FR"
          WHEN "Canada" THEN "CA"
          WHEN "Brazil" THEN "BR"
          WHEN "Mexico" THEN "MX"
          WHEN "China" THEN "CN"
          ELSE "OTHER"
        END
        AS country_code,
        SUM(non_fx_sessions) AS non_fx_sessions,
        SUM(non_fx_downloads) AS non_fx_downloads
      FROM `moz-fx-data-marketing-prod.ga_derived.www_site_metrics_summary_v1`
      WHERE
        operating_system = "Windows" AND browser != "Mozilla"
      GROUP BY
        submission_date,
        country_code;;
  }

  dimension: submission_date {
    type: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: country_code {
    hidden: yes
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: non_fx_sessions_count {
    hidden: yes
    type: number
    sql: ${TABLE}.non_fx_sessions ;;
  }

  dimension: non_fx_downloads_count {
    hidden: yes
    type: number
    sql: ${TABLE}.non_fx_downloads ;;
  }

  measure: non_fx_sessions {
    type: sum
    sql: ${non_fx_sessions_count} ;;
  }

  measure: non_fx_downloads {
    type: sum
    sql: ${non_fx_downloads_count} ;;
  }
}
