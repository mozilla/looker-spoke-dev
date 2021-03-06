view: baseline {
  sql_table_name: `mozdata.org_mozilla_firefox.baseline`
    ;;

  dimension: additional_properties {
    type: string
    sql: ${TABLE}.additional_properties ;;
  }

  dimension: client_info__android_sdk_version {
    type: string
    sql: ${TABLE}.client_info.android_sdk_version ;;
    group_label: "Client Info"
    group_item_label: "Android Sdk Version"
  }

  dimension: client_info__app_build {
    type: string
    sql: ${TABLE}.client_info.app_build ;;
    group_label: "Client Info"
    group_item_label: "App Build"
  }

  dimension: client_info__app_channel {
    type: string
    sql: ${TABLE}.client_info.app_channel ;;
    group_label: "Client Info"
    group_item_label: "App Channel"
  }

  dimension: client_info__app_display_version {
    type: string
    sql: ${TABLE}.client_info.app_display_version ;;
    group_label: "Client Info"
    group_item_label: "App Display Version"
  }

  dimension: client_info__architecture {
    type: string
    sql: ${TABLE}.client_info.architecture ;;
    group_label: "Client Info"
    group_item_label: "Architecture"
  }

  dimension: client_info__client_id {
    type: string
    sql: ${TABLE}.client_info.client_id ;;
    group_label: "Client Info"
    group_item_label: "Client ID"
  }

  dimension: client_info__device_manufacturer {
    type: string
    sql: ${TABLE}.client_info.device_manufacturer ;;
    group_label: "Client Info"
    group_item_label: "Device Manufacturer"
  }

  dimension: client_info__device_model {
    type: string
    sql: ${TABLE}.client_info.device_model ;;
    group_label: "Client Info"
    group_item_label: "Device Model"
  }

  dimension: client_info__first_run_date {
    type: string
    sql: ${TABLE}.client_info.first_run_date ;;
    group_label: "Client Info"
    group_item_label: "First Run Date"
  }

  dimension: client_info__locale {
    type: string
    sql: ${TABLE}.client_info.locale ;;
    group_label: "Client Info"
    group_item_label: "Locale"
  }

  dimension: client_info__os {
    type: string
    sql: ${TABLE}.client_info.os ;;
    group_label: "Client Info"
    group_item_label: "OS"
  }

  dimension: client_info__os_version {
    type: string
    sql: ${TABLE}.client_info.os_version ;;
    group_label: "Client Info"
    group_item_label: "OS Version"
  }

  dimension: client_info__telemetry_sdk_build {
    type: string
    sql: ${TABLE}.client_info.telemetry_sdk_build ;;
    group_label: "Client Info"
    group_item_label: "Telemetry Sdk Build"
  }

  dimension: document_id {
    type: string
    sql: ${TABLE}.document_id ;;
  }

  dimension: events {
    hidden: yes
    sql: ${TABLE}.events ;;
  }

  dimension: metadata__geo__city {
    type: string
    sql: ${TABLE}.metadata.geo.city ;;
    group_label: "Metadata Geo"
    group_item_label: "City"
  }

  dimension: metadata__geo__country {
    type: string
    sql: ${TABLE}.metadata.geo.country ;;
    group_label: "Metadata Geo"
    group_item_label: "Country"
  }

  dimension: metadata__geo__db_version {
    type: string
    sql: ${TABLE}.metadata.geo.db_version ;;
    group_label: "Metadata Geo"
    group_item_label: "Db Version"
  }

  dimension: metadata__geo__subdivision1 {
    type: string
    sql: ${TABLE}.metadata.geo.subdivision1 ;;
    group_label: "Metadata Geo"
    group_item_label: "Subdivision1"
  }

  dimension: metadata__geo__subdivision2 {
    type: string
    sql: ${TABLE}.metadata.geo.subdivision2 ;;
    group_label: "Metadata Geo"
    group_item_label: "Subdivision2"
  }

  dimension: metadata__header__date {
    type: string
    sql: ${TABLE}.metadata.header.date ;;
    group_label: "Metadata Header"
    group_item_label: "Date"
  }

  dimension: metadata__header__dnt {
    type: string
    sql: ${TABLE}.metadata.header.dnt ;;
    group_label: "Metadata Header"
    group_item_label: "Dnt"
  }

  dimension_group: metadata__header__parsed {
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
    sql: ${TABLE}.metadata.header.parsed_date ;;
    group_label: "Metadata Header"
    group_item_label: "Parsed"
  }

  dimension: metadata__header__parsed_x_source_tags {
    hidden: yes
    sql: ${TABLE}.metadata.header.parsed_x_source_tags ;;
    group_label: "Metadata Header"
    group_item_label: "Parsed X Source Tags"
  }

  dimension: metadata__header__x_debug_id {
    type: string
    sql: ${TABLE}.metadata.header.x_debug_id ;;
    group_label: "Metadata Header"
    group_item_label: "X Debug ID"
  }

  dimension: metadata__header__x_pingsender_version {
    type: string
    sql: ${TABLE}.metadata.header.x_pingsender_version ;;
    group_label: "Metadata Header"
    group_item_label: "X Pingsender Version"
  }

  dimension: metadata__header__x_source_tags {
    type: string
    sql: ${TABLE}.metadata.header.x_source_tags ;;
    group_label: "Metadata Header"
    group_item_label: "X Source Tags"
  }

  dimension: metadata__isp__db_version {
    type: string
    sql: ${TABLE}.metadata.isp.db_version ;;
    group_label: "Metadata ISP"
    group_item_label: "Db Version"
  }

  dimension: metadata__isp__name {
    type: string
    sql: ${TABLE}.metadata.isp.name ;;
    group_label: "Metadata ISP"
    group_item_label: "Name"
  }

  dimension: metadata__isp__organization {
    type: string
    sql: ${TABLE}.metadata.isp.organization ;;
    group_label: "Metadata ISP"
    group_item_label: "Organization"
  }

  dimension: metadata__user_agent__browser {
    type: string
    sql: ${TABLE}.metadata.user_agent.browser ;;
    group_label: "Metadata User Agent"
    group_item_label: "Browser"
  }

  dimension: metadata__user_agent__os {
    type: string
    sql: ${TABLE}.metadata.user_agent.os ;;
    group_label: "Metadata User Agent"
    group_item_label: "OS"
  }

  dimension: metadata__user_agent__version {
    type: string
    sql: ${TABLE}.metadata.user_agent.version ;;
    group_label: "Metadata User Agent"
    group_item_label: "Version"
  }

  dimension: metrics__counter__events_total_uri_count {
    type: number
    sql: ${TABLE}.metrics.counter.events_total_uri_count ;;
    group_label: "Metrics Counter"
    group_item_label: "Events Total URI Count"
  }

  dimension: metrics__counter__glean_validation_metrics_ping_count {
    type: number
    sql: ${TABLE}.metrics.counter.glean_validation_metrics_ping_count ;;
    group_label: "Metrics Counter"
    group_item_label: "Glean Validation Metrics Ping Count"
  }

  dimension: metrics__datetime__glean_validation_first_run_hour {
    type: string
    sql: ${TABLE}.metrics.datetime.glean_validation_first_run_hour ;;
    group_label: "Metrics Datetime"
    group_item_label: "Glean Validation First Run Hour"
  }

  dimension: metrics__jwe {
    hidden: yes
    sql: ${TABLE}.metrics.jwe ;;
    group_label: "Metrics"
    group_item_label: "Jwe"
  }

  dimension: metrics__labeled_counter__browser_search_ad_clicks {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.browser_search_ad_clicks ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Browser Search Ad Clicks"
  }

  dimension: metrics__labeled_counter__browser_search_in_content {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.browser_search_in_content ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Browser Search In Content"
  }

  dimension: metrics__labeled_counter__browser_search_with_ads {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.browser_search_with_ads ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Browser Search with Ads"
  }

  dimension: metrics__labeled_counter__glean_error_invalid_label {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_error_invalid_label ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Glean Error Invalid Label"
  }

  dimension: metrics__labeled_counter__glean_error_invalid_overflow {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_error_invalid_overflow ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Glean Error Invalid Overflow"
  }

  dimension: metrics__labeled_counter__glean_error_invalid_state {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_error_invalid_state ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Glean Error Invalid State"
  }

  dimension: metrics__labeled_counter__glean_error_invalid_value {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_error_invalid_value ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Glean Error Invalid Value"
  }

  dimension: metrics__labeled_counter__glean_validation_pings_submitted {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_validation_pings_submitted ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Glean Validation Pings Submitted"
  }

  dimension: metrics__labeled_counter__metrics_search_count {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.metrics_search_count ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Metrics Search Count"
  }

  dimension: metrics__labeled_rate {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_rate ;;
    group_label: "Metrics"
    group_item_label: "Labeled Rate"
  }

  dimension: metrics__string__glean_baseline_locale {
    type: string
    sql: ${TABLE}.metrics.string.glean_baseline_locale ;;
    group_label: "Metrics String"
    group_item_label: "Glean Baseline Locale"
  }

  dimension: metrics__timespan__glean_baseline_duration__time_unit {
    type: string
    sql: ${TABLE}.metrics.timespan.glean_baseline_duration.time_unit ;;
    group_label: "Metrics Timespan Glean Baseline Duration"
    group_item_label: "Time Unit"
  }

  dimension: metrics__timespan__glean_baseline_duration__value {
    type: number
    sql: ${TABLE}.metrics.timespan.glean_baseline_duration.value ;;
    group_label: "Metrics Timespan Glean Baseline Duration"
    group_item_label: "Value"
  }

  dimension: normalized_app_name {
    type: string
    sql: ${TABLE}.normalized_app_name ;;
  }

  dimension: normalized_channel {
    type: string
    sql: ${TABLE}.normalized_channel ;;
  }

  dimension: normalized_country_code {
    type: string
    sql: ${TABLE}.normalized_country_code ;;
  }

  dimension: normalized_os {
    type: string
    sql: ${TABLE}.normalized_os ;;
  }

  dimension: normalized_os_version {
    type: string
    sql: ${TABLE}.normalized_os_version ;;
  }

  dimension: ping_info__end_time {
    type: string
    sql: ${TABLE}.ping_info.end_time ;;
    group_label: "Ping Info"
    group_item_label: "End Time"
  }

  dimension: ping_info__experiments {
    hidden: yes
    sql: ${TABLE}.ping_info.experiments ;;
    group_label: "Ping Info"
    group_item_label: "Experiments"
  }

  dimension_group: ping_info__parsed_end {
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
    sql: ${TABLE}.ping_info.parsed_end_time ;;
    group_label: "Ping Info"
    group_item_label: "Parsed End"
  }

  dimension_group: ping_info__parsed_start {
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
    sql: ${TABLE}.ping_info.parsed_start_time ;;
    group_label: "Ping Info"
    group_item_label: "Parsed Start"
  }

  dimension: ping_info__ping_type {
    type: string
    sql: ${TABLE}.ping_info.ping_type ;;
    group_label: "Ping Info"
    group_item_label: "Ping Type"
  }

  dimension: ping_info__reason {
    type: string
    sql: ${TABLE}.ping_info.reason ;;
    group_label: "Ping Info"
    group_item_label: "Reason"
  }

  dimension: ping_info__seq {
    type: number
    sql: ${TABLE}.ping_info.seq ;;
    group_label: "Ping Info"
    group_item_label: "Seq"
  }

  dimension: ping_info__start_time {
    type: string
    sql: ${TABLE}.ping_info.start_time ;;
    group_label: "Ping Info"
    group_item_label: "Start Time"
  }

  dimension: sample_id {
    type: number
    sql: ${TABLE}.sample_id ;;
  }

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

  measure: count {
    type: count
    drill_fields: [normalized_app_name, metadata__isp__name]
  }
}

view: baseline__events {
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: extra {
    hidden: yes
    sql: ${TABLE}.extra ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: timestamp {
    type: number
    sql: ${TABLE}.timestamp ;;
  }
}

view: baseline__metrics__jwe {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: baseline__events__extra {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: baseline__metrics__labeled_rate {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    hidden: yes
    sql: ${TABLE}.value ;;
  }
}

view: baseline__ping_info__experiments {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value__branch {
    type: string
    sql: ${TABLE}.value.branch ;;
    group_label: "Value"
    group_item_label: "Branch"
  }

  dimension: value__extra__type {
    type: string
    sql: ${TABLE}.value.extra.type ;;
    group_label: "Value Extra"
    group_item_label: "Type"
  }
}

view: baseline__metrics__labeled_rate__value {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value__denominator {
    type: number
    sql: ${TABLE}.value.denominator ;;
    group_label: "Value"
    group_item_label: "Denominator"
  }

  dimension: value__numerator {
    type: number
    sql: ${TABLE}.value.numerator ;;
    group_label: "Value"
    group_item_label: "Numerator"
  }
}

view: baseline__metadata__header__parsed_x_source_tags {
  dimension: baseline__metadata__header__parsed_x_source_tags {
    type: string
    sql: baseline__metadata__header__parsed_x_source_tags ;;
  }
}

view: baseline__metrics__labeled_counter__metrics_search_count {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: baseline__metrics__labeled_counter__browser_search_with_ads {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: baseline__metrics__labeled_counter__browser_search_ad_clicks {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: baseline__metrics__labeled_counter__glean_error_invalid_state {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: baseline__metrics__labeled_counter__glean_error_invalid_value {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: baseline__metrics__labeled_counter__glean_error_invalid_label {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: baseline__metrics__labeled_counter__browser_search_in_content {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: baseline__metrics__labeled_counter__glean_error_invalid_overflow {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: baseline__metrics__labeled_counter__glean_validation_pings_submitted {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}
