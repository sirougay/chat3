App.room = App.cable.subscriptions.create "RoomChannel",
  received: (data) ->
    $("[data-room = '#{data.room_id}']").append data["message"]

  send_message: (room_id, message) ->
    @perform "send_message", {room_id: room_id, content: message}

  $(document).on 'keypress', (event) ->
    if event.keyCode is 13
      message = event.target.value
      room_id = $('[data-room]').data().room
      App.room.send_message(room_id, message)
      $('[data-input="message"]').val ''
      return false