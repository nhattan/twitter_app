$ ->
  $(document).on 'click', '.follow-button-combo.is-following .btn', (event) ->
    event.preventDefault()
    _this = $(this)
    user_id = _this.data('userId')
    $.ajax
      url: '/friends/' + user_id
      dataType: 'JSON'
      type: 'DELETE'
      data:
        user_id: user_id
      success: (data) ->
        result = data.result
        if result
          _this.parent().removeClass('is-following')
          _this.parent().addClass('not-following')
        return
    return

  $(document).on 'click', '.follow-button-combo.not-following .btn', (event) ->
    event.preventDefault()
    _this = $(this)
    user_id = _this.data('userId')
    $.ajax
      url: '/friends'
      dataType: 'JSON'
      type: 'POST'
      data:
        user_id: user_id
      success: (data) ->
        result = data.result
        if result
          _this.parent().removeClass('not-following')
          _this.parent().addClass('is-following')
        return
    return