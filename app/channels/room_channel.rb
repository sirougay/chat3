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
    watcher_id = current_user.id
    message = Message.create!(content: data["content"], room_id: data["room_id"], user_id: data["speaker_id"])
    MessageBroadcastJob.perform_later(message, watcher_id)
  end
end
