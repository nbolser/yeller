App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.text.blank?
      upCase = data.text.toUpperCase()
      $('.messages').append('<div class="message-body">' + data.user + ': ' + upCase + '</div>')

$(document).on 'turbolinks:load', ->
  submit_message()

submit_message = () ->
  $('#message_text').on 'keydown', (event) ->
    if event.keyCode is 13
      event.preventDefault()
      $('.submit-message').click()
      event.target.value = ''