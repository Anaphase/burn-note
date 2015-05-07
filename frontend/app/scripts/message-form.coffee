$(document).ready ->

  hash = location.hash
  $formContainer = $('#form-container')
  $messageForm = $formContainer.find('form')
  $messageContainer = $('#message-container')

  $formContainer.hide().removeClass 'hide'
  $messageContainer.hide().removeClass 'hide'

  window.onhashchange = ->
    hash = location.hash

    $.getJSON "/message/#{hash[1..]}", (response) ->
      $messageContainer.fadeOut 'slow', ->
        $message = null

        if response.error
          $message = $('<div/>').addClass('alert alert-danger').text response.error
        else
          $message = $('<blockquote/>').text response.message

        $messageContainer.html($message).fadeIn 'slow'

  if hash
    window.onhashchange()
  else

    $formContainer.fadeIn 'slow'

    $messageForm.submit (event) ->
      request = $.ajax
        method: 'post'
        url: '/message'
        data: $messageForm.serialize()

      event.preventDefault()

      $formContainer.fadeOut 'slow', ->
        request.done (response) ->
          $messageContainer
            .text "#{location.href}\##{response.id}"
            .fadeIn 'slow'
