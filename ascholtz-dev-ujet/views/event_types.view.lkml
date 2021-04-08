include: "event_type.view.lkml"

view: event_type_1 {
  extends: [event_type]
}

view: event_type_2 {
  extends: [event_type]
}

view: event_type_3 {
  extends: [event_type]
}

view: event_type_4 {
  extends: [event_type]
}

view: all_event_types {
  derived_table: {
    sql: SELECT * FROM ${event_type_1.SQL_TABLE_NAME}
    UNION ALL
    SELECT * FROM ${event_type_2.SQL_TABLE_NAME}
    UNION ALL
    SELECT * FROM ${event_type_3.SQL_TABLE_NAME}
    UNION ALL
    SELECT * FROM ${event_type_4.SQL_TABLE_NAME};;
  }

  dimension: message_id {
    type: string
    sql:  ${TABLE}.category ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }
}
