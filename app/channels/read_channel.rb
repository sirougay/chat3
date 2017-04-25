class ReadChannel < ApplicationCable::Channel
  def subscribed
    stream_from "read_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def read_message(data)
    Read.create!(message_id: data["message_id"], reader_id: data["reader_id"])
    ActionCable.server.broadcast "read_channel", {message_id: data["message_id"]}
  end

  def read_messages(data)
    room = Room.find(data["room_id"])
    room.messages.each do |message|
      if current_user.id == message.user_id
      	unless message.reads.exists?(reader_id: current_user.id)
        	read = message.reads.create(reader_id: current_user.id)
        	ActionCable.server.broadcast "read_channel", {message_id: read.message_id}
        end
      end
    end
  end
end
