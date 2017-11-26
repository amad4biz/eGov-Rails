{renderable, h1, table, tr, th, td, a} = teacup
template = renderable (data)->
    for report in data
      if report.status_id == 1
        tr ->
          td report.id
          td report.title
          td report.description
          td report.email
          td report.image_name
          td ->
            a href: '/reports/'+report.id, "Show"


App.reports = App.cable.subscriptions.create "ReportsChannel",
    received: (data) ->
      document.getElementById('live-tbody').innerHTML = template(data)
