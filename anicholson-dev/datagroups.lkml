datagroup: test_datagroup {
  sql_trigger:
    SELECT MAX(last_modified_time)
    FROM `moz-fx-data-shared-prod`.telemetry_derived.INFORMATION_SCHEMA.PARTITIONS
    WHERE table_name = "clients_daily_v6" ;;
  label: "Test Datagroup"
  interval_trigger: "10 minutes"
}
