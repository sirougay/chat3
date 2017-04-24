App.read = App.cable.subscriptions.create "ReadChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  	$("[data-room = '#{data.room_id}']").append data["既読"]
    # Called when there's incoming data on the websocket for this channel

  send_read: ->
    @perform 'send_read'
