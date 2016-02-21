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
      else
        after = 0
      $.getScript '/?since_id=' + since_id
    , 20000
    return
