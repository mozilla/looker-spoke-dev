view: client_ltv {
  sql_table_name: `moz-it-eip-revenue-users`.ltv_derived.client_ltv_v1 ;;

  dimension: submission_date {
    type: date
    sql: CAST(${TABLE}.submission_date AS TIMESTAMP) ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
  }

  dimension: total_client_searches_past_year {
    type: number
  }

  dimension: ltv_ad_clicks_current {
    type: number
  }

  measure: historic_ltv {
    type: sum
    sql: ${client_ltv.ltv_ad_clicks_current} ;;
  }
}
