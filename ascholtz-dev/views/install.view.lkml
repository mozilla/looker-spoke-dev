view: install {
  sql_table_name: `mozdata.firefox_installer.install`
    ;;

  dimension_group: submission_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.submission_timestamp ;;
  }

  dimension: had_old_install {
    type: yesno
    sql: ${TABLE}.had_old_install ;;
  }

  dimension: normalized_country_code {
    type: string
    sql: ${TABLE}.normalized_country_code ;;
  }

  dimension: succeeded {
    type: yesno
    sql: ${TABLE}.succeeded ;;
  }

  dimension: silent {
    type: yesno
    sql: ${TABLE}.silent ;;
  }

  dimension: attribution {
    type: string
    sql: ${TABLE}.attribution ;;
  }

  dimension: build_channel {
    type: string
    sql: ${TABLE}.build_channel ;;
  }

  dimension: build_id {
    type: string
    sql: ${TABLE}.build_id ;;
  }

  measure: new_installs {
    type: count
    filters: [had_old_install: "no"]
  }

  dimension: bucket {
    sql: CASE
      WHEN
        ${install.normalized_country_code} IN ('US', 'CA', 'DE', 'FR', 'GB')
      THEN
        [${install.normalized_country_code}, 'tier-1', 'Overall']
      WHEN
        ${install.normalized_country_code} IN ('MX', 'BR', 'CN')
      THEN
        [${install.normalized_country_code}, 'non-tier-1', 'Overall']
      ELSE
        ['non-tier-1', 'Overall']
      END ;;
  }

  measure: paveovers {
    type: count
    filters: [had_old_install: "yes"]
  }
}

view: bucketed_installs {
  derived_table: {
    sql:
    CREATE TEMP FUNCTION bucket_country(country STRING) AS (
      CASE
      WHEN
        country IN ('US', 'CA', 'DE', 'FR', 'GB')
      THEN
        [country, 'tier-1']
      WHEN
        country IN ('MX', 'BR', 'CN')
      THEN
        [country, 'non-tier-1']
      ELSE
        ['non-tier-1']
      END
    );

    SELECT * FROM install
    CROSS JOIN
    UNNEST(ARRAY_CONCAT(['Overall'], bucket_country(normalized_country_code))) AS country_group;;
  }
}
