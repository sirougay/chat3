App.room = App.cable.subscriptions.create "RoomChannel",
  received: (data) ->
    $("[data-room = '#{data.room_id}']").append data["message"]

  send_message: (room_id, message) ->
    @perform "send_message", {room_id: room_id, content: message}

  input_message = () ->
    message = $('#message-content').val()
    room_id = $('[data-room]').data().room
    App.room.send_message(room_id, message)
    $('#message-content').val ''
    return false

  $(document).on 'keypress', '#message-content', (event) ->
    if event.keyCode is 13
      input_message()

  $(document).on 'click','#submit-message', () ->
    input_message()