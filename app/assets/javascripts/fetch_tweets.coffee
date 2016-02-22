@humanize_time = ->
  $('.timestring').each ->
    $(this).text moment($(this).data('createdAt')).fromNow()
    return
  return

$ ->
  humanize_time()
  return

$ ->
  $('#notification').on 'click', (event) ->
    event.preventDefault()
    $('#notification').parent().addClass('hidden')
    $('.tweet.hidden').removeClass('hidden')
    document.title = 'Tweeter'
    return

  if $('#tweets').length > 0
    setInterval ->
      if $('.tweet').length > 0
        since_id = $('#since_id').val()
        $.getScript '/?since_id=' + since_id
    , 60000
    return

$ ->
  $('#more_tweets').on 'click', (event) ->
    event.preventDefault()
    max_id = $(this).data('maxId')
    if max_id
      $.getScript '/?max_id=' + max_id
    return
