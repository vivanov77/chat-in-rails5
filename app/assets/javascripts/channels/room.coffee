user_signed_cookie = document.cookie.replace(/(?:(?:^|.*;\s*)user.id\s*\=\s*([^;]*).*$)|^.*$/, "$1");

user_logged_in = if user_signed_cookie then true else false

if user_logged_in
  App.room = App.cable.subscriptions.create {
          channel: "RoomChannel"
          user_signed_cookie: user_signed_cookie
        },
    connected: ->
      # Called when the subscription is ready for use on the server
   
    disconnected: ->
      # Called when the subscription has been terminated by the server
   
    received: (data) -> 

      $('#messages').append data['message']
      # Called when there's incoming data on the websocket for this channel

      $('#messages').children().slice(0,-10).remove();
   
    send_message_to_server: (name, content, _) ->
      @perform 'process_message_on_server', name: name, content: content, user_signed_cookie: user_signed_cookie

$ ->
  $('#send_form').submit (event)->
    App.room.send_message_to_server event.currentTarget['name'].value, event.currentTarget['content'].value, user_signed_cookie
    event.currentTarget['name'].value = ""
    event.currentTarget['content'].value = ""
    event.preventDefault()
    false



$(document).on 'ready', ()->
  $('#messages').children().slice(0,-10).remove();
  