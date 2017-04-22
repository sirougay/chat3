App.room = App.cable.subscriptions.create "RoomChannel",
  received: (data) ->
    if data["user_id"] is $("[data-room = '#{data.room_id}']").data('user')
      $("[data-room = '#{data.room_id}']").append data["my_message"]
    else
      $("[data-room = '#{data.room_id}']").append data["other_message"]

  send_message: (content, room_id, speaker_id) ->
    @perform "send_message", {room_id: room_id, content: content, speaker_id: speaker_id}

  input_message = () ->
    content = $('#message-content').val()
    room_id = $('[data-room]').data().room
    speaker_id = $('#message-content').data('speaker')
    App.room.send_message(content, room_id, speaker_id)
    $('#message-content').val ''
    return false

  $(document).on 'keypress', '#message-content', (event) ->
    if event.keyCode is 13
      input_message()

  $(document).on 'click','#submit-message', () ->
    input_message()