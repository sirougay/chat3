class ReadChannel < ApplicationCable::Channel
  def subscribed
    #現在のユーザーの部屋のみを購読
    current_user.rooms.each do |room|
    	stream_from "room:#{room.id}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_read(data)
  	ActionCable.server.broadcast "room:#{message.room_id}", {room_id: data["room_id"], message_id: data["message_id"]}
  end
end
