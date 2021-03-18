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
}

view: install__metadata__header__parsed_x_source_tags {
  dimension: install__metadata__header__parsed_x_source_tags {
    type: string
    sql: install__metadata__header__parsed_x_source_tags ;;
  }
}
