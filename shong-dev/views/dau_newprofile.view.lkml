view: dau_desktop {
  derived_table: {
    sql:
    WITH BASE AS
  (SELECT submission_date,
          os AS Desktop_OS,
          CASE
              WHEN country IN ('AR',
                               'PH',
                               'TR',
                               'CO',
                               'US',
                               'DE',
                               'FR',
                               'CN',
                               'PL',
                               'IN',
                               'RU',
                               'BR',
                               'IT',
                               'ID',
                               'GB',
                               'ES',
                               'JP',
                               'CA',
                               'VN',
                               'MX') THEN country
              ELSE 'ROW'
          END AS country,
          sum(dau) AS dau,
          sum(new_profiles) AS new_profiles
   FROM `mozdata.telemetry.firefox_desktop_usage_2021`
   WHERE submission_date >= '2019-12-20'
   GROUP BY 1,
            2,
            3
   ORDER BY 1,
            2,
            3),
     BASE_APPENDED AS
  (SELECT *,
          EXTRACT(DAYOFYEAR
                  FROM date(submission_date)) AS doy,
          EXTRACT(YEAR
                  FROM date(submission_date)) AS YEAR,
          AVG(dau) OVER (PARTITION BY Desktop_OS,
                                      country
                         ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS dau_smoothed,
                        AVG(new_profiles) OVER (PARTITION BY Desktop_OS,
                                                             country
                                                ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS new_profiles_smoothed
   FROM BASE)
SELECT a.submission_date,
       a.Desktop_OS,
       a.country,
       a.dau AS dau_2021,
       a.new_profiles AS new_profiles_2021,
       a.dau_smoothed AS dau_smoothed_2021,
       a.new_profiles_smoothed AS new_profiles_smoothed_2021,
       b.dau AS dau_2020,
       b.new_profiles AS new_profiles_2020,
       b.dau_smoothed AS dau_smoothed_2020,
       b.new_profiles_smoothed AS new_profiles_smoothed_2020
FROM
  (SELECT *
   FROM BASE_APPENDED
   WHERE YEAR = 2021) a
LEFT JOIN
  (SELECT *
   FROM BASE_APPENDED
   WHERE YEAR = 2020) b ON (a.doy = b.doy
                            AND a.Desktop_OS = b.Desktop_OS
                            AND a.country = b.country)
       ;;
  }


######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: desktop_OS {
    type: string
    sql: ${TABLE}.desktop_OS ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

######################################################

  measure: DAU_2021 {
    type:sum
    sql: ${TABLE}.DAU_2021;;
  }

  measure: new_profiles_2021 {
    type: sum
    sql: ${TABLE}.new_profiles_2021;;
  }

  measure: DAU_smoothed_2021 {
    type:sum
    sql: ${TABLE}.DAU_smoothed_2021;;
  }

  measure: new_profiles_smoothed_2021 {
    type: sum
    sql: ${TABLE}.new_profiles_smoothed_2021;;
  }

  measure: DAU_2020 {
    type:sum
    sql: ${TABLE}.DAU_2020;;
  }

  measure: new_profiles_2020 {
    type: sum
    sql: ${TABLE}.new_profiles_2020;;
  }

  measure: DAU_smoothed_2020 {
    type:sum
    sql: ${TABLE}.DAU_smoothed_2020;;
  }

  measure: new_profiles_smoothed_2020 {
    type: sum
    sql: ${TABLE}.new_profiles_smoothed_2020;;
  }


######################################################

}
