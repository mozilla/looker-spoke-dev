- dashboard: live_data
  title: Live Data
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  elements:
    - title: Live Data Test
      name: hello_world
      model: live_data
      explore: live_data
      type: looker_line
      fields: [live_data.time, live_data.enroll_count]
      row: 2
      col: 1
      width: 24
      height: 8
