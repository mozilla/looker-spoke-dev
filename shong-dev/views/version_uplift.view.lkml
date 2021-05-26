view: version_uplift {
  derived_table: {
    sql: SELECT submission_date,
       CASE
           WHEN os IN ('Darwin',
                       'Linux') THEN os
           WHEN os = 'Windows_NT'
                AND os_version = '10.0' THEN 'Windows 10'
           WHEN os = 'Windows_NT'
                AND os_version != '10.0' THEN 'Windows Older'
           ELSE 'other'
       END AS os_type,
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
       count(DISTINCT client_id) AS cc,
       count(DISTINCT CASE
                          WHEN substr(app_version, 1, 2) >= '87' THEN client_id
                          ELSE NULL
                      END) AS cc_latest,
       count(DISTINCT CASE
                          WHEN NOT substr(app_version, 1, 2) >= '87' THEN client_id
                          ELSE NULL
                      END) AS cc_older
FROM telemetry.clients_daily
WHERE submission_date >= '2021-03-23' -- change this to real release date

  AND normalized_channel = 'release'
GROUP BY 1,
         2,
         3
       ;;
  }


######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: os_type {
    type: string
    sql: ${TABLE}.os_type ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
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

  measure: cc_older {
    type: sum
    sql: ${TABLE}.cc_older;;
    drill_fields: [detail*]
  }

  measure: uplift {
    type: number
    sql: ${cc_latest} / ${cc} * 100;;
    drill_fields: [detail*]
  }


######################################################


  set: detail {
    fields: [submission_date, os_type, country]
  }
}




view: version_uplift_mobile {
  derived_table: {
    sql:WITH android AS
  (SELECT submission_date,
          country,
          os,
          canonical_name,
          count(DISTINCT client_id) AS cc,
          count(DISTINCT CASE
                             WHEN SUBSTR(app_version, 1, 2) >= '88' THEN client_id
                             ELSE NULL
                         END) AS cc_latest,
          count(DISTINCT CASE
                             WHEN NOT SUBSTR(app_version, 1, 2) >= '88' THEN client_id
                             ELSE NULL
                         END) AS cc_older
   FROM telemetry.nondesktop_clients_last_seen
   WHERE submission_date >= '2021-03-23'
     AND days_since_seen = 0
     AND canonical_name IN ('Firefox for Android (Fennec)',
                            'Firefox for Android (Fenix)')
     AND normalized_channel = 'release'
   GROUP BY 1,
            2,
            3,
            4),
     IOS AS
  (SELECT submission_date,
          country,
          os,
          canonical_name,
          count(DISTINCT client_id) AS cc,
          count(DISTINCT CASE
                             WHEN SUBSTR(app_version, 1, 2) >= '33' THEN client_id
                             ELSE NULL
                         END) AS cc_latest,
          count(DISTINCT CASE
                             WHEN NOT SUBSTR(app_version, 1, 2) >= '33' THEN client_id
                             ELSE NULL
                         END) AS cc_older
   FROM telemetry.nondesktop_clients_last_seen
   WHERE submission_date >= '2021-03-23'
     AND days_since_seen = 0
     AND canonical_name IN ('Firefox for iOS')
     AND normalized_channel = 'release'
   GROUP BY 1,
            2,
            3,
            4)
SELECT *
FROM
  (SELECT *
   FROM android)
UNION ALL
  (SELECT *
   FROM IOS)
       ;;
  }


######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: canonical_name {
    type: string
    sql: ${TABLE}.canonical_name ;;
  }

######################################################

  measure: cc {
    type:sum
    sql: ${TABLE}.cc;;
  }

  measure: cc_latest {
    type: sum
    sql: ${TABLE}.cc_latest;;
  }

  measure: cc_older {
    type: sum
    sql: ${TABLE}.cc_older;;
  }

  measure: uplift {
    type: number
    sql: ${cc_latest} / ${cc} * 100;;
  }
}
