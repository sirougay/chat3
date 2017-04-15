class RoomChannel < ApplicationCable::Channel
  def subscribed
    Room.all.each do |room|
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
