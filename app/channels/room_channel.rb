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
    Message.create!(user: current_user, content: data["content"], room_id: data["room_id"])
  end
end
