class ReadChannel < ApplicationCable::Channel
  def subscribed
    stream_from "read_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_read(data)
  	ActionCable.server.broadcast "read_channel", {message_id: data["message_id"]}
  end
end
