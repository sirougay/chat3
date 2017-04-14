class RoomChannel < ApplicationCable::Channel
	def subscribed
    stream_from "room-#{params['room']}:room"
  end


  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    Message.create!(user: current_user, content: data["message"], room_id: data["room_id"])
  end
end
