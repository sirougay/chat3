class Message < ApplicationRecord
	belongs_to :user
	belongs_to :room
	after_create_commit { MessageBroadcastJob.perform_later self }
	validates :content, presence: true
	validates :user_id, presence: true
	validates :room_id, presence: true
end
