class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    	ActionCable.server.broadcast "room:#{message.room_id}", { my_message: render_current_user_message(message), other_message: render_other_users_message(message), room_id: message.room_id, user_id: message.user_id, message_id: message.id}
  end

  private
    def render_current_user_message(message)
      ApplicationController.renderer.render(partial: 'messages/current_user_message', locals: { message: message })
    end

    def render_other_users_message(message)
      ApplicationController.renderer.render(partial: 'messages/other_users_message', locals: { message: message })
    end
end
