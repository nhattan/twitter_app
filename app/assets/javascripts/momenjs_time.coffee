humanize_time = ->
  $('.timestring').each ->
    $(this).text moment($(this).data('createdAt')).fromNow()
    return
  return

$(document).ready ->
  humanize_time()
  return
