class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message, user)
  	if user.id == message.user_id
    	ActionCable.server.broadcast "room:#{message.room_id}", { message: render_current_user_message(message), room_id: message.room_id}
    else
    	ActionCable.server.broadcast "room:#{message.room_id}", { message: render_other_users_message(message), room_id: message.room_id}
    end
  end

  private
    def render_current_user_message(message)
      ApplicationController.renderer.render(partial: 'messages/current_user_message', locals: { message: message })
    end

    def render_other_users_message(message)
      ApplicationController.renderer.render(partial: 'messages/other_users_message', locals: { message: message })
    end
end
