Demo chat for Rails 5 using ActionCable.

----------------------------------

If using sideway client (e.g. Simple Web Socket Client for Google Chrome):

1. Connect: ws://localhost:3000/cable/

2. Subscribe: {"command":"subscribe","identifier":"{\"channel\":\"RoomChannel\"}"}

3. Send message: {"command":"message","identifier":"{\"channel\":\"RoomChannel\"}","data":"{\"name\":\"debug\",\"content\":\"debug\",\"user_signed_cookie\":\"true\",\"action\":\"process_message_on_server\"}"}