App.read = App.cable.subscriptions.create "ReadChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  	$("[data-read-flg = '#{data.message_id}']").prepend("既読")
    # Called when there's incoming data on the websocket for this channel

  read_message: (message_id, reader_id) ->
    @perform "read_message", {message_id: message_id, reader_id: reader_id}

  read_messages: (room_id) ->
    @perform "read_messages", {room_id: room_id}