connection: "telemetry"

include: "views/*.view.lkml"
include: "dashboards/*.dashboard"

explore: install  {
  sql_always_where: ${submission_timestamp_date} > date(2020, 7 ,1) ;;
  join: country_bucket {
    type: cross
    from: install
    relationship: many_to_one
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
      END AS country_group;;
  }
}

explore: new_profile {
  sql_always_where: ${submission_timestamp_date} > date(2020, 7, 1) ;;
}

explore: country_codes_v1 {
  hidden: yes
}
