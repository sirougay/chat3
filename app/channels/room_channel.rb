class RoomChannel < ApplicationCable::Channel
  def subscribed
    #現在のユーザーの部屋のみを購読
    current_user.rooms.each do |room|
      stream_from "room:#{room.id}"
    end
  end


  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    Message.create!(content: data["content"], room_id: data["room_id"], user_id: data["speaker_id"])
  end

  def read_message(data)
    Read.create!(message_id: data["message_id"], reader_id: data["reader_id"])
  end
end
